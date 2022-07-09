-- nvim-lspconfig.lua
-- Author: Ben Tilley
-- Created: 2022-07-09
-- nvim-lspconfig Plugin Settings

local lsp_mappings = require("mappings").lsp_mappings

-- JSON
require("lspconfig").jsonls.setup({ on_attach = lsp_mappings })

-- Lua
require("lspconfig").sumneko_lua.setup({ on_attach = lsp_mappings })
