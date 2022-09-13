-- statusline.lua
-- Author:  Ben Tilley
-- Created: 2022-07-22
-- Statusline Setup

local M = {}

-- show if formatting is disabled
function M.is_formatting()
	if not vim.b.formatter_nvim_disabled then
		return "[f]"
	else
		return ""
	end
end

-- statusline config

function M.active()
	return table.concat({
		"%#StatusLinePromptAccent#",
		"  ",
		"%#StatusLineFileAccent#",
		" %n:%f %m%r%y",
		"%{v:lua.require('statusline').is_formatting()}",
		"%#StatusLinePositionInfoAccent#",
		" line: %l of %L, col: %c%V (%P)",
		"%#StatusLine#",
		"%=%#StatusLineLspAccent#",
		"%{v:lua.require('plugins.settings.lsp-status').status()}",
		-- "%.50(%{v:lua.require('plugins.settings.lsp-status').status()}%)",
	})
end

function M.inactive()
	return " %n:%F"
end

return M
