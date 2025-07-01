-- ftdetect.lua
-- Author: Ben Tilley
-- Created: 2024-03-27
-- Neovim File Type Detection

vim.filetype.add({
	extension = {
		plantuml = "plantuml",
		pu = "plantuml",
		puml = "plantuml",
		uml = "plantuml",
	},
	filename = {
		[".envrc"] = "sh",
	},
})
