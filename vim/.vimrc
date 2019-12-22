" reset PATH variable so that vim used the system Python installation
" which lets YouCompleteMe run 
" let $PATH = '/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin'

source ~/.dotfiles/vim/learning.vim
let g:AutoPairsMapCh = 0

" Plugins {{{

call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'                 " provides 'snippet' functionality
Plug 'pangloss/vim-javascript'          " js syntax highlighting
Plug 'posva/vim-vue'                    " vue syntax highlighting
Plug 'w0rp/ale'                         " linting and fixing
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'                " show tag window
Plug 'mileszs/ack.vim'                  " greping in vim
Plug 'junegunn/limelight.vim'           " hyper focused text highlighting
Plug 'Quramy/vim-js-pretty-template'    " template string highlighting
Plug 'mattn/emmet-vim'                  " html tag completion
Plug 'mxw/vim-jsx'                      " jsx syntax highlighting
Plug 'aklt/plantuml-syntax'             " plantuml syntax highlighting
Plug 'weirongxu/plantuml-previewer.vim' " plantuml previewer in browser
Plug 'tyru/open-browser.vim'            " open URI in browser
" Plug 'szymonmaszke/vimpyter'          " ipython integration
" Plug 'wmvanvliet/jupyter-vim'         " ipython integration
" Plug 'ivanov/vim-ipython'             " ipython integration
" Plug 'Valloric/YouCompleteMe'         " autocomplete for vim
call plug#end()

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
nnoremap <silent> <Leader>ev :vs $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :source $MYVIMRC<CR>
nnoremap <silent> <Leader>sf :source %<CR>
nnoremap <silent> <Leader>vd :vs ~/.dotfiles/vim/.vim<CR>
nnoremap <silent> <Leader>t :!tmux source ~/.tmux.conf<CR>

" }}}

" Basic Editor Settings {{{

colorscheme squeedom
set undofile
set undodir^=~/.vimextra/undo//               " set a directory for undo files
let mapleader = "\\"
let maplocalleader = ";"
set clipboard+=unnamed                   " yanking goes straigth clipboard buffer
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
set listchars=eol:$,space:.,tab:<->,trail:%,precedes:<,extends:>
set sidescroll=5
set timeoutlen=1000 ttimeoutlen=0        " exit visual faster
set rtp+=/usr/local/opt/fzf
set path=$PWD/**
set complete-=i                         " removes indluded files from search
" TODO read status line docs
" TODO autocommands and setlocal to define diff status lines for diff filetype
set statusline=%f%=[%4l/%4L]
set omnifunc=syntaxcomplete#Complete

" }}}

" Normal Mode Helpers {{{

" tab settings - a la unimpaired
nnoremap [w :tabprevious<CR>
nnoremap ]w :tabnext<CR>

" linting helpers
nnoremap <leader>g gggqG<c-o><c-o>zz

" file name to clipboard
nnoremap <Leader>cf :let @+=expand("%")<CR>
nnoremap <Leader>cd :let @+=expand("%:p")<CR>

" fold commands
nnoremap sfld :set foldmethod=syntax<CR>
nnoremap mfld :set foldmethod=manual<CR>
nnoremap <space> za

" renaming things
nnoremap <Leader>rn yiw:%s/<c-r>+/

nnoremap <Leader>bs yiw:BufSearch <C-R>0<CR>

" generate ctags
nnoremap <Leader>c :terminal ++hidden ctags -R -f ./.git/tags .<CR>

" }}}

" Insert Mode Helpers {{{

" exit insert mode
" inoremap jk <esc>
"inoremap <esc> <nop>

" toggle word cases
inoremap <c-u> <esc>lviwUea
inoremap <c-y> <esc>lviwuea
" undo
inoremap <c-z> <esc>ua

" movement in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

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

" }}}

" Abbreviations {{{



" }}}

" Vimdiff helpers {{{

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

" Enclosing Things "'`([{ {{{

" TODO earmarked for removal as now using surround plugin

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>` viw<esc>a`<esc>bi`<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>` <esc>`<i`<esc>`>la`<esc>
vnoremap <leader>( <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>[ <esc>`<i[<esc>`>la]<esc>
vnoremap <leader>{ <esc>`<i{<esc>`>la}<esc>

" }}}

" NETRW Settings {{{

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 50
let g:netrw_altv=1 | let g:netrw_alto=1

" }}}

" Prettier Settings {{{

nnoremap <Leader>p :silent %!prettier
      \ --stdin --stdin-filepath % --trailing-comma all --single-quote<CR>

" }}}

" ALE Settings {{{

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_completion_enabled = 1
nnoremap [j :ALENext<cr>
nnoremap ]j :ALEPrevious<cr>
nnoremap ]J :ALEFirst<cr>
nnoremap ]J :ALELast<cr>

" }}}

" Ultisnips Settings {{{

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-g>"
"inoremap <localleader>u <C-R>=UltiSnips#ListSnippets()<CR>

" }}}

" Limelight Settings {{{

let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.4
let g:limelight_paragraph_span = 0
nnoremap <Leader>i :Limelight!!<CR>
function! SetLimelightSpan(span)
  let g:limelight_paragraph_span = a:span
endfunction
nnoremap dl :<C-U>call SetLimelightSpan(v:count)<CR>jk
xnoremap <Leader>l :Limelight<CR>

" }}}

" Tagbar Settings {{{

let g:tagbar_ctags_bin="/usr/local/bin/ctags"
nnoremap <silent> tt :TagbarToggle<CR>          " as in 'tag! tag!'
nnoremap <silent> tg :TagbarOpenAutoClose<CR>   " as in 'tag go!'
nnoremap <silent> tp :TagbarTogglePause<CR>     " as in 'tag pause!'

" }}}

" Emmet Settings {{{

let g:user_emmet_leader_key=','     " trigger emmet expansion with ,,

" }}}

" Ack Settings {{{

" TODO Read the Ack docs
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
let g:ackhighlight = 1
let g:ack_autoclose = 1
command! -nargs=* -bang Ag call ack#Ack('grep<bang>',<q-args>)
nnoremap ag :Ag!<Space>
nnoremap sg :Ag<Space>

" }}}

" Custom Commands {{{

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Command for searching all open buffers for a word
if !exists(":BufSearch")
  command -nargs=1 BufSearch :cexpr [] | :bufdo vimgrepadd <args> %
endif

" }}}

" template literal highlighting
nnoremap <Leader>h :JsPreTmpl html<CR>

nnoremap <M-,> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <M-.> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" for showing you the syntax highlighting group of the word the you are hovering over
nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

command ShowColours so $VIMRUNTIME/syntax/hitest.vim
