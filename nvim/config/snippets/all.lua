-- all.lua
-- Author: Ben Tilley
-- Created: 2022-11-05
-- All language Snippets for LuaSnip

local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local fmt = require("luasnip.extras.fmt").fmt
-- local m = require("luasnip.extras").m
-- local lambda = require("luasnip.extras").l
-- local postfix = require("luasnip.extras.postfix").postfix

return {
	-- Expands to todays date, e.g. 2022-11-05
	s(
		{ trig = "_today" },
		f(function()
			return os.date("%Y-%m-%d")
		end, {}, {})
	),
	-- Expands to todays date and time, e.g. 2022-11-05 22:17:43
	s(
		{ trig = "_now" },
		f(function()
			return os.date("%Y-%m-%d %H:%M:%S")
		end, {}, {})
	),
},
	{}
