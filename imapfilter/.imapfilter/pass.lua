-------------
--  Utils  --
-------------

-- Utilities for the imapfilter config file

local M = {}

-- get_password()
-- Retrieves password data from the `pass` command.
--   @name - the `pass-name` that you would like to show.
function M.show(name)
	local pass = io.popen("pass show " .. name, "r")
	if pass == nil then
		return nil
	else
		local res = pass:read("*all")
		return string.gsub(res, "\n", "")
	end
end

-- -- countMessages()
-- -- Count the number of messages returned by the imapfilter API
-- --   @messageResults - the results of an imapfilter method call
-- function countMessages(messageResults)
-- 	local count = 0
-- 	for k, v in ipairs(messageResults) do
-- 		count = count + 1
-- 	end
-- 	return count
-- end

return M
