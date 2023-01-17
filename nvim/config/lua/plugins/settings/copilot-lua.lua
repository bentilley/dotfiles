-- copilot.lua
-- Author: Ben Tilley
-- Created: 2022-12-06
-- GitHub Copilot Plugin Settings

local copilot = require("copilot")
local copilot_cmp = require("copilot_cmp")

-- constants

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- auto commands

-- setup the copilot server after nvim has loaded
local copilot_setup = augroup("CopilotSetup", { clear = true })
autocmd("VimEnter", {
	group = copilot_setup,
	pattern = "*",
	callback = function()
		vim.defer_fn(function()
			copilot.setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-o>",
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = false,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = "node", -- Node version must be < 18
				server_opts_overrides = {},
			})
			copilot_cmp.setup({
				method = "getCompletionsCycling",
				formatters = {
					label = require("copilot_cmp.format").format_label_text,
					insert_text = require("copilot_cmp.format").format_insert_text,
					preview = require("copilot_cmp.format").deindent,
				},
			})
		end, 100)
	end,
})

return copilot
