-- lsp-status.lua
-- Author: Ben Tilley
-- Created: 2022-07-22
-- lsp-status Plugin Settings

-- constants

local lsp_status = require("lsp-status")
local util = require("lsp-status.util")

-- configuration

lsp_status.config({
	current_function = true,
	show_filename = true,

	-- An optional handler of the form function(cursor_pos, document_symbol)
	-- that should return true if document_symbol (a DocumentSymbol) should be
	-- accepted as the symbol currently containing the cursor.
	select_symbol = function(cursor_pos, symbol)
		if symbol.valueRange then
			local value_range = {
				["start"] = {
					character = 0,
					line = vim.fn.byte2line(symbol.valueRange[1]),
				},
				["end"] = {
					character = 0,
					line = vim.fn.byte2line(symbol.valueRange[2]),
				},
			}

			return util.in_range(cursor_pos, value_range)
		end
	end,

	-- strings to show as diagnostic warnings
	status_symbol = " *",
	indicator_errors = "E",
	indicator_warnings = "W",
	indicator_info = "i",
	indicator_hint = "?",
	indicator_ok = "Ok",
})

lsp_status.register_progress()

return lsp_status
