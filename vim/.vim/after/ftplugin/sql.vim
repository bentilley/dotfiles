" Vim filetype plugin file
" Language:     SQL

" General Settings (make editing python easier)
let maplocalleader = ";"

" ALE (linting and fixing) Settings
let b:ale_linters = ['sqlint']
let b:ale_fixers = ['sqlformat', 'remove_trailing_lines', 'trim_whitespace']
let b:ale_sql_sqlformat_options = '-r --indent_columns'

" Abbreviations
