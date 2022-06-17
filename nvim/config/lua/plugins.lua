-- plugins.lua
-- Author: Ben Tilley
-- Created: 2022-05-08
-- Auto install plugin manager

-- constants

local fn = vim.fn
local data_dir = fn.stdpath('data') .. '/site'
local plugins = {}


-- packer.vim
-- https://github.com/wbthomason/packer.nvim

-- install packer.vim if not already installed
function install_packer()
  local install_path = data_dir .. '/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
    packer_bootstrapped = fn.system(
      {
        'git', 'clone',
        '--depth', '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
      }
    )
  end
  vim.cmd("packadd packer.nvim")
end

-- packer.vim setup
function plugins.packer()
  install_packer()

  require('packer').startup(function()
    use 'wbthomason/packer.nvim'
  end)
end


-- vim-plug
-- https://github.com/junegunn/vim-plug

-- install vim-plug if not already installed
function install_vim_plug()
  local install_path = data_dir .. '/autoload/plug.vim'
  if fn.empty(fn.glob(install_path)) > 0 then
    vim.api.nvim_echo({ { "Installing vim-plug", "Type" } }, true, {})
    packer_bootstrapped = fn.system(
      {
        'curl',
	'--fail',
	'--location',
	'--output', install_path,
	'--create-dirs',
	'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      }
    )
  end
end

-- packer.vim setup
function plugins.vim_plug()
  install_vim_plug()

  -- from https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
  local Plug = vim.fn['plug#']
  
  vim.call('plug#begin', data_dir .. '/plugged')
  
  Plug('rhysd/clever-f.vim ')
  Plug('tpope/vim-commentary')
  Plug('tpope/vim-surround')
  Plug('tpope/vim-unimpaired')
  
  vim.call('plug#end')
end

return plugins
