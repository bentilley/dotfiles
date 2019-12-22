" Vim filetype plugin file
" Language:     Ctags

" General Settings (make editing Ctags easier)
let maplocalleader = ";"
setlocal commentstring=#\ %s

" ALE (linting and fixing) Settings
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']

" Abbreviations
