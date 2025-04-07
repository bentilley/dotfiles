-- plugins.lua
-- Author: Ben Tilley
-- Created: 2022-05-08
-- Auto install plugin manager

-- constants

local data_dir = vim.fn.stdpath("data") .. "/site"
local M = {}

-- vim-plug
-- https://github.com/junegunn/vim-plug

-- install vim-plug if not already installed
local function install_vim_plug()
	local install_path = data_dir .. "/autoload/plug.vim"
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.api.nvim_echo({ { "Installing vim-plug", "Type" } }, true, {})
		local res = vim.fn.system({
			"curl",
			"--fail",
			"--location",
			"--output",
			install_path,
			"--create-dirs",
			"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
		})
		vim.api.nvim_echo({ { res, "Type" } }, true, {})
		vim.cmd.source(install_path)

		return true
	end
	return false
end

-- packer.vim setup
function M.vim_plug()
	local first_install = install_vim_plug()

	-- from https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
	local Plug = vim.fn["plug#"]

	vim.call("plug#begin", data_dir .. "/plugged")

	-- additional lua functions for nvim
	Plug("nvim-lua/plenary.nvim")

	-- additional font icons
	Plug("kyazdani42/nvim-web-devicons")

	-- smart behaviour for `f` key mapping
	Plug("rhysd/clever-f.vim")

	-- additional jump motion to anywhere in the visible buffer
	Plug("phaazon/hop.nvim")

	-- neovim language server configs
	Plug("neovim/nvim-lspconfig")

	-- add lsp information to the statusline
	Plug("nvim-lua/lsp-status.nvim")

	-- additional plugin for sqls language server
	Plug("nanotee/sqls.nvim")

	-- linter runner that integrates with nvim lsp
	Plug("mfussenegger/nvim-lint")

	-- neovim treesitter config
	Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

	-- treesitter utils e.g. view highlight groups
	Plug("nvim-treesitter/playground")

	-- treesitter defined text objects e.g. inner.function etc.
	Plug("nvim-treesitter/nvim-treesitter-textobjects")

	-- autocompletion
	-- possible alternative: https://github.com/ms-jpq/coq_nvim
	Plug("hrsh7th/nvim-cmp")

	-- autocompletion source lsp
	Plug("hrsh7th/cmp-nvim-lsp")

	-- autocompletion source buffer
	Plug("hrsh7th/cmp-buffer")

	-- autocompletion source file path
	Plug("hrsh7th/cmp-path")

	-- autocompletion source command line
	Plug("hrsh7th/cmp-cmdline")

	-- snippets
	Plug("L3MON4D3/LuaSnip")

	-- autocompletion source snippets
	Plug("saadparwaiz1/cmp_luasnip")

	-- additional operators
	Plug("echasnovski/mini.operators")

	-- Github Copilot - AI autocompletion
	Plug("zbirenbaum/copilot.lua")

	-- copilot cmp source
	Plug("zbirenbaum/copilot-cmp")

	-- fixes known issue with the CursorHold event in neovim
	-- remove when this issue is resolved https://github.com/neovim/neovim/issues/12587
	Plug("antoinemadec/FixCursorHold.nvim")

	-- file formatting on save
	Plug("mhartington/formatter.nvim")

	-- add todo comment functionality
	Plug("folke/todo-comments.nvim")

	-- add text case coercion
	Plug("johmsalas/text-case.nvim")

	-- make sure fzf is installed
	Plug("junegunn/fzf", { ["do"] = vim.fn["fzf#install"] })

	-- search functionality
	Plug("nvim-telescope/telescope.nvim")

	-- interact with git in neovim
	Plug("tpope/vim-fugitive")

	-- git decorations in gutter column
	Plug("lewis6991/gitsigns.nvim")

	-- interact with github in nvim
	Plug("pwntester/octo.nvim")

	-- split / join lines based on tree sitter language syntax
	Plug("Wansmer/treesj")

	-- add bracket and other text surrounding commands
	Plug("tpope/vim-surround")

	-- add a bunch of [] mappings for interacting with neovim
	Plug("tpope/vim-unimpaired")

	-- add project configuration using .projections.json file
	Plug("tpope/vim-projectionist")

	-- barebones tmux support for vim
	Plug("tpope/vim-tbone")

	-- async :make functionality
	Plug("tpope/vim-dispatch")

	-- easy tmux interaction for simply running a command
	Plug("preservim/vimux")

	-- add virtual indent lines to see indentation more clearly
	Plug("lukas-reineke/indent-blankline.nvim")

	-- add simple file template functionality
	Plug("aperezdc/vim-template")

	-- html and css abbreviation expansion
	Plug("olrtg/nvim-emmet")

	-- docstring generation
	Plug("danymat/neogen")

	-- plantuml syntax highlighting
	Plug("aklt/plantuml-syntax")

	-- open browser window
	Plug("tyru/open-browser.vim")

	-- preview plantuml file in browser
	Plug("weirongxu/plantuml-previewer.vim")

	-- interactive evaluation e.g. for LISP development
	Plug("Olical/conjure")

	-- Plug("jackMort/ChatGPT.nvim")
	-- Plug("vim-test/vim-test")

	vim.call("plug#end")

	if first_install then
		vim.cmd("PlugInstall")
	end
end

-- packer.vim
-- https://github.com/wbthomason/packer.nvim

-- install packer.vim if not already installed
local function install_packer()
	local install_path = data_dir .. "/pack/packer/start/packer.nvim"
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
		vim.fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
	end
	vim.cmd("packadd packer.nvim")
end

-- packer.vim setup
function M.packer()
	install_packer()

	require("packer").startup(function()
		use("wbthomason/packer.nvim")
	end)
end

return M
