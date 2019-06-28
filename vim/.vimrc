" reset PATH variable so that vim used the system Python installation
" which lets YouCompleteMe run 
" let $PATH = '/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin'

call plug#begin('~/.vim/plugged')
Plug 'connorholyday/vim-snazzy'
Plug 'jiangmiao/auto-pairs'
" Plug 'Valloric/YouCompleteMe'
Plug 'pangloss/vim-javascript'          " js syntax highlighting
" Plug 'mxw/vim-jsx'                    " jsx syntax highlighting
Plug 'posva/vim-vue'                    " vue syntax highlighting
Plug 'w0rp/ale'                         " linting
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'majutsushi/tagbar'                " show tag window
Plug 'mileszs/ack.vim'                  " greping in vim
Plug 'junegunn/limelight.vim'           " hyper focused text highlighting
Plug 'Quramy/vim-js-pretty-template'    " template string highlighting
call plug#end()

set rtp+=/usr/local/opt/fzf
set path=$PWD/**
let mapleader=","                       " change the mapleader from \ to ,
set complete-=i                         " removes indluded files from search

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" handly quick file and directory edit mappings
nnoremap <silent> \v :e $MYVIMRC<CR>                                            " Edit vimrc configuration file
nnoremap <silent> <Leader>v :so $MYVIMRC<CR>                                    " Reload vimrc configuration file
nnoremap <silent> \\v :e ~/.vim<CR>                                             " Edit vim files
nnoremap <silent> \z :e ~/.zshrc<CR>                                            " Edit zsh configuration file
nnoremap <silent> \t :e ~/.tmux.conf<CR>                                        " Edit tmux configuration file
nnoremap <silent> <Leader>t :!tmux source ~/.tmux.conf<CR>                      " Reload tmux configuration file

" set up colour scheme
"colorscheme snazzy

" Limelight config
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.4
let g:limelight_paragraph_span = 0
nmap <Leader>i :Limelight!!<CR>
function! SetLimelightSpan(span)
  let g:limelight_paragraph_span = a:span
endfunction
nmap dl :<C-U>call SetLimelightSpan(v:count)<CR>jk
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

" colours for the line at the bottom of viewports
hi StatusLine     ctermfg=253   ctermbg=126     cterm=NONE
hi StatusLineNC   ctermfg=089   ctermbg=253     cterm=NONE
hi VertSplit      ctermfg=000   ctermbg=013

" diff tool colours
hi DiffAdd        ctermfg=NONE  ctermbg=022     cterm=none      
hi DiffChange     ctermfg=NONE  ctermbg=094     cterm=none      
hi DiffDelete     ctermfg=203   ctermbg=052     cterm=bold      
hi DiffText       ctermfg=NONE  ctermbg=017     cterm=none      

set clipboard+=unnamed                   " yanking goes straigth clipboard buffer
set mouse=a                              " setting up the mouse
set noea                                 " stopping windows from automatic resize on close
set softtabstop=2 shiftwidth=2 expandtab " spaces instead of tabs, and set indent width
set backspace=2                          " make backspace work like most other programs
set incsearch                            " highlight first search match while typing
set hlsearch | nohl                      " highlight all search matches when search completed
set number                               " add line numbers
set relativenumber                       " do line numbering relative to current cursor row
set notagrelative                        " tags not followed relative to tag file
set ignorecase                           " search case insensitive - use \C for sensitive
set smartcase                            " search case sensitive if contains capital letters

" file name to clipboard
nmap \cs o<Esc>:let @+=expand("%")<CR>"+p
nmap \cl o<Esc>:let @+=expand("%:p")<CR>"+p

" fold commands
nnoremap sfld :set foldmethod=syntax<CR>
nnoremap mfld :set foldmethod=manual<CR>

" Enables cursor line position tracking:
set cursorline
set colorcolumn=80                      " colour column 80
hi ColorColumn ctermbg=237              " colour of colourcolumn
hi clear CursorLine                     " removes underline from cursorline
hi CursorLineNR ctermbg=240             " colour of cursorline number
hi clear SignColumn                     " make ALE gutter neutral colour
hi MatchParen ctermbg=243               " colour of bracket matching

" netrw - vims own file system explorer configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 50
let g:netrw_altv=1 | let g:netrw_alto=1

" Prettier
"nnoremap <Leader>p :silent %!prettier --stdin --trailing-comma all --single-quote %f<CR>
nnoremap <Leader>p :silent %!prettier 
      \--stdin --stdin-filepath % --trailing-comma all --single-quote<CR>

" ALE seettings
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'html': ['prettier'],
      \ 'css': ['prettier']
      \ }
let g:ale_completion_enabled = 1

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
map <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
