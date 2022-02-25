" Go filetype plugin file
" Language:     Go


" General Settings (make editing python easier)
let maplocalleader = ";"
set textwidth=100
let b:my_colour_column = 100
" let b:op_format_cmd = 'black --fast --quiet -'


" Indenting
setlocal softtabstop=4 tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab


" ALE (linting and fixing) Settings
let b:ale_linters = ['golangci-lint']
let b:ale_fixers = ['golines', 'remove_trailing_lines', 'trim_whitespace']

" let g:ale_go_golangci_lint_options = '--out-format=github-actions'
let g:ale_go_golangci_lint_package = 1


" Online Docs
setlocal keywordprg=devdocs\ -l\ go\ -q


" Abbreviations
