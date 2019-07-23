" Vim filetype plugin file
" Language:     HTML

" ALE (linting and fixing) Settings
let b:ale_linters = ['htmlhint']
let b:ale_fixers = ['prettier', 'remove_trailing_lines', 'trim_whitespace']
" TODO work out if you can / want to add 'tidy' to the fixers
