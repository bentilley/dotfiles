" Vim filetype plugin file
" Language:     Haskell

" General Settings (make editing python easier)
let maplocalleader = ";"
set colorcolumn=80

" Indenting
" setlocal softtabstop=2
" setlocal shiftwidth=2

" ALE (linting and fixing) Settings
let b:ale_linters = ['hlint']
let b:ale_fixers = ['brittany', 'remove_trailing_lines', 'trim_whitespace']

" Abbreviations

" Extra Commands
nnoremap <LocalLeader>go :.!hlint - --refactor<CR>
nnoremap <LocalLeader>ga :%!hlint - --refactor<CR>

" command! -nargs=0 Docs !open https://devdocs.io/cpp/
