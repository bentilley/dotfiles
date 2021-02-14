" Vim filetype plugin file
" Filetype:     Git Commits

" General Settings (make editing python easier)
let maplocalleader = ";"
let b:my_colour_column = 80


" Autocomplete for commit types
setlocal complete+=k
setlocal dictionary+=~/.dotfiles/git/committypes.txt


" ALE (linting and fixing) Settings
" let b:ale_linters = ['flake8', 'pylint', 'mypy']
" let b:ale_fixers = ['black', 'remove_trailing_lines', 'trim_whitespace']


" Abbreviations
