-- nvim-treesitter.lua
-- Author: Ben Tilley
-- Created: 2022-07-21
-- nvim-treesitter Plugin Settings

-- treesitter configs

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"dockerfile",
		"go",
		"html",
		"javascript",
		"json",
		"latex",
		"lua",
		"make",
		"markdown",
		"python",
		"query",
		"scss",
		"sql",
		"toml",
		"tsx",
		"vim",
		"vue",
		"yaml",
	},
	sync_install = false,
	auto_install = true,

	-- modules

	-- Consistent syntax highlighting.
	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- disable = { "c", "rust" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	-- Incremental selection based on the named nodes from the grammar
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},

	-- Indentation based on treesitter for the = operator.
	indent = {
		enable = true,
	},

	-- View treesitter information directly in Neovim
	-- see: https://github.com/nvim-treesitter/playground
	playground = {
		enable = true,
		-- keybindings = {
		-- 	toggle_query_editor = "o",
		-- 	toggle_hl_groups = "i",
		-- 	toggle_injected_languages = "t",
		-- 	toggle_anonymous_nodes = "a",
		-- 	toggle_language_display = "I",
		-- 	focus_language = "f",
		-- 	unfocus_language = "F",
		-- 	update = "R",
		-- 	goto_node = "<cr>",
		-- 	show_help = "?",
		-- },
	},

	-- Treesitter textobject configurations
	-- see: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- @assignment.inner
				-- @assignment.lhs
				-- @assignment.outer
				-- @assignment.rhs
				-- @attribute.inner
				-- @attribute.outer
				-- @block.inner
				-- @block.outer
				-- @call.inner
				-- @call.outer
				-- @comment.inner
				-- @comment.outer
				-- @conditional.inner
				-- @conditional.outer
				-- @frame.inner
				-- @frame.outer
				-- @number.inner
				-- @regex.inner
				-- @regex.outer
				-- @scopename.inner
				-- @statement.outer
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["il"] = "@loop.inner",
				["al"] = "@loop.outer",
				["i,"] = "@parameter.inner",
				["a,"] = "@parameter.outer",
				["ir"] = "@return.inner",
				["ar"] = "@return.outer",

				-- You can also use captures from other query groups like `locals.scm`
				-- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
			},

			-- mapping query_strings to modes ('v', 'V', or '<c-v>')
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise, -- blockwise
			},

			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace.
			include_surrounding_whitespace = false,
		},

		-- setup for swapping neighbouring nodes of same type
		-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects#text-objects-swap
		swap = {},

		-- setup for moving to the next/prev node of given type, like bracket
		-- mappings ]f, [f being next func, prev func, etc.
		-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects#text-objects-move
		move = {},

		-- show textobject surrounding definition as determined using Neovim's
		-- built-in LSP in a floating window. Press the shortcut twice to enter
		-- the floating window.
		lsp_interop = {
			enable = true,
			border = "none",
			floating_preview_opts = {},
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dc"] = "@class.outer",
			},
		},
	},
})

-- You can add custom highlight captures with:
-- require("nvim-treesitter.highlight").set_custom_captures({
-- 	-- Highlight the @foo.bar capture group with the "Identifier" highlight group.
-- 	["foo.bar"] = "Identifier",
-- })
