" Vim filetype plugin file
" Language:     HTML

" General Settings (make editing HTML easier)
setlocal nowrap
let maplocalleader = ";"

" ALE (linting and fixing) Settings
let b:ale_linters = ['htmlhint']
let b:ale_fixers = ['prettier', 'remove_trailing_lines', 'trim_whitespace']
" TODO work out if you can / want to add 'tidy' to the fixers

" Abbreviations


" Commenting
nnoremap <buffer> <localleader>c I<!--<esc>A--><esc>
nnoremap <buffer> <localleader>x ^4x$2h3x
