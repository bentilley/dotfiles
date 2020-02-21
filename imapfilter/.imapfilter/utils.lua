-------------
--  Utils  --
-------------

-- Utilities for the imapfilter config file

-- getPassword()
-- Retrieves password data from the Mac OS keychain app
--   @server - the imap server that you would like to connect to
--   @account - the mac keychain account that you would like the password for
function getPassword (server, account)
  pass = io.popen('security find-generic-password -s ' .. server .. ' -a ' .. account ..' -w')
  res = pass:read("*a")
  return string.gsub(res, "\n", "")
end
