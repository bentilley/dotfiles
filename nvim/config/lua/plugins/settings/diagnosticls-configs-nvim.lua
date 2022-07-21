-- diagnosticls-configs-nvim.lua
-- Author: Ben Tilley
-- Created: 2022-07-15
-- diagnosticls-configs-nvim Plugin Settings

local dlsconfig = require("diagnosticls-configs")

-- linters

local cpplint = require("diagnosticls-configs.linters.cpplint")
-- brew install cpplint
local eslint = require("diagnosticls-configs.linters.eslint")
-- npm install eslint
local flake8 = require("diagnosticls-configs.linters.flake8")
-- pip install flake8
local golangci_lint = require("diagnosticls-configs.linters.golangci_lint")
-- brew install golangci-lint
local mypy = require("diagnosticls-configs.linters.mypy")
-- pip install mypy
local shellcheck = require("diagnosticls-configs.linters.shellcheck")
-- brew install shellcheck

-- formatters

-- local gofumpt = require("diagnosticls-configs.formatters.gofumpt")

-- constants

local setup_lsp_mappings = require("mappings").setup_lsp_mappings
local setup_lsp_autocommands = require("autocommands").setup_lsp_autocommands

local function on_attach(client, bufnr)
	setup_lsp_mappings(client, bufnr)
	setup_lsp_autocommands(client, bufnr)
end

dlsconfig.init({ on_attach = on_attach })

-- formatter and linter configs

dlsconfig.setup({
	["bash"] = {
		linter = { shellcheck },
	},
	["cpp"] = {
		linter = { cpplint },
	},
	["go"] = {
		linter = { golangci_lint },
		-- formatter = { gofumpt },
	},
	["javascript"] = {
		linter = { eslint },
	},
	["javascriptreact"] = {
		linter = { eslint },
	},
	["python"] = {
		linter = { flake8, mypy },
	},
	["sh"] = {
		linter = { shellcheck },
	},
	["zsh"] = {
		linter = { shellcheck },
	},
})
