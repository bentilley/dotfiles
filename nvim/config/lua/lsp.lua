-- nvim-lspconfig.lua
-- Author: Ben Tilley
-- Created: 2022-07-09
-- nvim-lspconfig Plugin Settings

-- perform nvim-cmp setup before nvim-lspconfig setup
-- require("plugins.settings.nvim-cmp")

-- setup

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- language server configs

-- default
vim.lsp.config("*", { capabilities = capabilities })

-- Python
vim.lsp.config("pyright", {
	capabilities = vim.tbl_deep_extend("force", capabilities, {
		-- don't request the additional diagnostic output
		textDocument = { publishDiagnostics = { tagSupport = { valueSet = { 2 } } } },
	}),
})

-- SQL
vim.lsp.config("sqlls", {
	on_attach = function(client, bufnr)
		-- separate plugin required to access language server functionality
		-- see: https://github.com/nanotee/sqls.nvim
		require("sqls").on_attach(client, bufnr)
	end,
})

vim.lsp.enable({
	"ccls", -- brew install ccls
	"cssls", -- npm install -g vscode-langservers-extracted
	"dockerls", -- npm install -g dockerfile-language-server-nodejs
	"gopls", -- go install golang.org/x/tools/gopls@latest
	"html", -- npm install -g vscode-langservers-extracted
	"emmet_language_server", -- npm install -g @olrtg/emmet-language-server
	"jdtls", -- brew install jdtls
	"jsonls", -- npm install -g vscode-langservers-extracted
	"lua_ls", -- brew install lua-language-server
	"pyright", -- pip install pyright
	"r_language_server", -- install.packages("languageserver")
	"rust_analyzer", -- rustup component add rust-analyzer
	"sqlls", -- go install github.com/lighttiger2505/sqls@latest
	"terraformls", -- brew install hashicorp/tap/terraform-ls
	"tflint", -- brew install tflint
	"texlab", -- brew install texlab
	"ts_ls", -- npm install -g typescript typescript-language-server
	"vimls", -- npm install -g vim-language-server
})
