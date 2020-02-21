---------------
--  Options  --
---------------

-- options.cache = true  -- default
-- options.certificates = true -- default
-- options.charset = nil -- default
-- options.close = false -- default
-- options.crammd5 = true -- default
-- options.create = false -- default
-- options.expurge = true -- default
-- options.info = true -- default
-- options.keepalive = 29 -- default
-- options.namespace = true -- default
-- options.starttls = true -- default
-- options.subscribe = false -- default
-- options.timeout = 60 -- default

----------------
--  Accounts  --
----------------

require 'utils'

server = 'outlook.office365.com'
user = 'ben.tilley@accesso.com'
pass = getPassword(server, user)

-- Connects to "imap1.mail.server", as user "user1" with "secret1" as
-- password.
account1 = IMAP {
    server = server,
    username = user,
    password = pass,
}
    -- port = 993,
    -- ssl = 'ssl3',

-- Another account which connects to the mail server using the SSLv3
-- protocol.
-- account2 = IMAP {
--     server = 'imap2.mail.server',
--     username = 'user2',
--     password = 'secret2',
--     ssl = 'ssl23',
-- }

-- Get a list of the available mailboxes and folders
mailboxes, folders = account1:list_all()

for k,v in pairs(mailboxes) do
  print(k, v)
end

for k,v in pairs(folders) do
  print(k, v)
end

---- Get a list of the subscribed mailboxes and folders
--mailboxes, folders = account1:list_subscribed()

---- Create a mailbox
--account1:create_mailbox('Friends')

---- Subscribe a mailbox
--account1:subscribe_mailbox('Friends')


-------------------
----  Mailboxes  --
-------------------

---- Get the status of a mailbox
--account1.INBOX:check_status()

---- Get all the messages in the mailbox.
--results = account1.INBOX:select_all()

---- Get newly arrived, unread messages
--results = account1.INBOX:is_new()

---- Get unseen messages with the specified "From" header.
--results = account1.INBOX:is_unseen() *
--          account1.INBOX:contain_from('weekly-news@news.letter')

---- Copy messages between mailboxes at the same account.
--results:copy_messages(account1.news)

---- Get messages with the specified "From" header but without the
---- specified "Subject" header.
--results = account1.INBOX:contain_from('announce@my.unix.os') -
--          account1.INBOX:contain_subject('security advisory')

---- Copy messages between mailboxes at a different account.
--results:copy_messages(account2.security)

---- Get messages with any of the specified headers.
--results = account1.INBOX:contain_from('marketing@company.junk') +
--          account1.INBOX:contain_from('advertising@annoying.promotion') +
--          account1.INBOX:contain_subject('new great products')

---- Delete messages.
--results:delete_messages()

---- Get messages with the specified "Sender" header, which are older than
---- 30 days.
--results = account1.INBOX:contain_field('sender', 'owner@announce-list') *
--          account1.INBOX:is_older(30)

---- Move messages to the "announce" mailbox inside the "lists" folder.
--results:move_messages(account1['lists/announce'])

---- Get messages, in the "devel" mailbox inside the "lists" folder, with the
---- specified "Subject" header and a size less than 50000 octets (bytes).
--results = account1['lists/devel']:contain_subject('[patch]') *
--          account1['lists/devel']:is_smaller(50000)

---- Move messages to the "patch" mailbox.
--results:move_messages(account2.patch)

---- Get recent, unseen messages, that have either one of the specified
---- "From" headers, but do not have the specified pattern in the body of
---- the message.
--results = ( account1.INBOX:is_recent() *
--            account1.INBOX:is_unseen() *
--            ( account1.INBOX:contain_from('tux@penguin.land') +
--              account1.INBOX:contain_from('beastie@daemon.land') ) ) -
--          account1.INBOX:match_body('.*all.work.and.no.play.*')

---- Mark messages as important.
--results:mark_flagged()

---- Get all messages in two mailboxes residing in the same server.
--results = account1.news:select_all() +
--          account1.security:select_all()

---- Mark messages as seen.
--results:mark_seen()

---- Get recent messages in two mailboxes residing in different servers.
--results = account1.INBOX:is_recent() +
--          account2.INBOX:is_recent()

---- Flag messages as seen and important.
--results:add_flags({ '\\Seen', '\\Flagged' })

---- Get unseen messages.
--results = account1.INBOX:is_unseen()

---- From the messages that were unseen, match only those with the specified
---- regular expression in the header.
--newresults = results:match_header('^.+MailScanner.*Check: [Ss]pam$')

---- Delete those messages.
--newresults:delete_messages()


------------------
----  Extended  --
------------------

----
---- This file contains examples on how IMAPFilter can be extended using
---- the Lua programming language.
----


---- IMAPFilter can be detached from the controlling terminal and run in
---- the background as a system daemon.
----
---- The auxiliary function become_daemon() is supplied for conveniency.
---- The following example puts imapfilter in the background and runs
---- endlessly, executing the commands in the forever() function and
---- sleeping for 600 seconds between intervals:

--function forever()
--    results = myaccount.mymailbox:is_old()
--    results:move_messages(myaccount.myothermailbox)
--end

--become_daemon(600, forever)


---- The previous example uses polling in order to search specific messages and
---- process them.  Another more efficient alternative is using the IMAP IDLE
---- extension.  This is implemented by the enter_idle() method, which waits for
---- a notification by the server when new messages arrive in the monitored
---- mailbox.

--while true do
--    myaccount.mymailbox:enter_idle()
--    results = myaccount.mymailbox:is_unread()
--    results:move_messages(myaccount.myothermailbox)
--end


---- IMAPFilter can take advantage of all those filtering utilities that
---- are available and use a wide range of heuristic tests, text analysis,
---- internet-based realtime blacklists, advanced learning algorithms,
---- etc. to classify mail.  IMAPFilter can pipe a message to a program
---- and act on the message based on the program's exit status.
----
---- The auxiliary function pipe_to() is supplied for conveniency.  For
---- example if there was a utility named "bayesian-spam-filter", which
---- returned 1 when it considered the message "spam" and 0 otherwise:

--all = myaccount.mymailbox:select_all()

--results = Set {}
--for _, mesg in ipairs(all) do
--    mbox, uid = table.unpack(mesg)
--    text = mbox[uid]:fetch_message()
--    if (pipe_to('bayesian-spam-filter', text) == 1) then
--        table.insert(results, mesg)
--    end
--end

--results:delete_messages()


---- One might want to run the bayesian filter only in those parts (attachments)
---- of the message that are of type text/plain and smaller than 1024 bytes.
---- This is possible using the fetch_structure() and fetch_part() functions:

--all = myaccount.mymailbox:select_all()

--results = Set {}
--for _, mesg in ipairs(all) do
--    mbox, uid = table.unpack(mesg)
--    structure = mbox[uid]:fetch_structure()
--    for partid, partinf in pairs(structure) do
--        if partinf.type:lower() == 'text/plain' and partinf.size < 1024 then
--            part = mbox[uid]:fetch_part(partid)
--            if (pipe_to('bayesian-spam-filter', part) == 1) then
--                table.insert(results, mesg)
--                break
--            end
--        end
--    end
--end

--results:delete_messages()


---- Messages can be appended to a mailbox.  One can fetch a message from a
---- mailbox, optionally process it, and then upload it to the same or different
---- mailbox, at the same or different mail servers.  In the following example a
---- header field is added to all messages, and the processed messages are then
---- appended to a different mailbox.

--all = myaccount.mymailbox:select_all()

--for _, mesg in ipairs(all) do
--    mbox, uid = table.unpack(mesg)
--    header = mbox[uid]:fetch_header()
--    body = mbox[uid]:fetch_body()
--    message = header:gsub('[\r\n]+$', '\r\n') ..
--              'My-Header: My-Content\r\n' .. '\r\n' .. body
--    myaccount.myothermaibox:append_message(message)
--end


---- Passwords could be extracted during execution time from an encrypted
---- file.
----
---- The file is encrypted using the openssl(1) command line tool.  For
---- example the "passwords.txt" file:
----
----   secret1
----   secret2
----
---- ... is encrypted and saved to a file named "passwords.enc" with the
---- command:
----
----   $ openssl bf -in passwords.txt -out passwords.enc
----
---- The auxiliary function pipe_from() is supplied for conveniency.  The
---- user is prompted to enter the decryption password, the file is
---- decrypted and the account passwords are set accordingly:

--status, output = pipe_from('openssl bf -d -in ~/passwords.enc')

--_, _, password1, password2 = string.find(output, '([%w%p]+)\n([%w%p]+)')

--account1 = IMAP {
--    server = 'imap1.mail.server',
--    username = 'user1',
--    password = password1
--}

--account2 = IMAP {
--    server = 'imap2.mail.server',
--    username = 'user2',
--    password = password2
--}


---- An alternative way to authenticate to a server is by using a OAuth2 string,
---- if the server supports the XOAUTH2 authentication mechanism.
----
---- In order to generate an OAuth2 string the oauth2.py script and library can
---- be used, and instructions on how to use it and where to download it are
---- available at:
----
----   https://github.com/google/gmail-oauth2-tools/wiki/OAuth2DotPyRunThrough
----
---- The generated OAuth2 string is then supplied to imapfilter in order to
---- authenticate to the IMAP server using it instead of a login
---- username/password pair.
----
---- Here we assume that imapfilter has the user, the cliend id, the client
---- secret and the refresh token, and uses them to generate a new access token
---- (access tokens expire after one hour), and then from the new access token to
---- generate the OAuth2 string that is used with the IMAP server:
--user = 'xoauth@gmail.com'
--clientid = '364545978226.apps.googleusercontent.com'
--clientsecret = 'zNrNsBzOOnQy8_O-8LkofeTR'
--refreshtoken = '1/q4SaB2JMQB9I-an6F1rxJE9OkOMtfjaz1bPm1tfDpQM'

--status, output = pipe_from('oauth2.py --client_id=' .. clientid ..
--                 ' --client_secret=' .. clientsecret ..
--                 ' --refresh_token=' .. refreshtoken)
--_, _, accesstoken = string.find(output, 'Access Token: ([%w%p]+)\n')

--status, output = pipe_from('oauth2.py --generate_oauth2_string' ..
--                           ' --access_token=' .. accesstoken ..
--                           ' --user=' .. user)
--_, _, oauth2string = string.find(output, 'OAuth2 argument:\n([%w%p]+)\n')

--account3 = IMAP {
--    server = 'imap.gmail.com',
--    ssl = 'tls1.2',
--    username = user,
--    oauth2 = oauth2string
--}
