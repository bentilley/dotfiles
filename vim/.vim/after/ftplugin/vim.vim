" Vim filetype plugin file
" Language:     VimScript

" General Settings (make editing python easier)
let maplocalleader = ";"

" Indenting

" ALE (linting and fixing) Settings
let b:ale_linters = ['ale_custom_linting_rules', 'vimls', 'vint']
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']

" Abbreviations
