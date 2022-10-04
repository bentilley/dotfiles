-- text-case-nvim.lua
-- Author: Ben Tilley
-- Created: 2022-10-04
-- text-case.nvim Plugin Settings

local textcase = require("textcase")
local prefix = "<Space>cr"

textcase.register_keybindings(
	prefix,
	textcase.api.to_camel_case,
	{ prefix = prefix, quick_replace = "c", operator = "oc", lsp_rename = "C" }
)
textcase.register_keybindings(
	prefix,
	textcase.api.to_constant_case,
	{ prefix = prefix, quick_replace = "n", operator = "on", lsp_rename = "N" }
)
textcase.register_keybindings(
	prefix,
	textcase.api.to_dash_case,
	{ prefix = prefix, quick_replace = "d", operator = "od", lsp_rename = "D" }
)
textcase.register_keybindings(
	prefix,
	textcase.api.to_lower_case,
	{ prefix = prefix, quick_replace = "l", operator = "ol", lsp_rename = "L" }
)
textcase.register_keybindings(
	prefix,
	textcase.api.to_pascal_case,
	{ prefix = prefix, quick_replace = "p", operator = "op", lsp_rename = "P" }
)
textcase.register_keybindings(
	prefix,
	textcase.api.to_snake_case,
	{ prefix = prefix, quick_replace = "s", operator = "os", lsp_rename = "S" }
)
textcase.register_keybindings(
	prefix,
	textcase.api.to_upper_case,
	{ prefix = prefix, quick_replace = "u", operator = "ou", lsp_rename = "U" }
)

return textcase
