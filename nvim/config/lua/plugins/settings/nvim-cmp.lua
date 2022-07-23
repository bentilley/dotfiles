-- nvim-cmp.lua
-- Author: Ben Tilley
-- Created: 2022-07-23
-- nvim-cmp Autocompletion Plugin Settings

local cmp = require("cmp")
local luasnip = require("plugins.settings.luasnip")

-- setup

cmp.setup({
	-- snippet engine, this is required
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	-- window stylings
	-- window = {
	-- 	completion = cmp.config.window.bordered(),
	-- 	documentation = cmp.config.window.bordered(),
	-- },

	-- key mappings
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		-- Accept currently selected item. Set `select` to `false` to only
		-- confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),

	-- sources to compile list of completion items from.
	-- see list of sources here: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})

-- gitcommit config
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
})

-- / search config
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- : command line config
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

return cmp
