-- nvim-lspconfig.lua
-- Author: Ben Tilley
-- Created: 2022-07-09
-- nvim-lspconfig Plugin Settings

-- constants

local setup_lsp_mappings = require("mappings").setup_lsp_mappings
local setup_lsp_autocommands = require("autocommands").setup_lsp_autocommands

local function on_attach(client, bufnr)
	setup_lsp_mappings(client, bufnr)
	setup_lsp_autocommands(client, bufnr)
end

-- language server configs

-- Docker
require("lspconfig").dockerls.setup({ on_attach = on_attach })
-- npm install -g dockerfile-language-server-nodejs

-- Go
require("lspconfig").gopls.setup({ on_attach = on_attach })
-- go install golang.org/x/tools/gopls@latest

-- JSON
require("lspconfig").jsonls.setup({ on_attach = on_attach })
-- npm install -g vscode-langservers-extracted

-- Lua
require("lspconfig").sumneko_lua.setup({ on_attach = on_attach })
-- brew install lua-language-server

-- Python
require("lspconfig").pyright.setup({ on_attach = on_attach })
-- pip install pyright

-- Typescript
require("lspconfig").tsserver.setup({ on_attach = on_attach })
-- npm install -g typescript typescript-language-server
