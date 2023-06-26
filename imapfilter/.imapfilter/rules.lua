local M = {}

function M.list_folders(folder)
	return function(account)
		local mailboxes, folders = account:list_all(folder)

		for k, v in pairs(mailboxes) do
			print(k, v)
		end

		for k, v in pairs(folders) do
			print(k, v)
		end
	end
end

function M.move_by_emails(from_folder, to_folder, emails)
	return function(account)
		local inbox = account[from_folder]

		local results = nil
		for _, email in ipairs(emails) do
			if results == nil then
				results = inbox:contain_from(email)
			else
				results = results + inbox:contain_from(email)
			end
		end

		results:move_messages(account[to_folder])
	end
end

-- function M.move_cqf(from_folder, to_folder)
-- 	return function(account)
-- 		local inbox = account[from_folder]
-- 		local results = inbox:contain_from("info@cqf.com") + inbox:contain_from("cqfinstitute@fitchlearning.com")
-- 		results:move_messages(account[to_folder])
-- 	end
-- end

-- function M.move_rollers_theatre_company(from_folder, to_folder)
-- 	return function(account)
-- 		local results = account[from_folder]:contain_from("rollers.theatrecompany@gmail.com")
-- 		results:move_messages(account[to_folder])
-- 	end
-- end

-- function M.move_giffgaff(from_folder, to_folder)
-- 	return function(account)
-- 		local results = account[from_folder]:contain_from("no_reply@info4.giffgaff.com")
-- 			+ account[from_folder]:contain_from("no_reply@info3.giffgaff.com")
-- 		results:move_messages(account[to_folder])
-- 	end
-- end

return M
