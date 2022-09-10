-- octo-nvim.lua
-- Author: Ben Tilley
-- Created: 2022-09-09
-- octo.nvim Plugin Settings

local octo = require("octo")

octo.setup({
	-- reaction_viewer_hint_icon = "", -- marker for user reactions
	-- user_icon = " ", -- user icon
	-- timeline_marker = "", -- timeline marker
	-- timeline_indent = "2", -- timeline indentation
	-- right_bubble_delimiter = "", -- Bubble delimiter
	-- left_bubble_delimiter = "", -- Bubble delimiter
	-- snippet_context_lines = 4, -- number or lines around commented lines
	file_panel = {
		-- size = 10, -- changed files panel rows
		use_icons = true, -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
	},
})
