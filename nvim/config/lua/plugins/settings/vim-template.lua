-- vim-template.lua
-- Author: Ben Tilley
-- Created: 2022-10-27
-- vim-template Plugin Settings

-- settings

vim.g.templates_no_autocmd = 1
vim.g.templates_directory = { "~/.config/nvim/templates" }
vim.g.templates_no_builtin_templates = 1
vim.g.templates_user_variables = { { "FILE_TITLE", "Template_GetFileTitle" } }

-- functions

vim.cmd([[
function Template_GetFileTitle()
	return "file title... you should work on this."
endfunction
]])
