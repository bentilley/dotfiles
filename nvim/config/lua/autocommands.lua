-- autocommands.lua
-- Author: Ben Tilley
-- Created: 2022-07-02
-- Neovim Auto-commands & Auto-groups

-- constants

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- auto commands

local formatter = augroup("FormatterNvim", { clear = true })
autocmd("BufWritePost", { group = formatter, pattern = "*", command = "FormatWrite" })
