-- plugins.lua
-- Author: Ben Tilley
-- Created: 2022-05-08
-- Auto install plugin manager

-- constants

local fn = vim.fn
local data_dir = fn.stdpath("data") .. "/site"
local M = {}

-- vim-plug
-- https://github.com/junegunn/vim-plug

-- install vim-plug if not already installed
local function install_vim_plug()
	local install_path = data_dir .. "/autoload/plug.vim"
	if fn.empty(fn.glob(install_path)) > 0 then
		vim.api.nvim_echo({ { "Installing vim-plug", "Type" } }, true, {})
		fn.system({
			"curl",
			"--fail",
			"--location",
			"--output",
			install_path,
			"--create-dirs",
			"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
		})
	end
end

-- packer.vim setup
function M.vim_plug()
	install_vim_plug()

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

	-- default configurations for diagnostic-languageserver (used with neovim/nvim-lspconfig)
	-- possible alternative: https://github.com/mfussenegger/nvim-lint
	Plug("creativenull/diagnosticls-configs-nvim")

	-- add lsp information to the statusline
	Plug("nvim-lua/lsp-status.nvim")

	-- additional plugin for sqls language server
	Plug("nanotee/sqls.nvim")

	-- neovim treesitter config
	Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

	-- treesitter utils e.g. view highlight groups
	Plug("nvim-treesitter/playground")

	-- show the lightbulb emoji in the gutter when a code action is available
	Plug("kosayoda/nvim-lightbulb")

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

	-- fixes known issue with the CursorHold event in neovim
	-- remove when this issue is resolved https://github.com/neovim/neovim/issues/12587
	Plug("antoinemadec/FixCursorHold.nvim")

	-- file formatting on save
	Plug("mhartington/formatter.nvim")

	-- add commenting actions
	Plug("tpope/vim-commentary")

	-- add todo comment functionality
	Plug("folke/todo-comments.nvim")

	-- add text case coercion
	Plug("johmsalas/text-case.nvim")

	-- make sure fzf is installed
	Plug("junegunn/fzf", { ["do"] = vim.fn["fzf#install"] })

	-- search functionality
	Plug("nvim-telescope/telescope.nvim", { tag = "0.1.0" })

	-- interact with git in neovim
	Plug("tpope/vim-fugitive")

	-- git decorations in gutter column
	Plug("lewis6991/gitsigns.nvim")

	-- interact with github in nvim
	Plug("pwntester/octo.nvim")

	-- add bracket and other text surrounding commands
	Plug("tpope/vim-surround")

	-- add a bunch of [] mappings for interacting with neovim
	Plug("tpope/vim-unimpaired")

	-- add project configuration using .projections.json file
	Plug("tpope/vim-projectionist")

	-- add virtual indent lines to see indentation more clearly
	Plug("lukas-reineke/indent-blankline.nvim")

	-- add simple file template functionality
	-- Plug("aperezdc/vim-template")
	-- TODO: needs some tlc to setup some custom templates for

	-- Plug('vim-test/vim-test')

	vim.call("plug#end")
end

-- packer.vim
-- https://github.com/wbthomason/packer.nvim

-- install packer.vim if not already installed
local function install_packer()
	local install_path = data_dir .. "/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
		fn.system({
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
