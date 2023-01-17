-- nvim-cmp.lua
-- Author: Ben Tilley
-- Created: 2022-07-23
-- nvim-cmp Autocompletion Plugin Settings

local cmp = require("cmp")
local types = require("cmp.types")
local luasnip = require("plugins.settings.luasnip")

-- functions

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0
		and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
			== nil
end

-- setup

-- I took a lot of this from here: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
cmp.setup({
	-- how to display the cmp menu
	view = {
		entries = "native", -- can be "custom", "wildmenu" or "native"
	},

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
	mapping = {
		["<C-n>"] = {
			i = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
		},
		["<C-p>"] = {
			i = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
		},
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),

		-- Accept currently selected item. Set `select` to `false` to only
		-- confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- making autocomplete work with snippets
		-- see https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
		-- If this isn't working for some reason, bear in mind that you mind have to look at
		-- https://github.com/zbirenbaum/copilot-cmp#tab-completion-configuration-highly-recommended
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},

	-- sources to compile list of completion items from.
	-- see list of sources here: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
	sources = cmp.config.sources({
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
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
	view = {
		entries = "custom",
	},
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- : command line config
cmp.setup.cmdline(":", {
	view = {
		entries = "custom",
	},
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

return cmp
