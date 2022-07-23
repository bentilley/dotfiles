-- statusline.lua
-- Author:  Ben Tilley
-- Created: 2022-07-22
-- Statusline Setup

local statusline = {}

-- statusline config

statusline.active = function()
	return table.concat({
		"%#StatusLinePromptAccent#",
		" >> ",
		"%#StatusLineFileAccent#",
		" %n:%f %m%r%y ",
		"%#StatusLinePositionInfoAccent#",
		"line: %l of %L, col: %c%V (%P)",
		"%#StatusLine#",
		"%=%#StatusLineLspAccent#",
		"%{v:lua.require('plugins.settings.lsp-status').status()}",
		-- "%.50(%{v:lua.require('plugins.settings.lsp-status').status()}%)",
	})
end

function statusline.inactive()
	return " %n:%F"
end

return statusline
