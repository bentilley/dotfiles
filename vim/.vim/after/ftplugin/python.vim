" Vim filetype plugin file
" Language:     Python


" General Settings (make editing python easier)
let maplocalleader = ";"
let b:my_colour_column = 88
let g:pyindent_open_paren = 'shiftwidth()'


" Indenting
setlocal softtabstop=4
setlocal shiftwidth=4


" ALE (linting and fixing) Settings
let b:ale_linters = ['flake8', 'pylint', 'mypy']
let b:ale_fixers = ['black', 'remove_trailing_lines', 'trim_whitespace']

" If we're in my Services dir, enforce the 80 character line length
if expand('%:p') =~ $HOME.'/code/Services'
  let b:my_colour_column = 79
  let g:ale_python_black_options = '--line-length 79'
endif


" Python Syntax Plugin

let g:python_highlight_all = 1
let g:python_highlight_operators = 0


" Abbreviations
