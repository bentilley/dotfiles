-- rainbow-delimiters-nvim.lua
-- Author: Ben Tilley
-- Created: 2025-06-29
-- rainbow-delimiters.nvim Plugin Settings

-- settings

vim.g.rainbow_delimiters = {
	strategy = {
		[""] = "rainbow-delimiters.strategy.global",
		commonlisp = "rainbow-delimiters.strategy.local",
		vim = "rainbow-delimiters.strategy.local",
	},
	query = {
		[""] = "rainbow-delimiters",
		lua = "rainbow-blocks",
	},
	priority = {
		[""] = 110,
		lua = 210,
	},
	highlight = {
		"RainbowDelimiterRed",
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
	-- blacklist = { "c", "cpp" },
}
