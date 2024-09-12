-- treesj.lua
-- Author: Ben Tilley
-- Created: 2024-09-02
-- treesj Plugin Settings

local treesj = require("treesj")

treesj.setup({
	---@type boolean Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
	use_default_keymaps = false,
	check_syntax_error = true,
	max_join_length = 120,

	---Cursor behavior:
	---hold - cursor follows the node/place on which it was called
	---start - cursor jumps to the first symbol of the node being formatted
	---end - cursor jumps to the last symbol of the node being formatted
	---@type 'hold'|'start'|'end'
	cursor_behavior = "hold",

	notify = true,
	dot_repeat = true,
	-- on_error = nil,
	---@type table Presets for languages
	-- langs = {}, -- See the default presets in lua/treesj/langs
})

return treesj
