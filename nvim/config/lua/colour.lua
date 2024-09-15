-- colour.lua
-- Author:  Ben Tilley
-- Created: 2022-06-24
-- Colour settings

local M = {}

-- settings

vim.cmd([[silent! colorscheme squeedom]])
vim.cmd([[silent! syntax off]])

-- functions

-- Show the syntax highlighting group of the word the you are hovering over.
function M.show_syntax_group()
	local line = vim.fn.line(".")
	local col = vim.fn.col(".")
	local hi = vim.fn.synIDattr(vim.fn.synID(line, col, 1), "name")
	local trans = vim.fn.synIDattr(vim.fn.synID(line, col, 0), "name")
	local lo = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.synID(line, col, 0)), "name")
	print("hi<" .. hi .. "> trans<" .. trans .. "> lo<" .. lo .. ">")
end

return M
