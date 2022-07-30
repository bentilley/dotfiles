" grep.vim
" Author:  Ben Tilley
" Created: 2022-07-27
" Plugin for better grep command

command! -bang -nargs=* -complete=file Grep lua require("grep").grep(<q-args>, <q-bang>)
command! -bang -nargs=* -complete=file Lgrep lua require("grep").lgrep(<q-args>, <q-bang>)
