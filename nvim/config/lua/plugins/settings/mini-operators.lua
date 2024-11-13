-- mini-operators.lua
-- Author: Ben Tilley
-- Created: 2024-10-16
-- mini.operator Plugin Settings

local operators = require("mini.operators")

operators.setup({
	-- Evaluate text and replace with output
	evaluate = { prefix = "", func = nil },

	-- Exchange text regions
	exchange = { prefix = "", reindent_linewise = true },

	-- Multiply (duplicate) text
	multiply = { prefix = "", func = nil },

	-- Replace text with register
	replace = { prefix = "", reindent_linewise = true },

	-- Sort text
	sort = { prefix = "", func = nil },
})

-- Make custom mappings
operators.make_mappings("evaluate", { textobject = "g=", line = "g==", selection = "g=" })
operators.make_mappings("exchange", { textobject = "gx", line = "gxx", selection = "gx" })
operators.make_mappings("multiply", { textobject = "gm", line = "gmm", selection = "gm" })
operators.make_mappings("replace", { textobject = "gr", line = "grr", selection = "gr" })
operators.make_mappings("sort", { textobject = "gs", line = "gss", selection = "gs" })

return operators
