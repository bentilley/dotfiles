-- formatter-nvim.lua
-- Author: Ben Tilley
-- Created: 2022-07-02
-- formatter.nvim Plugin Settings

-- local util = require("formatter.util")
local M = {}

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		bash = {
			require("formatter.filetypes.sh").shfmt,
		},
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},
		css = {
			require("formatter.filetypes.css").prettier,
		},
		go = {
			require("formatter.filetypes.go").goimports,
			require("formatter.filetypes.go").gofumpt,
			require("formatter.filetypes.go").golines,
		},
		java = {
			require("formatter.filetypes.java").google_java_format,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		json = {
			require("formatter.filetypes.json").jq,
			-- brew install jq
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		ocaml = {
			require("formatter.filetypes.ocaml").ocamlformat,
		},
		perl = {
			require("formatter.filetypes.perl").perltidy,
		},
		python = {
			require("formatter.filetypes.python").ruff,
			require("formatter.filetypes.python").iruff,
		},
		r = {
			require("formatter.filetypes.r").styler,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		scss = {
			require("formatter.filetypes.css").prettier,
		},
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
		sql = {
			require("formatter.filetypes.sql").pgformat,
		},
		terraform = {
			require("formatter.filetypes.terraform").terraformfmt,
		},
		tex = {
			require("formatter.filetypes.tex").latexindent,
			-- brew install latexindent
		},
		toml = {
			require("formatter.filetypes.toml").taplo,
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
		zsh = {
			require("formatter.filetypes.sh").shfmt,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- only run the formatting if the buffer doesn't define the formatter_nvim_disabled variable
function M.format_write_if_enabled()
	if not vim.b.formatter_nvim_disabled then
		vim.api.nvim_command("FormatWrite")
	end
end

-- toggle the formatter on and off for current buffer
function M.toggle_formatter_disabled()
	if not vim.b.formatter_nvim_disabled then
		vim.b.formatter_nvim_disabled = true
	else
		vim.b.formatter_nvim_disabled = not vim.b.formatter_nvim_disabled
	end
end

return M
