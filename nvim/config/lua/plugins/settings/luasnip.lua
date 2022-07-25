-- luasnip.lua
-- Author: Ben Tilley
-- Created: 2022-07-23
-- luasnip snippet Plugin Settings

local luasnip = require("luasnip")

luasnip.config.setup({
	enable_autosnippets = true,
})

require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.dotfiles/nvim/config/snippets" })

return luasnip
