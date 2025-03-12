-- mappings.lua
-- Author: Ben Tilley
-- Created: 2022-07-02
-- Neovim Mappings

local M = {}
local formatter_nvim = require("plugins.settings.formatter-nvim")
local todo_comments = require("plugins.settings.todo-comments-nvim")

-- constants

local g = vim.g

-- functions

local function nmap(shortcut, command, opts)
	vim.keymap.set("n", shortcut, command, opts or { noremap = true, silent = true })
end

local function vmap(shortcut, command, opts)
	vim.keymap.set("v", shortcut, command, opts or { noremap = true, silent = true })
end

local function imap(shortcut, command, opts)
	vim.keymap.set("i", shortcut, command, opts or { noremap = true, silent = true })
end

local function xmap(shortcut, command, opts)
	vim.keymap.set("x", shortcut, command, opts or { noremap = true, silent = true })
end

local function omap(shortcut, command, opts)
	vim.keymap.set("o", shortcut, command, opts or { noremap = true, silent = true })
end

local function smap(shortcut, command, opts)
	vim.keymap.set("s", shortcut, command, opts or { noremap = true, silent = true })
end

-- mappings

g.mapleader = " " -- <Space>
g.maplocalleader = ";" -- NOTE: plugin clever-f re-maps original ';' usage to multiple f presses

-- normal mode mappings

nmap("yof", formatter_nvim.toggle_formatter_disabled) -- custom, toggle auto formatting
-- yogb, gs.toggle_current_line_blame  (setup_gitsigns_mappings)
-- yogd, gs.toggle_deleted             (setup_gitsigns_mappings)
-- yogl, gs.toggle_linehl              (setup_gitsigns_mappings)
-- yogn, gs.toggle_numhl               (setup_gitsigns_mappings)
-- yogw, gs.toggle_word_diff           (setup_gitsigns_mappings)

nmap("<Leader>a", ":nohlsearch<CR>") -- custom, remove search high-lighting
nmap("<Leader>cd", ':let @+=expand("%:p")') -- custom, copy file directory name to clipboard
nmap("<Leader>cf", ':let @+=expand("%")') -- custom, copy file name to clipboard
-- <Leader>cr..., coerc text case -- (text-case.nvim)
-- <Leader>dc, show surrounding class definitions -- (nvim-treesitter)
-- <Leader>df, show surrounding function definitions -- (nvim-treesitter)
nmap("<Leader>ds", ":Neogen<CR>") -- neogen, generate docstring
nmap("<Leader>ev", ":vsplit $MYVIMRC<CR>") -- custom, edit vimrc
nmap("<Leader>ec", ":vsplit ~/.dotfiles/nvim/config/colors/squeedom.lua<CR>") -- custom, edit vimrc
nmap("<Leader>em", ":tabedit ~/.config/nvim/lua/mappings.lua<CR>") -- custom, edit key mappings file
nmap("<Leader>ep", ":tabedit ~/.config/nvim/lua/plugins/settings<CR>") -- custom, edit plugin settings
nmap("<Leader>es", ":tabedit ~/.config/nvim/snippets<CR>") -- custom, edit snippets
nmap("<Leader>et", ":tabedit ~/.config/nvim/templates<CR>") -- custom, edit templates
nmap("<Leader>f", ":Format<CR>") -- formatter.nvim
nmap("<Leader>F", ":FormatWrite<CR>") -- formatter.nvim
nmap("<Leader>hl", ":TSCaptureUnderCursor<CR>") -- nvim-treesitter/playground
nmap("<Leader>j", ":HopChar1AC<CR>") -- hop.nvim, smart document jumping
nmap("<Leader>J", ":HopChar1BC<CR>") -- hop.nvim, smart document jumping
nmap("<Leader>k", ":HopWordAC<CR>") -- hop.nvim, smart document jumping
nmap("<Leader>K", ":HopWordBC<CR>") -- hop.nvim, smart document jumping
nmap("<Leader>l", ":Telescope builtin<CR>") -- telescope, seach telescope operations
nmap("<Leader>lf", ":Telescope find_files<CR>") -- telescope, search files
nmap("<Leader>lg", ":Telescope live_grep<CR>") -- telescope, live search project
nmap("<Leader>lm", ":Telescope marks<CR>") -- telescope, search project marks
nmap("<Leader>ls", ":Telescope grep_string<CR>") -- telescope, grep project pattern
nmap("<Leader>m", ":TodoQuickFix<CR>") -- todo-comments.nvim, show todo,fix,etc. comments
nmap("<Leader>q", function()
	for _, ui in pairs(vim.api.nvim_list_uis()) do
		if ui.chan and not ui.stdout_tty then
			vim.fn.chanclose(ui.chan)
		end
	end
end) -- custom, close ui session without closing remote server
nmap("<Leader>rj", ":TSJJoin<CR>") -- treesj, join
nmap("<Leader>rs", ":TSJSplit<CR>") -- treesj, split
nmap("<Leader>rr", ":TSJToggle<CR>") -- treesj, toggle split / join
nmap("<Leader>s", ":Lgrep ") -- custom, search for word
nmap("<Leader>S", ":Grep ") -- custom, search for word
nmap("<Leader>tc", ":VimuxCloseRunner<CR>")
nmap("<Leader>tl", ":VimuxRunLastCommand<CR>")
nmap("<Leader>to", ":VimuxOpenRunner<CR>")
nmap("<Leader>tp", ":VimuxPromptCommand<CR>")
nmap("<Leader>tr", ":VimuxRunCommand")
nmap("<Leader>tx", ":VimuxInterruptRunner<CR>")
nmap("<Leader>t<C-l>", ":VimuxClearTerminalScreen<CR>")
nmap("<Leader>v", "yygccp", { remap = true }) -- custom, (version) duplicate + comment line
nmap("<Leader>wr", "<Plug>(datamuse-rhymes)") -- custom plugin, find rhyming words
nmap("<Leader>ws", "<Plug>(datamuse-synonyms)") -- custom plugin, find synonyms

-- <LocalLeader>ca, vim.lsp.buf.code_action                                          (setup_lsp_mappings)
-- <LocalLeader>cl, function() print(vim.inspect(client.server_capabilities)) end  (setup_lsp_mappings)
nmap("<LocalLeader>e", vim.diagnostic.open_float) -- vim.diagnostic.* nvim-lspconfig
-- <LocalLeader>f, vim.lsp.buf.formatting                          (setup_lsp_mappings)
-- <LocalLeader>gD, vim.lsp.buf.declaration                        (setup_lsp_mappings)
-- <LocalLeader>gci, vim.lsp.buf.incoming_calls                    (setup_lsp_mappings)
-- <LocalLeader>gco, vim.lsp.buf.outgoing_calls                    (setup_lsp_mappings)
-- <LocalLeader>gd, vim.lsp.buf.definition                         (setup_lsp_mappings)
-- <LocalLeader>gi, vim.lsp.buf.implementation                     (setup_lsp_mappings)
-- <LocalLeader>gr, vim.lsp.buf.references                         (setup_lsp_mappings)
-- <LocalLeader>gs, vim.lsp.buf.document_symbol                    (setup_lsp_mappings)
-- <LocalLeader>gt, vim.lsp.buf.type_definition                    (setup_lsp_mappings)
-- <LocalLeader>hD, function() gs.diffthis("~") end                (setup_lsp_mappings)
-- <LocalLeader>hR, gs.reset_buffer                                (setup_gitsigns_mappings)
-- <LocalLeader>hS, gs.stage_buffer                                (setup_gitsigns_mappings)
-- <LocalLeader>hb, function() gs.blame_line({ full = true }) end  (setup_gitsigns_mappings)
-- <LocalLeader>hd, gs.diffthis                                    (setup_gitsigns_mappings)
-- <LocalLeader>hp, gs.preview_hunk                                (setup_gitsigns_mappings)
-- <LocalLeader>hr, ":Gitsigns reset_hunk<CR>"                     (setup_gitsigns_mappings)
-- <LocalLeader>hs, ":Gitsigns stage_hunk<CR>"                     (setup_gitsigns_mappings)
-- <LocalLeader>hu, gs.undo_stage_hunk                             (setup_gitsigns_mappings)
-- <LocalLeader>k, vim.lsp.buf.hover                               (setup_lsp_mappings)
nmap("<LocalLeader>o", "o<Esc>") -- custom, insert line below
nmap("<LocalLeader>O", "O<Esc>") -- custom, insert line above
nmap("<LocalLeader>q", vim.diagnostic.setloclist) -- vim.diagnostic.* nvim-lspconfig
-- <LocalLeader>rn, vim.lsp.buf.rename                                                       (setup_lsp_mappings)
nmap("<LocalLeader>usg", function()
	if vim.b.styleguide then
		os.execute("open " .. vim.b.styleguide)
	end
end) -- custom, open style guide
-- <LocalLeader>wa, vim.lsp.buf.add_workspace_folder                                         (setup_lsp_mappings)
-- <LocalLeader>wr, vim.lsp.buf.remove_workspace_folder                                      (setup_lsp_mappings)
-- <LocalLeader>wl, function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end  (setup_lsp_mappings)
nmap("<LocalLeader>x", "<Plug>(sqls-execute-query)") -- sqls.nvim, sqls language server plugin
nmap("<LocalLeader>X", "<Plug>(sqls-execute-query-vertical)") -- sqls.nvim, sqls language server plugin

-- <C-k>, vim.lsp.buf.signature_help (setup_lsp_mappings)
nmap("<C-w>D", ":tab split<CR>") -- custom, duplicate buffer in new tab
nmap("<C-w>X", ":tabclose<CR>") -- custom, close the current tab

nmap("[d", vim.diagnostic.goto_prev) -- vim.diagnostic.* nvim-lspconfig
nmap("]d", vim.diagnostic.goto_next) -- vim.diagnostic.* nvim-lspconfig
-- ]h, function() vim.schedule(function() gs.next_hunk() end) return "<Ignore>" end  (setup_gitsigns_mappings)
-- [h, function() vim.schedule(function() gs.prev_hunk() end) return "<Ignore>" end  (setup_gitsigns_mappings)
nmap("[m", todo_comments.jump_prev) -- todo_comments.nvim, previous todo message
nmap("]m", todo_comments.jump_next) -- todo_comments.nvim, next todo message
nmap("[w", ":tabprevious<CR>") -- custom, previous tab
nmap("]w", ":tabnext<CR>") -- custom, next tab

nmap("<F8>", require("colour").show_syntax_group) -- " custom, show syntax highlighting group of word

-- insert mode mappings

-- see: https://github.com/L3MON4D3/LuaSnip#keymaps=
imap("<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'") -- luasnip, change choice in choice mode
smap("<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'") -- luasnip, change choice in choice mode
imap("<C-h>", "<C-o>h") -- custom, movement in insert mode
imap("<C-j>", "<C-o>j") -- custom, movement in insert mode
imap("<C-k>", "<C-o>k") -- custom, movement in insert mode
imap("<C-l>", "<C-o>l") -- custom, movement in insert mode

-- <M-l>, copilot accept suggestion -- (copilot.lua)
-- <M-o>, copilot open pannel -- (copilot.lua)
-- <M-]>, copilot next suggestion -- (copilot.lua)
-- <M-[>, copilot prev suggestion -- (copilot.lua)

imap("<LocalLeader>a", "<Esc>A") -- custom, jump to end of line
imap("<LocalLeader>b", "<CR><CR><ESC>ki<TAB>") -- custom, open brakets across multiple lines
imap("<LocalLeader>s", "<Plug>luasnip-expand-or-jump") -- luasnip, expand snippet
imap("<LocalLeader>S", "<cmd>lua require'luasnip'.jump(-1)<Cr>") -- luasnip, jump backwards
smap("<LocalLeader>s", "<cmd>lua require'luasnip'.jump(1)<Cr>") -- luasnip, jump forwards
smap("<LocalLeader>S", "<cmd>lua require'luasnip'.jump(-1)<Cr>") -- luasnip, jump backwards
imap("<LocalLeader>u", "<Esc> viwuea") -- custom, current word upper-case
imap("<LocalLeader>U", "<Esc> viwUea") -- custom, current word lower-case

-- visual mode mappings

-- ih, ":<C-U>Gitsigns select_hunk<CR>" (setup_gitsigns_mappings)

-- <LocalLeader>ca, vim.lsp.buf.range_code_action  (setup_lsp_mappings)
-- <LocalLeader>f, vim.lsp.buf.range_formatting    (setup_lsp_mappings)
-- <LocalLeader>hs, ":Gitsigns stage_hunk<CR>"     (setup_gitsigns_mappings)
-- <LocalLeader>hr, ":Gitsigns reset_hunk<CR>"     (setup_gitsigns_mappings)
vmap("<LocalLeader>x", "<Plug>(sqls-execute-query)") -- sqls.nvim, sqls language server plugin
vmap("<LocalLeader>X", "<Plug>(sqls-execute-query-vertical)") -- sqls.nvim, sqls language server plugin

-- operator pending mappings

-- ih, ":<C-U>Gitsigns select_hunk<CR>" (setup_gitsigns_mappings)

-- setup functions - called in other files to set up mappings.

-- This is the on_attach function for langauge server. We only map the following keys
-- after the language server attaches to the current buffer.
function M.setup_lsp_mappings(client, bufnr)
	-- I think this on-demand completion can live side by side with autocompletion
	vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	nmap("<LocalLeader>gci", vim.lsp.buf.incoming_calls, bufopts)
	nmap("<LocalLeader>gco", vim.lsp.buf.outgoing_calls, bufopts)
	nmap("<LocalLeader>gD", vim.lsp.buf.declaration, bufopts)
	nmap("<LocalLeader>gd", vim.lsp.buf.definition, bufopts)
	nmap("<LocalLeader>gi", vim.lsp.buf.implementation, bufopts)
	nmap("<LocalLeader>gr", vim.lsp.buf.references, bufopts)
	nmap("<LocalLeader>gs", vim.lsp.buf.document_symbol, bufopts)
	nmap("<LocalLeader>gt", vim.lsp.buf.type_definition, bufopts)

	nmap("<LocalLeader>k", vim.lsp.buf.hover, bufopts)
	nmap("<C-k>", vim.lsp.buf.signature_help, bufopts)

	if client.server_capabilities.documentFormattingProvider then
		nmap("<LocalLeader>f", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
		vmap("<LocalLeader>f", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
	end

	nmap("<LocalLeader>rn", vim.lsp.buf.rename, bufopts)
	nmap("<LocalLeader>ca", vim.lsp.buf.code_action, bufopts)
	vmap("<LocalLeader>ca", vim.lsp.buf.code_action, bufopts)
	nmap("<LocalLeader>cl", function()
		print(vim.inspect(client.server_capabilities))
	end, bufopts)

	nmap("<LocalLeader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	nmap("<LocalLeader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	nmap("<LocalLeader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
end

-- This is the on_attach function for the gitsigns plugin. We only map the
-- following keys after the plugin has attached to the buffer.
function M.setup_gitsigns_mappings(bufnr)
	local gs = package.loaded.gitsigns

	-- Navigation
	nmap("]h", function()
		vim.schedule(function()
			gs.next_hunk()
		end)
		return "<Ignore>"
	end, { buffer = bufnr, expr = true })

	nmap("[h", function()
		vim.schedule(function()
			gs.prev_hunk()
		end)
		return "<Ignore>"
	end, { buffer = bufnr, expr = true })

	-- actions
	local bufopts = { buffer = bufnr }
	nmap("<LocalLeader>hs", ":Gitsigns stage_hunk<CR>", bufopts)
	vmap("<LocalLeader>hs", ":Gitsigns stage_hunk<CR>", bufopts)
	nmap("<LocalLeader>hu", gs.undo_stage_hunk, bufopts)
	nmap("<LocalLeader>hr", ":Gitsigns reset_hunk<CR>", bufopts)
	vmap("<LocalLeader>hr", ":Gitsigns reset_hunk<CR>", bufopts)
	nmap("<LocalLeader>hS", gs.stage_buffer, bufopts)
	nmap("<LocalLeader>hR", gs.reset_buffer, bufopts)
	nmap("<LocalLeader>hp", gs.preview_hunk, bufopts)
	nmap("<LocalLeader>hb", function()
		gs.blame_line({ full = true })
	end, bufopts)
	nmap("<LocalLeader>hd", gs.diffthis, bufopts)
	nmap("<LocalLeader>hD", function()
		gs.diffthis("~")
	end, bufopts)

	-- toggles
	nmap("yogb", gs.toggle_current_line_blame, bufopts)
	nmap("yogd", gs.toggle_deleted, bufopts)
	nmap("yogl", gs.toggle_linehl, bufopts)
	nmap("yogn", gs.toggle_numhl, bufopts)
	nmap("yogw", gs.toggle_word_diff, bufopts)

	-- text object
	omap("ih", ":<C-U>Gitsigns select_hunk<CR>", bufopts)
	xmap("ih", ":<C-U>Gitsigns select_hunk<CR>", bufopts)
end

return M
