-------------
--  Utils  --
-------------

-- Utilities for the imapfilter config file

-- getPassword()
-- Retrieves password data from the Mac OS keychain app
--   @user - the mac keychain account that you would like the password for
function getPassword (user)
  local pass = io.popen('security find-generic-password -a $USER -s ' .. user .. ' -w')
  local res = pass:read("*a")
  return string.gsub(res, "\n", "")
end

-- countMessages()
-- Count the number of messages returned by the imapfilter API
--   @messageResults - the results of an imapfilter method call
function countMessages(messageResults)
  local count = 0
  for k,v in ipairs(messageResults) do count = count + 1 end
  return count
end
