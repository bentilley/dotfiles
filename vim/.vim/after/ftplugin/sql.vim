" Vim filetype plugin file
" Language:     SQL

" General Settings (make editing python easier)
let maplocalleader = ";"
let b:my_colour_column = 100

" ALE (linting and fixing) Settings
let b:ale_linters = ['sqlint']
let b:ale_fixers = ['sqlformat', 'remove_trailing_lines', 'trim_whitespace']
" sqlformat => https://github.com/andialbrecht/sqlparse
let b:ale_sql_sqlformat_options = '--keywords upper --reindent --indent_columns'

" Abbreviations

" Commentary
let b:commentary_format = '-- %s'
