" Vim filetype plugin file
" Language:     CSS

" ALE (linting and fixing) Settings
let b:ale_linters = ['csslint']
let b:ale_fixers = ['prettier', 'remove_trailing_lines', 'trim_whitespace']
