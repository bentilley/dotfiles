-- lualine-nvim.lua
-- Author: Ben Tilley
-- Created: 2025-07-01
-- lualine.nvim Plugin Settings

-- theme

local theme = {
	normal = {
		a = "Conceal",
		b = "StatusLineNC",
		c = "StatusLine",
	},
	inactive = {
		a = "StatusLineNC",
		b = "StatusLineNC",
		c = "StatusLineNC",
	},
	-- insert = {},
	-- visual = {},
	-- replace = {},
	-- command = {},
}

-- settings

require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = theme,
		-- component_separators = { left = "", right = "" },
		component_separators = "",
		-- section_separators = { left = "", right = "" },
		section_separators = "",
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = { "encoding", "fileformat" },
		lualine_b = { "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "lsp_status", "filetype" },
		lualine_y = { "filesize", "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
