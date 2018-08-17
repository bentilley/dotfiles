" reset PATH variable so that vim used the system Python installation
" which lets YouCompleteMe run 
" let $PATH = '/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin'

call plug#begin('~/.vim/plugged')
Plug 'nightsense/stellarized'
Plug 'jiangmiao/auto-pairs'
" Plug 'Valloric/YouCompleteMe'
Plug 'pangloss/vim-javascript'          " js syntax highlighting
Plug 'mxw/vim-jsx'                      " jsx syntax highlighting
Plug 'w0rp/ale'                         " linting
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'                " show tag window
Plug 'mileszs/ack.vim'                  " greping in vim
call plug#end()

set rtp+=/usr/local/opt/fzf

nnoremap confe :e $MYVIMRC<CR>        " Edit vimr configuration file
nnoremap confr :source $MYVIMRC<CR>   " Reload vims configuration file

" set up colour scheme
colorscheme stellarized
set background=dark

" colours for the line at the bottom of viewports
hi StatusLine    ctermfg=253  ctermbg=024  cterm=NONE
hi StatusLineNC  ctermfg=024  ctermbg=253  cterm=NONE

set clipboard+=unnamed    " yanking goes straigth clipboard buffer
set mouse=a               " setting up the mouse
set noea                  " stopping windows from automatic resize on close
" spaces instead of tabs, and set indent width
set softtabstop=2 shiftwidth=2 expandtab
set backspace=2           " make backspace work like most other programs
set incsearch             " highlight first search match while typing
set hlsearch | nohl       " highlight all search matches when search completed
set number                " add line numbers
set relativenumber        " do line numbering relative to current cursor row
set notagrelative         " tags not followed relative to tag file

" Enables cursor line position tracking:
set cursorline
" Removes the underline causes by enabling cursorline:
" highlight clear CursorLine
" Sets the line numbering to red background:
highlight CursorLineNR ctermbg=red

" netrw - vims own file system explorer configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 50
let g:netrw_altv=1 | let g:netrw_alto=1
let g:netrw_browse_split=4

" Prettier Settings
let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"
let g:prettier#quickfix_auto_focus = 0
let g:prettier#autoformat = 0
augroup prettiersettings
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue Prettier
augroup END

" Tagbar settings
let g:tagbar_ctags_bin="/usr/local/bin/ctags"
nnoremap <silent> tt :TagbarToggle<CR>          " as in 'tag! tag!'
nnoremap <silent> tg :TagbarOpenAutoClose<CR>   " as in 'tag go!'
nnoremap <silent> tp :TagbarTogglePause<CR>     " as in 'tag pause!'

" ack.vim settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ackhighlight = 1
let g:ack_autoclose = 1
command! -nargs=* -bang Ag call ack#Ack('grep<bang>',<q-args>)
nmap ag :Ag<Space>
nmap cag :Ag<CR>

" tab settings
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
