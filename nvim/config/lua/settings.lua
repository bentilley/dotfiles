-- plugins.lua
-- Author: Ben Tilley
-- Created: 2022-05-08
-- Neovim Settings & Configuration

-- boolean options

vim.opt.autoindent = true
vim.opt.autoread = true
-- vim.opt.equalalways    = false
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.modeline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.shiftround = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.smartcase = true
vim.opt.smartindent = true
-- vim.opt.tagrelative = false
-- vim.opt.termguicolors  = true
vim.opt.undofile = true
vim.opt.wildmenu = true

-- non-boolean options

vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.complete = vim.opt.complete - "i"
vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "indent"
vim.opt.formatoptions = "tcqj1"
vim.opt.listchars = { eol = "$", space = ".", tab = "<->", trail = "%", precedes = "<", extends = ">" }
vim.opt.path = vim.opt.path + (vim.env.PWD .. "/**")
vim.opt.scrolloff = 2
vim.opt.shiftwidth = 2
vim.opt.sidescroll = 5
vim.opt.softtabstop = 2
vim.opt.statusline = "%< %n:%f %m%r%y%=%-35.(line: %l of %L, col: %c%V (%P)%)"
vim.opt.tabstop = 4
vim.opt.tag = vim.opt.tag + "./.git/tags"
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.wildmode = { "longest", "full" }
-- vim.opt.wildignore     = '*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*'
