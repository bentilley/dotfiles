-- gitcommit.lua
-- Author:  Ben Tilley
-- Created: 2022-07-23
-- Git commit specific setup

-- non-boolean options

vim.opt_local.complete = vim.opt_local.complete + "k"
vim.opt_local.dictionary = "~/.dotfiles/git/committypes.txt"
