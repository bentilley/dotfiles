-- plugins.lua
-- Author: Ben Tilley
-- Created: 2022-05-08
-- Neovim Settings & Configuration

-- constants

local opts = vim.opt
local g = vim.g


-- boolean options

opts.autoread       = true
opts.autoindent     = true
-- opts.equalalways    = false
opts.expandtab      = true
opts.hidden         = true
opts.hlsearch       = true
opts.ignorecase     = true
opts.incsearch      = true
opts.lazyredraw     = true
opts.modeline       = true
opts.number         = true
opts.relativenumber = true
opts.ruler          = true
opts.shiftround     = true
opts.showmatch      = true
opts.showmode       = true
opts.showcmd        = true
opts.smartcase      = true
opts.smartindent    = true
opts.wildmenu       = true
-- opts.termguicolors  = true


-- non-boolean options

-- vim.api.nvim_command([[filetype plugin indent on]])

opts.backspace      = 'indent,eol,start'
opts.completeopt    = "menu,menuone,noselect,preview"
opts.formatoptions  = 'tcqj1'
opts.foldlevelstart = 99
opts.foldmethod     = 'indent'
opts.shiftwidth     = 2
opts.softtabstop    = 2
opts.scrolloff      = 2
opts.statusline     = '%< %n:%f %m%r%y%=%-35.(line: %l of %L, col: %c%V (%P)%)'
-- opts.syntax         = 'on'
opts.tabstop        = 4
opts.wildmode       = 'longest,full'
-- opts.wildignore     = '*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*'


-- other variables

g.mapleader = '<Space>'
g.maplocalleader = ';'
-- NOTE: plugin clever-f re-maps original ';' usage to multiple f presses

-- colorscheme squeedom
-- set complete-=i                         " removes indluded files from search
-- set listchars=eol:$,space:.,tab:<->,trail:%,precedes:<,extends:>
-- set notagrelative                        " tags not followed relative to tag file
-- set path=$PWD/**
-- set sidescroll=5
-- set tags+=./.git/tags
-- set timeoutlen=1000 ttimeoutlen=0        " exit visual faster
-- set undodir^=~/.config/vim/extra/undo//  " set a directory for undo files
-- set undofile
-- set viewdir=~/.config/vim/views          " set a directory for view files

