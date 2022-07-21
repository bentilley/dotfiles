-- autocommands.lua
-- Author: Ben Tilley
-- Created: 2022-07-02
-- Neovim Auto-commands & Auto-groups

local autocommands = {}

-- constants

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- auto commands

-- auto-format the file on save
local formatter = augroup("FormatterNvim", { clear = true })
autocmd("BufWritePost", { group = formatter, pattern = "*", command = "FormatWrite" })

-- show the lightbuld icon in the gutter when a code action is available.
-- maybe can get rid of this in the future, but useful to learn what is available.
local lightbulb = augroup("LightbulbNvim", { clear = true })
autocmd({ "CursorHold", "CursorHoldI" }, {
	group = lightbulb,
	pattern = "*",
	callback = require("nvim-lightbulb").update_lightbulb,
})

-- This is run in the on_attach function for language servers. We use it to
-- only set up the following autocommands after the language serfer attaches to
-- the current buffer.
function autocommands.setup_lsp_autocommands(client, bufnr)
	if client.resolved_capabilities.document_highlight then
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

return autocommands
