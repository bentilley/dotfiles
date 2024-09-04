-- init.lua
-- Author:  Ben Tilley
-- Created: 2022-05-08
-- My NeoVim Setup

require("colour")
require("ftdetect")
require("plugins").vim_plug()
require("plugins.settings")
require("statusline")
require("settings")
require("mappings")
require("autocommands")
