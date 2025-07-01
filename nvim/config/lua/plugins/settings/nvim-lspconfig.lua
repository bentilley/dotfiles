-- nvim-lspconfig.lua
-- Author: Ben Tilley
-- Created: 2022-07-09
-- nvim-lspconfig Plugin Settings

-- perform nvim-cmp setup before nvim-lspconfig setup
require("plugins.settings.nvim-cmp")

-- constants

local setup_lsp_mappings = require("mappings").setup_lsp_mappings
local setup_lsp_autocommands = require("autocommands").setup_lsp_autocommands

-- setup

local function on_attach(client, bufnr)
	setup_lsp_mappings(client, bufnr)
	setup_lsp_autocommands(client, bufnr)
end

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- language server configs

-- C++
require("lspconfig").ccls.setup({ on_attach = on_attach, capabilities = capabilities })
-- brew install ccls

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
require("lspconfig").emmet_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
-- npm install -g @olrtg/emmet-language-server

-- Java
require("lspconfig").jdtls.setup({ on_attach = on_attach, capabilities = capabilities })
-- brew install jdtls

-- JSON
require("lspconfig").jsonls.setup({ on_attach = on_attach, capabilities = capabilities })
-- npm install -g vscode-langservers-extracted

-- Lua
require("lspconfig").lua_ls.setup({ on_attach = on_attach, capabilities = capabilities })
-- brew install lua-language-server

-- Python
require("lspconfig").pyright.setup({
	on_attach = on_attach,
	capabilities = vim.tbl_deep_extend("force", capabilities, {
		-- don't request the additional diagnostic output
		textDocument = { publishDiagnostics = { tagSupport = { valueSet = { 2 } } } },
	}),
})
-- pip install pyright

-- R
require("lspconfig").r_language_server.setup({ on_attach = on_attach, capabilities = capabilities })
-- install.packages("languageserver")

-- Rust
require("lspconfig").rust_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })
-- rustup component add rust-analyzer

-- SQL
require("lspconfig").sqlls.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- separate plugin required to access language server functionality
		-- see: https://github.com/nanotee/sqls.nvim
		require("sqls").on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})
-- go install github.com/lighttiger2505/sqls@latest

-- Terraform
require("lspconfig").terraformls.setup({ on_attach = on_attach, capabilities = capabilities })
-- brew install hashicorp/tap/terraform-ls
require("lspconfig").tflint.setup({ on_attach = on_attach, capabilities = capabilities })
-- brew install tflint

-- LaTeX
require("lspconfig").texlab.setup({ on_attach = on_attach, capabilities = capabilities })
-- brew install texlab

-- Typescript
require("lspconfig").ts_ls.setup({ on_attach = on_attach, capabilities = capabilities })
-- npm install -g typescript typescript-language-server

-- Vim
require("lspconfig").vimls.setup({ on_attach = on_attach, capabilities = capabilities })
-- npm install -g vim-language-server
