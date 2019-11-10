" TODO Readd the source guard
" if exists('g:loaded_mrsquee')
"   finish
" endif
" let g:loaded_mrsquee = 1

let s:vim_home = expand("~/.vim")

function! SetupFiletypePlugin(filetype)
  let l:ftplugin_dir = g:vim_home . "/ftplugin"
  echo a:filetype
  echo l:ftplugin_dir
  echo "!touch " . l:ftplugin_dir . "/" . a:filetype
  " execute "silent !mkdir" . l:ftplugin_dir . "/" . a:filetype
  " redraw!
endfunction
