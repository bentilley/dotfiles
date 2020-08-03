
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftdetect file
"
" Language: Catch2 (C++)
" Maintainer: Ben Tilley <targansaikhan@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufRead,BufNewFile *.cpp if filetypedetection#catch() | set filetype=cpp.catch-cpp | endif
