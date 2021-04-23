" Vim filetype plugin file
" Language:     Rust

" General Settings (make editing python easier)
let maplocalleader = ";"
let b:my_colour_column = 100

" Indenting
setlocal softtabstop=4
setlocal shiftwidth=4

" ALE (linting and fixing) Settings
let b:ale_linters = ['analyzer']
let b:ale_fixers = ['rustfmt', 'remove_trailing_lines', 'trim_whitespace']

" Abbreviations

" iabbrev <n << "\n";

" Extra Commands

" command! -nargs=0 Docs !open https://devdocs.io/cpp/
