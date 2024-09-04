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
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},

	-- callback to run when the plugin attaches to a buffer
	on_attach = mappings.setup_gitsigns_mappings,

	-- show synbols in the sign column
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`

	-- show line number highlights
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`

	-- show line highlights
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`

	-- highlight intra-line word differences in the buffer
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

	-- show a customisable blame annotation at the end of the current line
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`

	-- format of the blame to show
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

	-- show the old version of hunks inline in the buffer (via virtual lines)
	show_deleted = false, -- Toggle with `:Gitsigns toggle_deleted`
})
