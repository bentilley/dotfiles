" Vim filetype plugin file
" Language:     JavaScript

" General Settings (make editing HTML easier)
let maplocalleader = ";"

" ALE (linting and fixing) Settings
let b:ale_linters = ['eslint']
let b:ale_fixers = ['prettier', 'remove_trailing_lines', 'trim_whitespace']

" Abbreviations


" Commenting
nnoremap <buffer> <localleader>c 0i//<esc>
nnoremap <buffer> <localleader>x ^2x
vnoremap <buffer> <localleader>c <esc>`<^<c-v>`>I//<esc>
vnoremap <buffer> <localleader>x <esc>`<^<c-v>`>^lx
