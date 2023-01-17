-- go.lua
-- Author: Ben Tilley
-- Created: 2022-11-15
-- Go Snippets for LuaSnip

local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
-- local m = require("luasnip.extras").m
-- local lambda = require("luasnip.extras").l
-- local postfix = require("luasnip.extras.postfix").postfix

return {
	-- pprof cpu profiler
	s(
		{ trig = "prof" },
		fmt(
			[[
			pprofFile, pprofErr := os.Create("{file}")
			if pprofErr != nil {{
				log.Fatal(pprofErr)
			}}
			pprof.StartCPUProfile(pprofFile)
			defer pprof.StopCPUProfile()
		]],
			{
				file = i(1, "cpu.pprof"),
			}
		)
	),
},
	{
		-- function
		s(
			{ trig = "fn f" },
			fmt(
				[[
		func {name}({args}) {return_type} {{
			{body}
		}}
		]],
				{
					name = i(1, "function"),
					args = i(2, "int n"),
					return_type = i(3, "int"),
					body = f(function(args)
						return [[fmt.Println("]] .. args[1][1] .. [[")]]
					end, ai[1]),
				}
			)
		),
	}
