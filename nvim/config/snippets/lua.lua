-- lua.lua
-- Author: Ben Tilley
-- Created: 2022-07-25
-- Lua Snippets for LuaSnip

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
-- local fmt = require("luasnip.extras.fmt").fmt
-- local m = require("luasnip.extras").m
-- local lambda = require("luasnip.extras").l
-- local postfix = require("luasnip.extras.postfix").postfix

return {
	s({ trig = "trig" }, t("loaded!!")),
}, {
	s(
		{ trig = "fn", name = "basic function" },
		{
			t("local function "),
			i(1, "name"),
			t("("),
			i(2),
			t({ ")", "\t" }),
			i(3),
			t({ "", "end" }),
		}
	),
}
