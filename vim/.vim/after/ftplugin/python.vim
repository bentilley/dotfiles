" Vim filetype plugin file
" Language:     Python

" General Settings (make editing python easier)
let maplocalleader = ";"
set colorcolumn=88

" Indenting
setlocal softtabstop=4
setlocal shiftwidth=4

" ALE (linting and fixing) Settings
let b:ale_linters = ['flake8']
let b:ale_fixers = ['black', 'remove_trailing_lines', 'trim_whitespace']

" Abbreviations


" Commenting
nnoremap <buffer> <localleader>c 0i#<esc>
nnoremap <buffer> <localleader>x ^x
vnoremap <buffer> <localleader>c <esc>`<0<c-v>`>I#<esc>
vnoremap <buffer> <localleader>x `<0<c-v>`>0x
