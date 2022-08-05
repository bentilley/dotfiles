-- nvim-lspconfig.lua
-- Author: Ben Tilley
-- Created: 2022-07-09
-- nvim-lspconfig Plugin Settings

local lsp_status = require("plugins.settings.lsp-status")

-- perform nvim-cmp setup before nvim-lspconfig setup
require("plugins.settings.nvim-cmp")

-- constants

local setup_lsp_mappings = require("mappings").setup_lsp_mappings
local setup_lsp_autocommands = require("autocommands").setup_lsp_autocommands

-- setup

lsp_status.register_progress()

local function on_attach(client, bufnr)
	lsp_status.on_attach(client)
	setup_lsp_mappings(client, bufnr)
	setup_lsp_autocommands(client, bufnr)
end

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)

-- language server configs

-- CSS
require("lspconfig").cssls.setup({ on_attach = on_attach, capabilities = capabilities })
-- npm install -g vscode-langservers-extracted

-- Docker
require("lspconfig").dockerls.setup({ on_attach = on_attach, capabilities = capabilities })
-- npm install -g dockerfile-language-server-nodejs

-- Go
require("lspconfig").gopls.setup({ on_attach = on_attach, capabilities = capabilities })
-- go install golang.org/x/tools/gopls@latest

-- HTML
require("lspconfig").html.setup({ on_attach = on_attach, capabilities = capabilities })
-- npm install -g vscode-langservers-extracted

-- JSON
require("lspconfig").jsonls.setup({ on_attach = on_attach, capabilities = capabilities })
-- npm install -g vscode-langservers-extracted

-- Lua
require("lspconfig").sumneko_lua.setup({ on_attach = on_attach, capabilities = capabilities })
-- brew install lua-language-server

-- Python
require("lspconfig").pyright.setup({ on_attach = on_attach, capabilities = capabilities })
-- pip install pyright

-- SQL
require("lspconfig").sqls.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- separate plugin required to access language server functionality
		-- see: https://github.com/nanotee/sqls.nvim
		require("sqls").on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})
-- npm install -g typescript typescript-language-server

-- Typescript
require("lspconfig").tsserver.setup({ on_attach = on_attach, capabilities = capabilities })
-- npm install -g typescript typescript-language-server

-- Vim
require("lspconfig").vimls.setup({ on_attach = on_attach, capabilities = capabilities })
-- npm install -g vim-language-server
