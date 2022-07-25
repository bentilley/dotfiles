-- mappings.lua
-- Author: Ben Tilley
-- Created: 2022-07-02
-- Neovim Mappings

local mappings = {}
local luasnip = require("plugins.settings.luasnip")

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

-- yogb, gs.toggle_current_line_blame  (setup_gitsigns_mappings)
-- yogd, gs.toggle_deleted             (setup_gitsigns_mappings)
-- yogl, gs.toggle_linehl              (setup_gitsigns_mappings)
-- yogn, gs.toggle_numhl               (setup_gitsigns_mappings)
-- yogw, gs.toggle_word_diff           (setup_gitsigns_mappings)

nmap("<Leader>a", ":nohlsearch<CR>") -- custom, remove search high-lighting
nmap("<Leader>cf", ':let @+=expand("%")') -- custom, copy file name to clipboard
nmap("<Leader>cd", ':let @+=expand("%:p")') -- custom, copy file directory name to clipboard
nmap("<Leader>ev", ":vsplit $MYVIMRC<CR>") -- custom, edit vimrc
nmap("<Leader>ec", ":vsplit ~/.dotfiles/nvim/config/colors/squeedom.vim<CR>") -- custom, edit vimrc
nmap("<Leader>f", ":Format<CR>") -- formatter.nvim
nmap("<Leader>F", ":FormatWrite<CR>") -- formatter.nvim
nmap("<Leader>z", "za") -- custom, fold toggle

-- <LocalLeader>ca, vim.lsp.buf.code_action                                          (setup_lsp_mappings)
-- <LocalLeader>cl, function() print(vim.inspect(client.resolved_capabilities)) end  (setup_lsp_mappings)
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
-- <LocalLeader>wa, vim.lsp.buf.add_workspace_folder                                         (setup_lsp_mappings)
-- <LocalLeader>wr, vim.lsp.buf.remove_workspace_folder                                      (setup_lsp_mappings)
-- <LocalLeader>wl, function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end  (setup_lsp_mappings)

-- <C-k>, vim.lsp.buf.signature_help (setup_lsp_mappings)
nmap("<C-w>D", ":tab split<CR>") -- custom, duplicate buffer in new tab

nmap("[d", vim.diagnostic.goto_prev) -- vim.diagnostic.* nvim-lspconfig
nmap("]d", vim.diagnostic.goto_next) -- vim.diagnostic.* nvim-lspconfig
-- ]h, function() vim.schedule(function() gs.next_hunk() end) return "<Ignore>" end  (setup_gitsigns_mappings)
-- [h, function() vim.schedule(function() gs.prev_hunk() end) return "<Ignore>" end  (setup_gitsigns_mappings)
nmap("[w", ":tabprevious<CR>") -- custom, previous tab
nmap("]w", ":tabnext<CR>") -- custom, next tab

nmap("<F8>", require("colour").show_syntax_group) -- " custom, show syntax highlighting group of word

-- insert mode mappings

-- see: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
imap("<C-E>", function()
	if luasnip.choice_active() then
		luasnip.next_choice()
	else
		return "<C-E>"
	end
end, { silent = true, expr = true }) -- luasnip, change choice in choice node
smap("<C-E>", function()
	if luasnip.choice_active() then
		luasnip.next_choice()
	else
		return "<C-E>"
	end
end, { silent = true, expr = true }) -- luasnip, change choice in choice node

imap("<C-h>", "<C-o>h") -- custom, movement in insert mode
imap("<C-j>", "<C-o>j") -- custom, movement in insert mode
imap("<C-k>", "<C-o>k") -- custom, movement in insert mode
imap("<C-l>", "<C-o>l") -- custom, movement in insert mode

imap("<LocalLeader>a", "<Esc>A") -- custom, jump to end of line
imap("<LocalLeader>b", "<CR><CR><ESC>ki<TAB>") -- custom, open brakets across multiple lines
imap("<LocalLeader>u", "<Esc> viwuea") -- custom, current word upper-case
imap("<LocalLeader>U", "<Esc> viwUea") -- custom, current word lower-case

-- visual mode mappings

-- ih, ":<C-U>Gitsigns select_hunk<CR>" (setup_gitsigns_mappings)

-- <LocalLeader>ca, vim.lsp.buf.range_code_action  (setup_lsp_mappings)
-- <LocalLeader>f, vim.lsp.buf.range_formatting    (setup_lsp_mappings)
-- <LocalLeader>hs, ":Gitsigns stage_hunk<CR>"     (setup_gitsigns_mappings)
-- <LocalLeader>hr, ":Gitsigns reset_hunk<CR>"     (setup_gitsigns_mappings)

-- operator pending mappings

-- ih, ":<C-U>Gitsigns select_hunk<CR>" (setup_gitsigns_mappings)


-- This is the on_attach function for langauge server. We only map the following keys
-- after the language server attaches to the current buffer.
function mappings.setup_lsp_mappings(client, bufnr)
	-- diasble the omnifunc as we're using autocompletion (nvim-cmp plugin)
	-- vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

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

	if client.resolved_capabilities.document_formatting then
		nmap("<LocalLeader>f", vim.lsp.buf.formatting, bufopts)
		vmap("<LocalLeader>f", vim.lsp.buf.range_formatting, bufopts)
	end

	nmap("<LocalLeader>rn", vim.lsp.buf.rename, bufopts)
	nmap("<LocalLeader>ca", vim.lsp.buf.code_action, bufopts)
	vmap("<LocalLeader>ca", vim.lsp.buf.range_code_action, bufopts)
	nmap("<LocalLeader>cl", function()
		print(vim.inspect(client.resolved_capabilities))
	end, bufopts)

	nmap("<LocalLeader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	nmap("<LocalLeader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	nmap("<LocalLeader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
end

-- This is the on_attach function for the gitsigns plugin. We only map the
-- following keys after the plugin has attached to the buffer.
function mappings.setup_gitsigns_mappings(bufnr)
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

return mappings
