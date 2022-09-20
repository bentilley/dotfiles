-- python.lua
-- Author: Ben Tilley
-- Created: 2022-09-17
-- Python Snippets for LuaSnip

local ls = require("plugins.settings.luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
-- local m = require("luasnip.extras").m
-- local lambda = require("luasnip.extras").l
-- local postfix = require("luasnip.extras.postfix").postfix

return {
	-- debugger
	s({ trig = "db" }, { t("import pdb; pdb.set_trace()") }),
},
	{
		-- docstring for function
		s(
			{ trig = "ds f" },
			fmt(
				[[
		"""{title}

		{description}

		"""
		]],
				{
					title = i(1, "Title description."),
					description = i(2, "Longer paragraph for more description."),
				}
			)
		),

		-- docstring block
		s(
			{ trig = "ds b" },
			fmt(
				[[
		{title}:
			{param}
		]],
				{ title = i(1, "Args"), param = i(0, "name: description") }
			)
		),

		-- function
		s({ trig = "fn f", name = "function" }, {
			t("def "),
			i(1, "name"),
			t("("),
			i(2),
			t({ "):", "    " }),
			i(3, "pass"),
		}),
	}
