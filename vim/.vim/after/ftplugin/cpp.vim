" Vim filetype plugin file
" Language:     C++

" General Settings (make editing python easier)
let maplocalleader = ";"
"set colorcolumn=88

" Indenting
setlocal softtabstop=2
setlocal shiftwidth=2

" ALE (linting and fixing) Settings
let b:ale_linters = ['gcc']
let b:ale_fixers = ['clang-format', 'remove_trailing_lines', 'trim_whitespace']

" Abbreviations


" Commenting
"nnoremap <buffer> <localleader>c ^i#<esc>
"nnoremap <buffer> <localleader>x ^x
"vnoremap <buffer> <localleader>c <esc>`<^<c-v>`>I#<esc>
"vnoremap <buffer> <localleader>x <esc>`<^<c-v>`>^x

