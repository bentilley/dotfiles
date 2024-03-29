" Vim filetype plugin file
" Language:     Python


" General Settings (make editing python easier)
let maplocalleader = ";"
let b:my_colour_column = 88
let g:pyindent_open_paren = 'shiftwidth()'
let b:op_format_cmd = 'black --fast --quiet -'
" setlocal formatprg=black\ --fast\ --quiet\ -


" Indenting
setlocal softtabstop=4
setlocal shiftwidth=4


" ALE (linting and fixing) Settings
" let b:ale_linters = ['flake8', 'pylint', 'mypy']
let b:ale_linters = ['flake8', 'mypy']
let b:ale_fixers = ['black', 'remove_trailing_lines', 'trim_whitespace']


" Vim-test Plugin
" let g:test#runner_commands = ['PyTest']


" Python Syntax Plugin

let g:python_highlight_all = 1
let g:python_highlight_operators = 0


" Abbreviations


" Vim Python Docstring Settings {{{

nnoremap <LocalLeader>d :Docstring<CR>

" }}}
