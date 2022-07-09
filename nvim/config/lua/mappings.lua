-- mappings.lua
-- Author: Ben Tilley
-- Created: 2022-07-02
-- Neovim Mappings

local mappings = {}

-- functions

-- local function map(mode, shortcut, command)
-- 	vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
-- end

local function nmap(shortcut, command, opts)
	if opts == nil then
		opts = { noremap = true, silent = true }
	end
	vim.keymap.set("n", shortcut, command, opts)
end

-- local function imap(shortcut, command)
-- 	map("i", shortcut, command)
-- end

-- mappings

vim.g.mapleader = " " -- <Space>
vim.g.maplocalleader = ";" -- NOTE: plugin clever-f re-maps original ';' usage to multiple f presses

nmap("<Leader>f", ":Format<CR>") -- formatter.nvim
nmap("<Leader>F", ":FormatWrite<CR>") -- formatter.nvim

nmap("<LocalLeader>e", vim.diagnostic.open_float) -- vim.diagnostic.* nvim-lspconfig
nmap("<LocalLeader>q", vim.diagnostic.setloclist) -- vim.diagnostic.* nvim-lspconfig

nmap("[d", vim.diagnostic.goto_prev) -- vim.diagnostic.* nvim-lspconfig
nmap("]d", vim.diagnostic.goto_next) -- vim.diagnostic.* nvim-lspconfig

-- " handly quick file and directory edit mappings
-- nnoremap <silent> <LocalLeader>ev :vs $MYVIMRC<CR>
-- nnoremap <silent> <Leader>sv :source $MYVIMRC<CR>
-- nnoremap <silent> <Leader>sf :source %<CR>
-- nnoremap <silent> <Leader>vc :vs ~/.dotfiles/vim/.vim/colors/squeedom.vim<CR>
-- nnoremap <silent> <Leader>vd :vs ~/.dotfiles/vim/.vim<CR>
-- nnoremap <silent> <Leader>t :!tmux source ~/.tmux.conf<CR>

-- " tab settings - a la unimpaired
-- nnoremap [w :tabprevious<CR>
-- nnoremap ]w :tabnext<CR>
-- nnoremap <silent> <C-w>D :tab sp<CR>

-- " yanking and pasting from the clipboard
-- nnoremap <LocalLeader>y "+y
-- nnoremap <LocalLeader>p "+p
-- nnoremap <LocalLeader>P "+P

-- " Inserting lines from normal mode
-- nnoremap <LocalLeader>o o<Esc>
-- nnoremap <LocalLeader>O O<Esc>

-- " linting helpers
-- nnoremap <Leader>g gggqG<C-O><C-O>zz

-- " highlighting
-- nnoremap <silent> <Leader>a :nohl<CR>

-- " file name to clipboard
-- nnoremap <Leader>cf :let @+=expand("%")<CR>
-- nnoremap <Leader>cd :let @+=expand("%:p")<CR>

-- " fold commands
-- nnoremap sfld :set foldmethod=syntax<CR>
-- nnoremap mfld :set foldmethod=manual<CR>
-- nnoremap <Space> za

-- " add scafolding
-- nnoremap gs i--------------- working ---------------<Esc>

-- " renaming things
-- nnoremap <Leader>rn yiw:%s/<C-R>+/
-- nnoremap <C-p> viwp

-- nnoremap <LocalLeader>bs yiw:BufferSearch <C-R>0<CR>

-- " generate ctags
-- nnoremap <Leader>c :terminal ++hidden ctags -R -f ./.git/tags .<CR>

-- " markdown
-- nnoremap <LocalLeader>ca :%s/\[ \]/[x]/<CR>

-- " toggle word cases
-- inoremap <c-u> <esc>viwUea
-- " inoremap <c-y> <esc>viwuea

-- " movement in insert mode
-- inoremap <C-h> <C-o>h
-- inoremap <C-j> <C-o>j
-- inoremap <C-k> <C-o>k
-- inoremap <C-l> <C-o>l
-- inoremap <localleader>a <Esc>A

-- " brace magic
-- inoremap <localleader>b <CR><CR><ESC>ki<TAB>

-- This is the on_attach function for langauge server. We only map the following keys
-- after the language server attaches to the current buffer.
function mappings.lsp_mappings(client, bufnr)
	vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

return mappings
