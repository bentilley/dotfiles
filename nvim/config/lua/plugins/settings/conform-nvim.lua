-- conform-nvim.lua
-- Author: Ben Tilley
-- Created: 2025-11-06
-- conform.nvim Plugin Settings

local M = {}
local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		bash = { "shfmt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		css = { "prettier" },
		go = { "goimports", "gofumpt", "golines" },
		java = { "google-java-format" },
		javascript = { "prettierd", "prettier", storp_after_first = true },
		json = { "jq" },
		lua = { "stylua" },
		ocaml = { "ocamlformat" },
		perl = { "perltidy" },
		python = function(bufnr)
			if require("conform").get_formatter_info("ruff_format", bufnr).available then
				return { "ruff_organize_imports", "ruff_fix", "ruff_format" }
			else
				return { "isort", "black" }
			end
		end,
		r = { "styler" },
		rust = { "rustfmt" },
		scss = { "prettier" },
		sh = { "shfmt" },
		sql = { "pg_format" },
		terraform = { "terraform_fmt" },
		tex = { "latexindent" },
		toml = { "taplo" },
		typescript = { "prettierd", "prettier", storp_after_first = true },
		typescriptreact = { "prettierd", "prettier", storp_after_first = true },
		yaml = { "prettier" },
		zsh = { "shfmt" },
		["_"] = { "trim_newlines", "trim_whitespace" },
	},
})

-- setup keymap for formatting
vim.keymap.set(
	"n",
	"<Plug>(conform-nvim-format)",
	conform.format,
	{ noremap = true, silent = true }
)

-- only run the formatting if the buffer doesn't define the formatter_nvim_disabled variable
function M.format_if_enabled(args)
	if not vim.b.formatting_disabled then
		conform.format({ bufnr = args.buf })
	end
end

-- toggle the formatter on and off for current buffer
function M.toggle_formatting()
	if not vim.b.formatting_disabled then
		vim.b.formatting_disabled = true
	else
		vim.b.formatting_disabled = not vim.b.formatting_disabled
	end
end

return M
