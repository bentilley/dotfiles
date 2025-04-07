-- gitsigns.lua
-- Author: Ben Tilley
-- Created: 2022-07-23
-- gitsigns Plugin Settings

-- constants

local mappings = require("mappings")

-- settings

require("gitsigns").setup({
	-- Text and highligh groups to use for gitsigns' assets.
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},

	-- callback to run when the plugin attaches to a buffer
	on_attach = mappings.setup_gitsigns_mappings,

	signs_staged_enable = true,

	-- show synbols in the sign column
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`

	-- show line number highlights
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`

	-- show line highlights
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`

	-- highlight intra-line word differences in the buffer
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

	watch_gitdir = {
		follow_files = true,
	},

	auto_attach = true,
	attach_to_untracked = false,

	-- show a customisable blame annotation at the end of the current line
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`

	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},

	-- format of the blame to show
	current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)

	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})
