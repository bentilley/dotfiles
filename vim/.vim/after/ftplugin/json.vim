" Vim filetype plugin file
" Language:     JSON

" ALE (linting and fixing) Settings
let b:ale_linters = ['jq']
let b:ale_fixers = ['jq', 'remove_trailing_lines', 'trim_whitespace']
