" Vim filetype plugin file
" Language:     Markdown

" General Settings (make editing Markdown easier)
let maplocalleader = ";"
setlocal formatoptions+=a

" ALE (linting and fixing) Settings
let b:ale_fixers = ['prettier', 'remove_trailing_lines', 'trim_whitespace']

" Abbreviations
abbreviate td **TODO:**

" Font Styling
nnoremap <buffer> <localleader>b wbi**<Esc>ea**<Esc>
nnoremap <buffer> <localleader>e wbi_<Esc>ea_<Esc>

" Colours
hi markdownItalic   ctermfg=NONE   ctermbg=241   cterm=NONE
