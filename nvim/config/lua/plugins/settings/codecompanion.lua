-- codecompanion.lua
-- Author: Ben Tilley
-- Created: 2025-03-31
-- codecompanion Plugin Settings

require("codecompanion").setup({
	adapters = {
		gemini = function()
			return require("codecompanion.adapters").extend("gemini", {
				env = {
					api_key = function()
						return os.getenv("GEMINI_API_KEY")
					end,
				},
				schema = {
					model = {
						default = "gemini-2.5-pro-exp-03-25",
					},
				},
			})
		end,
	},
	strategies = {
		chat = {
			adapter = "gemini",
			slash_commands = {
				["file"] = {
					opts = {
						provider = "telescope",
					},
				},
			},
		},
		inline = {
			adapter = "gemini",
		},
		cmd = {
			adapter = "gemini",
		},
	},
})
