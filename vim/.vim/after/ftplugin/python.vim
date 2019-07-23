" Vim filetype plugin file
" Language:     Python

" Indenting
setlocal softtabstop=4
setlocal shiftwidth=4

" ALE (linting and fixing) Settings
let b:ale_linters = ['flake8']
let b:ale_fixers = ['black', 'remove_trailing_lines', 'trim_whitespace']
