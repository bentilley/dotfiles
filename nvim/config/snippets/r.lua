-- python.lua
-- Author: Ben Tilley
-- Created: 2022-09-17
-- Python Snippets for LuaSnip

local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
-- local i = ls.insert_node
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
	-- debugger
	s({ trig = "srp" }, { t('source("~/.Rprofile")') }),
	s({ trig = "db" }, { t("browser()") }),
	s(
		{ trig = "renv_disable" },
		{ t('if (!as.logical(Sys.getenv("RENV_DISABLE", FALSE))) source("renv/activate.R")') }
	),
}, {}
