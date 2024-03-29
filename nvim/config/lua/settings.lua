-- plugins.lua
-- Author: Ben Tilley
-- Created: 2022-05-08
-- Neovim Settings & Configuration

-- constants

local opt = vim.opt

-- boolean options

opt.autoindent = true
opt.autoread = true
opt.cursorline = true
opt.expandtab = true
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.lazyredraw = true
opt.modeline = true
opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.shiftround = true
opt.showcmd = true
opt.showmatch = true
opt.showmode = true
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.wildmenu = true

-- non-boolean options

opt.backspace = { "indent", "eol", "start" }
opt.complete = opt.complete - "i"
opt.completeopt = { "menu", "menuone", "noselect", "preview" }
opt.cursorlineopt = { "number" }
opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.formatoptions = "tcqj1"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.listchars = {
	eol = "↴",
	space = ".",
	tab = "<->",
	trail = "%",
	precedes = "<",
	extends = ">",
}
opt.path = opt.path + (vim.env.PWD .. "/**")
opt.scrolloff = 2
opt.shiftwidth = 2
opt.sidescroll = 5
opt.softtabstop = 2
opt.spelllang = "en_gb"
opt.spellfile = (vim.env.HOME .. "/.config/nvim/spell/en.utf-8.add")
opt.tabstop = 4
opt.tag = opt.tag + "./.git/tags"
opt.timeoutlen = 500
opt.ttimeoutlen = 0
opt.wildmode = { "longest", "full" }

-- old settings graveyard
-- keeping them here incase I need them later :)

-- opt.tagrelative = false
-- opt.termguicolors  = true
-- opt.wildignore     = '*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*'
