" Vim filetype plugin file
" Language:     Typescript

" General Settings (make editing Typescript easier)
let maplocalleader = ";"
setlocal makeprg=node_modules/typescript/bin/tsc
execute "UltiSnipsAddFiletypes javascript"

inoremap ;j <Esc>mhA;<Esc>`ha

" Online Docs
setlocal keywordprg=mozilla\ js

" ALE (linting and fixing) Settings
let b:ale_linters = ['eslint']
let b:ale_fixers = ['prettier', 'remove_trailing_lines', 'trim_whitespace']

" Abbreviations
abbreviate /T // TODO

" Operator Pending Mappings

" a test
" TODO make a file detect for 'jest' and add this to the jest ftplugin
xnoremap iit :<C-U>execute "normal! ?^\\s*[xf]\\=it(\r:nohlsearch\rf(vib"<CR>
xnoremap ait :<C-U>execute "normal! ?^\\s*[xf]\\=it(\r:nohlsearch\rvf(%$"<CR>
onoremap iit :<C-U>execute "normal! ?^\\s*[xf]\\=it(\r:nohlsearch\rf(vib"<CR>
onoremap ait :<C-U>execute "normal! ?^\\s*[xf]\\=it(\r:nohlsearch\rvf(%$"<CR>
xnoremap ides :<C-U>execute "normal! ?^\\s*[xf]\\=describe(\r:nohlsearch\rf(vib"<CR>
xnoremap ades :<C-U>execute "normal! ?^\\s*[xf]\\=describe(\r:nohlsearch\rvf(%$"<CR>
onoremap ides :<C-U>execute "normal! ?^\\s*[xf]\\=describe(\r:nohlsearch\rf(vib"<CR>
onoremap ades :<C-U>execute "normal! ?^\\s*[xf]\\=describe(\r:nohlsearch\rvf(%$"<CR>
