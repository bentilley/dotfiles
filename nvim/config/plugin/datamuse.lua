-- datamuse.lua
-- Author:  Ben Tilley
-- Created: 2024-08-27
-- Plugin for interacting with the Datamuse API (https://www.datamuse.com/api/)

local curl = require("plenary.curl")

local api_base = "https://api.datamuse.com/words"

local function request(query)
	local query_string = "?"

	local has_query = false
	for key, value in pairs(query) do
		if has_query then
			query_string = query_string .. "&"
		end
		query_string = query_string .. key .. "=" .. value
	end

	return curl.get(api_base .. query_string)
end

local function rhymes(word)
	local query = { rel_rhy = word }
	return vim.fn.json_decode(request(query).body)
end

local function synonyms(word)
	local query = { rel_syn = word }
	return vim.fn.json_decode(request(query).body)
end

local function popup_for_current_word(query)
	return function()
		local current_buffer = vim.api.nvim_get_current_buf()
		local pos = vim.api.nvim_win_get_cursor(0)
		local current_line = pos[1]

		local word = vim.fn.expand("<cword>")
		local word_rhymes = query(word)

		local buf = vim.api.nvim_create_buf(false, true)
		local lines = {}
		for _, v in pairs(word_rhymes) do
			lines[#lines + 1] = v.word
		end

		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

		vim.keymap.set("n", "<ESC>", function()
			vim.cmd("close")
		end, { buffer = buf, silent = true, noremap = true })
		vim.keymap.set("n", "<CR>", function()
			local selected = vim.fn.expand("<cword>")
			vim.fn.appendbufline(current_buffer, current_line, selected)
			vim.cmd("close")
		end, { buffer = buf, silent = true, noremap = true })

		vim.api.nvim_open_win(buf, true, {
			relative = "cursor",
			width = 20,
			height = 10,
			row = 1,
			col = 1,
			-- border = "single",
			style = "minimal",
		})
	end
end

-- local function rhyme_current_word()
-- 	local current_buffer = vim.api.nvim_get_current_buf()
-- 	local pos = vim.api.nvim_win_get_cursor(0)
-- 	local current_line = pos[1]

-- 	local word = vim.fn.expand("<cword>")
-- 	local word_rhymes = rhymes(word)

-- 	local buf = vim.api.nvim_create_buf(false, true)
-- 	local lines = {}
-- 	for _, v in pairs(word_rhymes) do
-- 		lines[#lines + 1] = v.word
-- 	end

-- 	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

-- 	vim.keymap.set("n", "<CR>", function()
-- 		local selected = vim.fn.expand("<cword>")
-- 		vim.fn.appendbufline(current_buffer, current_line, selected)
-- 		vim.cmd("close")
-- 	end, { buffer = buf, silent = true, noremap = true })

-- 	vim.api.nvim_open_win(buf, true, {
-- 		relative = "cursor",
-- 		width = 20,
-- 		height = 10,
-- 		row = 1,
-- 		col = 1,
-- 		-- border = "single",
-- 		style = "minimal",
-- 	})
-- end

vim.keymap.set(
	"n",
	"<Plug>(datamuse-rhymes)",
	popup_for_current_word(rhymes),
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<Plug>(datamuse-synonyms)",
	popup_for_current_word(synonyms),
	{ noremap = true, silent = true }
)
