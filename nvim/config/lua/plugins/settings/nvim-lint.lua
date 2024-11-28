-- nvim-lint.lua
-- Author: Ben Tilley
-- Created: 2024-11-13
-- nvim-lint Async Linter Plugin

require("lint").linters_by_ft = {
	bash = { "shellcheck" },
	css = { "stylelint" },
	go = { "golangcilint" },
	html = { "stylelint", "vale" },
	javascript = { "eslint" },
	javascriptreact = { "eslint" },
	less = { "stylelint" },
	markdown = { "markdownlint-cli2", "vale" },
	python = { "flake8", "mypy" },
	sh = { "shellcheck" },
	sql = { "sqlfluff" },
	tex = { "lacheck" },
	typescript = { "eslint" },
	typescriptreact = { "eslint" },
	vim = { "vint" },
	zsh = { "shellcheck" },
}
