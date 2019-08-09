" reset PATH variable so that vim used the system Python installation
" which lets YouCompleteMe run 
" let $PATH = '/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin'

call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'                 " provides 'snippet' functionality
Plug 'pangloss/vim-javascript'          " js syntax highlighting
Plug 'posva/vim-vue'                    " vue syntax highlighting
Plug 'w0rp/ale'                         " linting and fixing
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'majutsushi/tagbar'                " show tag window
Plug 'mileszs/ack.vim'                  " greping in vim
Plug 'junegunn/limelight.vim'           " hyper focused text highlighting
Plug 'Quramy/vim-js-pretty-template'    " template string highlighting
Plug 'mattn/emmet-vim'                  " html tag completion
" Plug 'Valloric/YouCompleteMe'         " autocomplete for vim
" Plug 'mxw/vim-jsx'                    " jsx syntax highlighting
call plug#end()

" automatically source vimrc after session load
augroup sessions
  autocmd!
  autocmd SessionLoadPost * :source $MYVIMRC
augroup END

" handly quick file and directory edit mappings
nnoremap <silent> <Leader>ev :vs $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>
nnoremap <silent> <Leader>vd :vs ~/.dotfiles/vim/.vim<CR>
nnoremap <silent> <Leader>t :!tmux source ~/.tmux.conf<CR>

" editor settings
let mapleader = "\\"
let maplocalleader = ";"
set clipboard+=unnamed                   " yanking goes straigth clipboard buffer
set mouse=a                              " setting up the mouse
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

" insert mode helpers:
" exit insert mode
inoremap jk <esc>
"inoremap <esc> <nop>
" toggle word cases
inoremap <c-u> <esc>lviwUea
inoremap <c-i> <esc>lviwuea
" undo
inoremap <c-z> <esc>ua

" operator-pending mappings e.g iw or i(
" next and last brakets
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap al( :<c-u>normal! F)va(<cr>

" enclosing things using '"([{
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>( <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>[ <esc>`<i[<esc>`>la]<esc>
vnoremap <leader>{ <esc>`<i{<esc>`>la}<esc>

" file name to clipboard
nnoremap <Leader>cs o<Esc>:let @+=expand("%")<CR>"+p
nnoremap <Leader>cl o<Esc>:let @+=expand("%:p")<CR>"+p

" fold commands
nnoremap sfld :set foldmethod=syntax<CR>
nnoremap mfld :set foldmethod=manual<CR>
nnoremap <space> za

" Enables cursor line position tracking:
set cursorline
set colorcolumn=80
hi clear CursorLine                     " removes underline from cursorline
hi clear SignColumn                     " make ALE gutter neutral colour
hi ColorColumn ctermbg=237              " colour of colourcolumn
hi CursorLineNR ctermbg=240             " colour of cursorline number
hi MatchParen ctermbg=243               " colour of bracket matching

" colours for the line at the bottom of viewports
hi StatusLine     ctermfg=253   ctermbg=126     cterm=NONE
hi StatusLineNC   ctermfg=089   ctermbg=253     cterm=NONE
hi VertSplit      ctermfg=126   ctermbg=234     cterm=NONE
hi NonText        ctermfg=126   ctermbg=NONE    cterm=NONE
hi SpecialKey     ctermfg=160   ctermbg=NONE    cterm=NONE

" diff tool colours
hi DiffAdd        ctermfg=NONE  ctermbg=022     cterm=NONE
hi DiffChange     ctermfg=NONE  ctermbg=094     cterm=NONE
hi DiffDelete     ctermfg=203   ctermbg=052     cterm=BOLD
hi DiffText       ctermfg=NONE  ctermbg=017     cterm=NONE

" netrw - vims own file system explorer configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 50
let g:netrw_altv=1 | let g:netrw_alto=1

" Prettier
nnoremap <Leader>p :silent %!prettier
      \ --stdin --stdin-filepath % --trailing-comma all --single-quote<CR>

" ALE settings
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_completion_enabled = 1

" Ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
"inoremap <C-M> <C-R>=UltiSnips#ListSnippets()<CR>

" Limelight config
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.4
let g:limelight_paragraph_span = 0
nnoremap <Leader>i :Limelight!!<CR>
function! SetLimelightSpan(span)
  let g:limelight_paragraph_span = a:span
endfunction
nnoremap dl :<C-U>call SetLimelightSpan(v:count)<CR>jk
nnoremap <Leader>l <Plug>(Limelight)

" Tagbar settings
let g:tagbar_ctags_bin="/usr/local/bin/ctags"
nnoremap <silent> tt :TagbarToggle<CR>          " as in 'tag! tag!'
nnoremap <silent> tg :TagbarOpenAutoClose<CR>   " as in 'tag go!'
nnoremap <silent> tp :TagbarTogglePause<CR>     " as in 'tag pause!'

" Emmet settings
let g:user_emmet_leader_key=','                 " trigger emmet expansion with ,,

" ack.vim settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ackhighlight = 1
let g:ack_autoclose = 1
command! -nargs=* -bang Ag call ack#Ack('grep<bang>',<q-args>)
nnoremap ag :Ag<Space>
nnoremap cag :Ag<CR>

" tab settings - a la unimpaired
nnoremap [w :tabprevious<CR>
nnoremap ]w :tabnext<CR>

" template literal highlighting
nnoremap <Leader>h :JsPreTmpl html<CR>

nnoremap <M-,> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <M-.> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" for showing you the syntax highlighting group of the word the you are hovering over
noremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
