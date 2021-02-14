" Vim filetype plugin file
" Language:     Shell


" General Settings (make editing sh/bash easier)
let maplocalleader = ";"
let b:my_colour_column = 80


" Indenting
" setlocal softtabstop=4
" setlocal shiftwidth=4


" ALE (linting and fixing) Settings
let b:ale_linters = ['shellcheck']
let b:ale_fixers = ['shfmt']


" Abbreviations
