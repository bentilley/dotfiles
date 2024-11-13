-- sh.lua
-- Author: Ben Tilley
-- Created: 2024-10-02
-- Shell Snippets for LuaSnip

local ls = require("luasnip")
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
	s(
		{ trig = "opts" },
		fmt(
			[=[
			POSITIONAL_ARGS=()

			while [[ $# -gt 0 ]]; do
				  case $1 in
				    -e|--extension)
				      EXTENSION="$2"
				      shift # past argument
				      shift # past value
				      ;;
				    --default)
				      DEFAULT=YES
				      shift # past argument
				      ;;
				    --*|-*)
				      echo "Unknown option $1"
				      exit 1
				      ;;
				    *)
				      POSITIONAL_ARGS+=("$1") # save positional arg
				      shift # past argument
				      ;;
				  esac
			done

			set -- "${{POSITIONAL_ARGS[@]}}" # restore positional parameters
			]=],
			{}
		)
	),
}, {}
