" Vim filetype plugin file
" Language:     Markdown

" General Settings (make editing Markdown easier)
let maplocalleader = ";"

" ALE (linting and fixing) Settings
let b:ale_fixers = ['prettier', 'remove_trailing_lines', 'trim_whitespace']

" Abbreviations


" Commenting
"nnoremap <buffer> <localleader>c 0i//<esc>
"nnoremap <buffer> <localleader>x ^2x
"vnoremap <buffer> <localleader>c <esc>`<0<c-v>`>I//<esc>
"vnoremap <buffer> <localleader>x `<0<c-v>`>0lx

" Colours
hi markdownItalic   ctermfg=NONE   ctermbg=241   cterm=NONE
