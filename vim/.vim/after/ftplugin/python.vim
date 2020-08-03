" Vim filetype plugin file
" Language:     Python


" General Settings (make editing python easier)
let maplocalleader = ";"
let b:my_colour_column = 88


" Indenting
setlocal softtabstop=4
setlocal shiftwidth=4


" ALE (linting and fixing) Settings
let b:ale_linters = ['flake8', 'pylint', 'mypy']
let b:ale_fixers = ['black', 'remove_trailing_lines', 'trim_whitespace']


" Abbreviations


" Commenting
nnoremap <buffer> <localleader>c ^i#<esc>
nnoremap <buffer> <localleader>x ^x
vnoremap <buffer> <localleader>c <esc>`<^<c-v>`>I#<esc>
vnoremap <buffer> <localleader>x <esc>`<^<c-v>`>^x
