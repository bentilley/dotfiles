" == VIMRC ==
" Author: Ben Tilley

" Plugins {{{

" auto download and install vim-plug if doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

  " CORE
  " Plug 'w0rp/ale'
  " Plug 'SirVer/ultisnips'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'                  " greping in vim
  " Plug 'majutsushi/tagbar'                " show tag window
  " Plug 'tpope/vim-fugitive'
  " Plug 'tpope/vim-projectionist'
  " Plug 'tpope/vim-unimpaired'
  " Plug 'tpope/vim-commentary'
  " Plug 'tpope/vim-surround'
  " Plug 'tpope/vim-dispatch'
  " Plug 'qxxxb/vim-searchhi'

  " SYNTAX
  Plug 'ekalinin/Dockerfile.vim'          " docker
  Plug 'chr4/nginx.vim'                   " nginx
  Plug 'lifepillar/pgsql.vim'             " postgresql
  Plug 'MTDL9/vim-log-highlighting'       " arbitrary log files

call plug#end()

" }}}

" Basic Editor Settings {{{

set undofile
let mapleader = "\\"
let maplocalleader = ";"
set noea                                 " stopping windows from automatic resize on close
set softtabstop=2 shiftwidth=2 expandtab " spaces instead of tabs, and set indent width
set shiftround
set backspace=2                          " make backspace work like most other programs
set incsearch                            " highlight first search match while typing
set hlsearch | nohl                      " highlight all search matches when search completed
set number                               " add line numbers
set relativenumber                       " do line numbering relative to current cursor row
set notagrelative                        " tags not followed relative to tag file
set ignorecase                           " search case insensitive - use \C for sensitive
set smartcase                            " search case sensitive if contains capital letters
" set listchars=eol:$,space:.,tab:<->,trail:%,precedes:<,extends:>
set sidescroll=5
set timeoutlen=1000 ttimeoutlen=0        " exit visual faster
set path=$PWD/**
set complete-=i                         " removes indluded files from search
set autoindent
set nocursorline
set modeline
set tags+=./.git/tags

" }}}

" Loading and Configuring Settings {{{

" automatically source vimrc after session load
augroup sessions
  autocmd!
  autocmd SessionLoadPost * :source $MYVIMRC
augroup END

" using marker folding for .vimrc
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" handly quick file and directory edit mappings
nnoremap <silent> <LocalLeader>ev :vs $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :source $MYVIMRC<CR>
nnoremap <silent> <Leader>sf :source %<CR>
nnoremap <silent> <Leader>vc :vs ~/.dotfiles/vim/.vim/colors/squeedom.vim<CR>
nnoremap <silent> <Leader>vd :vs ~/.dotfiles/vim/.vim<CR>
nnoremap <silent> <Leader>t :!tmux source ~/.tmux.conf<CR>

" }}}

" Status Line {{{

" TODO read status line docs
" TODO autocommands and setlocal to define diff status lines for diff filetype

" }}}

" Normal Mode Helpers {{{

" tab settings - a la unimpaired
nnoremap [w :tabprevious<CR>
nnoremap ]w :tabnext<CR>
nnoremap <silent> <C-w>D :tab sp<CR>

" yanking and pasting from the clipboard
nnoremap <LocalLeader>y "+y
nnoremap <LocalLeader>p "+p
nnoremap <LocalLeader>P "+P

" Inserting lines from normal mode
nnoremap <LocalLeader>o o<Esc>
nnoremap <LocalLeader>O O<Esc>

" linting helpers
nnoremap <Leader>g gggqG<C-O><C-O>zz

" highlighting
nnoremap <silent> <Leader>a :nohl<CR>

" file name to clipboard
nnoremap <Leader>cf :let @+=expand("%")<CR>
nnoremap <Leader>cd :let @+=expand("%:p")<CR>

" fold commands
nnoremap sfld :set foldmethod=syntax<CR>
nnoremap mfld :set foldmethod=manual<CR>
nnoremap <Space> za

" add scafolding
nnoremap gs i--------------- working ---------------<Esc>

" renaming things
nnoremap <Leader>rn yiw:%s/<C-R>+/
nnoremap <C-p> viwp

nnoremap <LocalLeader>bs yiw:BufferSearch <C-R>0<CR>

" generate ctags
nnoremap <Leader>c :terminal ++hidden ctags -R -f ./.git/tags .<CR>

" }}}

" Insert Mode Helpers {{{

" toggle word cases
inoremap <c-u> <esc>viwUea
inoremap <c-y> <esc>viwuea

" movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
inoremap <localleader>a <Esc>A

" brace magic
inoremap <localleader>b <CR><CR><ESC>ki<TAB>

" }}}

" Command-line Mode Helpers {{{

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" }}}

" Custom Commands {{{

command! VF vsplit | FZF
command! SF split | FZF
command! TF tabnew | FZF
command! XA mks! | xa

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Command for searching all open buffers for a word
if !exists(":BufferSearch")
  command -nargs=1 BufferSearch :cexpr [] | :bufdo vimgrepadd <args> %
endif

" }}}

" Abbreviations {{{

iabbrev shrg ¯\_(ツ)_/¯
iabbrev td # TODO()

" }}}

" Spelling {{{

" }}}

" Vimdiff Options {{{

" shortcuts for 3-way merge
nnoremap <Leader>1 :diffget LOCAL<CR>
nnoremap <Leader>2 :diffget BASE<CR>
nnoremap <Leader>3 :diffget REMOTE<CR>

" }}}

" Operator Pending Mappings {{{

" next and last brakets
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
onoremap in@ :<c-u>normal! f@viW<cr>
onoremap il@ :<c-u>normal! F@viW<cr>

" }}}

" NETRW Settings {{{

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 50
let g:netrw_altv=1 | let g:netrw_alto=1

" }}}

" Ack Settings {{{

" TODO Read the Ack docs
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
let g:ackhighlight = 1
let g:ack_autoclose = 1

nnoremap <LocalLeader>s :Ack!<Space>

" }}}

" FZF Settings {{{

nnoremap <LocalLeader>S :Rg<Space>

" }}}

" Search HI Settings {{{

let g:searchhi_clear_all_asap = 1

nmap n <Plug>(searchhi-n)
nmap N <Plug>(searchhi-N)
nmap * <Plug>(searchhi-*)
nmap g* <Plug>(searchhi-g*)
nmap # <Plug>(searchhi-#)
nmap g# <Plug>(searchhi-g#)
nmap gd <Plug>(searchhi-gd)
nmap gD <Plug>(searchhi-gD)

vmap n <Plug>(searchhi-v-n)
vmap N <Plug>(searchhi-v-N)
vmap * <Plug>(searchhi-v-*)
vmap g* <Plug>(searchhi-v-g*)
vmap # <Plug>(searchhi-v-#)
vmap g# <Plug>(searchhi-v-g#)
vmap gd <Plug>(searchhi-v-gd)
vmap gD <Plug>(searchhi-v-gD)

nmap <silent> <C-L> <Plug>(searchhi-clear-all)
vmap <silent> <C-L> <Plug>(searchhi-v-clear-all)

" }}}

" Syntax Highlighting Helpers {{{

" for showing you the syntax highlighting group of the word the you are hovering over
nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

command! ShowColours so $VIMRUNTIME/syntax/hitest.vim

" }}}

" Colours {{{

" Enables cursor line position tracking:
hi MatchParen ctermbg=243               " colour of bracket matching
highlight ColorColumn        ctermfg=NONE  ctermbg=233   cterm=NONE
highlight LineNR             ctermfg=244   ctermbg=NONE  cterm=NONE
highlight CursorLineNR       ctermfg=125   ctermbg=236   cterm=NONE
highlight Visual             ctermfg=NONE  ctermbg=236   cterm=NONE
highlight FoldColumn         ctermfg=004   ctermbg=234   cterm=BOLD

" colours for the line at the bottom of viewports
highlight StatusLine         ctermfg=250   ctermbg=125   cterm=NONE
highlight StatusLineNC       ctermfg=125   ctermbg=233   cterm=NONE
highlight StatusLineTerm     ctermfg=233   ctermbg=002   cterm=NONE
highlight StatusLineTermNC   ctermfg=002   ctermbg=233   cterm=BOLD
highlight VertSplit          ctermfg=125   ctermbg=NONE  cterm=NONE
highlight NonText            ctermfg=125   ctermbg=NONE  cterm=NONE
highlight SpecialKey         ctermfg=160   ctermbg=NONE  cterm=NONE

" folds
highlight Folded            ctermfg=248    ctermbg=235   cterm=NONE
highlight link FoldedColumn Folded

" }}}
