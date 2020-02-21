" Vim filetype plugin file
" Language:     SQL

" General Settings (make editing python easier)
let maplocalleader = ";"

" ALE (linting and fixing) Settings
let b:ale_linters = ['sqlint']
let b:ale_fixers = ['sqlfmt', 'remove_trailing_lines', 'trim_whitespace']

" Abbreviations


" Commenting
" nnoremap <buffer> <localleader>c ^i#<esc>
" nnoremap <buffer> <localleader>x ^x
" vnoremap <buffer> <localleader>c <esc>`<^<c-v>`>I#<esc>
" vnoremap <buffer> <localleader>x <esc>`<^<c-v>`>^x
