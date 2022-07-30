-- grep.lua
-- Author:  Ben Tilley
-- Created: 2022-07-27
-- Lua for better grep command

local M = {}

-- functions

-- get_grep_cmd compiles the grep command to run.
local function get_grep_cmd(args)
	if #args == 0 then
		args = vim.fn.expand("<cword>")
	end
	return vim.fn.expandcmd(vim.o.grepprg .. " " .. args)
end

-- append_to_lines adds the data to the list of lines, removing any trailing
-- return characters.
local function append_to_lines(lines, data)
	for _, match in ipairs(data) do
		if match ~= "" then
			local m = string.gsub(match, "\r", "", 1)
			table.insert(lines, m)
		end
	end
end

-- grep runs the current grepprg async and pipes the results into the quickfix
-- window. ! means jump to the first location.
function M.grep(args, bang)
	local cmd = get_grep_cmd(args)
	local lines = {}

	-- on_event(job_id, data, event)
	local function on_event(_, data, _)
		if data then
			append_to_lines(lines, data)
		end
	end

	-- on_exit(job_id, data, event)
	local function on_exit(_, _, _)
		vim.fn.setqflist({}, " ", {
			title = vim.o.grepprg,
			lines = lines,
			efm = vim.o.grepformat,
		})
		vim.cmd("doautocmd QuickFixCmdPost")
		vim.cmd("copen")
		if bang == "!" then
			vim.cmd("cfirst")
		end
	end

	vim.cmd("doautocmd QuickFixCmdPre")
	vim.fn.jobstart(cmd, {
		on_stderr = on_event,
		on_stdout = on_event,
		on_exit = on_exit,
		stdout_buffered = true,
		stderr_buffered = true,
		pty = true,
	})
end

function M.lgrep(args, bang)
	local cmd = get_grep_cmd(args)
	local lines = {}

	-- on_event(job_id, data, event)
	local function on_event(_, data, _)
		if data then
			append_to_lines(lines, data)
		end
	end

	-- on_exit(job_id, data, event)
	local function on_exit(_, _, _)
		vim.fn.setloclist(0, {}, " ", {
			title = vim.o.grepprg,
			lines = lines,
			efm = vim.o.grepformat,
		})
		vim.cmd("lopen")
		if bang == "!" then
			vim.cmd("lfirst")
		end
	end

	vim.fn.jobstart(cmd, {
		on_stderr = on_event,
		on_stdout = on_event,
		on_exit = on_exit,
		stdout_buffered = true,
		stderr_buffered = true,
		pty = true,
	})
end

return M
