-- autocommands.lua
-- Author: Ben Tilley
-- Created: 2022-07-02
-- Neovim Auto-commands & Auto-groups

local M = {}
local formatter_nvim = require("plugins.settings.formatter-nvim")
local lint = require("lint")

-- constants

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local statusline = require("statusline")

-- auto commands

-- run linter async on save
local linter = augroup("NvimLint", { clear = true })
autocmd({ "BufEnter", "BufWritePost" }, {
	group = linter,
	pattern = "*",
	callback = function()
		lint.try_lint()
	end,
})

-- auto-format the file on save
local formatter = augroup("FormatterNvim", { clear = true })
autocmd("BufWritePost", {
	group = formatter,
	pattern = "*",
	-- command = "FormatWrite",
	callback = formatter_nvim.format_write_if_enabled,
})

-- change line number based on mode:
local cmdline = vim.api.nvim_create_augroup("CmdlineLinenr", {})
-- debounce cmdline enter events to make sure we dont have flickering for non
-- user cmdline use e.g. mappings using : instead of <cmd>
local cmdline_debounce_timer

-- change to absolute line numbers for command mode
autocmd("CmdlineEnter", {
	group = cmdline,
	callback = function()
		cmdline_debounce_timer = vim.uv.new_timer()
		cmdline_debounce_timer:start(
			100,
			0,
			vim.schedule_wrap(function()
				if vim.o.number then
					vim.o.relativenumber = false
					vim.api.nvim__redraw({ statuscolumn = true })
				end
			end)
		)
	end,
})
-- change back to relative line numbers for normal mode
autocmd("CmdlineLeave", {
	group = cmdline,
	callback = function()
		if cmdline_debounce_timer then
			cmdline_debounce_timer:stop()
			cmdline_debounce_timer = nil
		end
		if vim.o.number then
			vim.o.relativenumber = true
		end
	end,
})

-- -- sane defaults for terminal mode
-- autocmd("TermOpen", {
-- 	callback = function(ev)
-- 		vim.wo[0].number = false
-- 		vim.wo[0].relativenumber = false
-- 		vim.wo[0].statuscolumn = ""
-- 		vim.wo[0].signcolumn = "no"
-- 		-- immediately hand over control
-- 		vim.cmd.startinsert()
-- 	end,
-- })

-- This is run in the on_attach function for language servers. We use it to
-- only set up the following autocommands after the language serfer attaches to
-- the current buffer.
local function setup_lsp_autocommands(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		local lspauto = augroup("LspAutoGroup", { clear = true })
		autocmd({ "CursorHold", "CursorHoldI" }, {
			group = lspauto,
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		autocmd({ "CursorMoved" }, {
			group = lspauto,
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspAttachGroup", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local bufnr = args.buf

		require("mappings").setup_lsp_mappings(client, bufnr)
		setup_lsp_autocommands(client, bufnr)
	end,
})

-- switch the statusline format for the active window
local statuslinegroup = augroup("StatusLineGroup", { clear = true })
autocmd({ "WinEnter", "BufEnter" }, {
	group = statuslinegroup,
	pattern = "*",
	callback = function()
		vim.wo.statusline = statusline.active()
	end,
})
autocmd({ "WinLeave", "BufLeave" }, {
	group = statuslinegroup,
	pattern = "*",
	callback = function()
		vim.wo.statusline = statusline.inactive()
	end,
})

return M
