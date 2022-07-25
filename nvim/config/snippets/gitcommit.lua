-- gitcommit.lua
-- Author: Ben Tilley
-- Created: 2022-07-25
-- Git commit snippets for LuaSnip

local ls = require("plugins.settings.luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
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
	s({ trig = "(%a+)", regTrig = true }, {
		f(function(_, snip)
			return snip.captures[1]
		end, {}, {}),
		t("("),
		i(1),
		t("): "),
		i(0),
		t({ "", "", "# " }),
		f(function(_, snip)
			local TYPE_DESCRIPTION = {
				build = "Changes that affect the build system or external dependencies",
				ci = "Changes to our CI configuration files and scripts",
				docs = "Documentation only changes",
				feat = "A new feature",
				fix = "A bug fix",
				perf = "A code change that improves performance",
				refactor = "A code change that neither fixes a bug nor adds a feature",
				style = "Changes that do not affect the meaning of the code (e.g. formatting)",
				test = "Adding missing tests or correcting existing tests",
				wip = "Work in progress (to be squashed later)",
			}
			return TYPE_DESCRIPTION[snip.captures[1]]
		end, {}, {}),
	}),
}, {}
