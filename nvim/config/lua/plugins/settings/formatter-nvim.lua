-- formatter-nvim.lua
-- Author: Ben Tilley
-- Created: 2022-07-02
-- formatter.nvim Plugin Settings

-- local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		go = {
			require("formatter.filetypes.go").goimports,
			require("formatter.filetypes.go").gofumpt,
			require("formatter.filetypes.go").golines,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		json = {
			require("formatter.filetypes.json").jq,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
