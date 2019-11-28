"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftdetect file
"
" Language: Redux (JavaScript)
" Maintainer: Ben Tilley <targansaikhan@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufRead,BufNewFile *.jsx\= if s:DetectReduxFile() | echo "march!"

let s:redux_import_pattern = ""
let s:dispatch_pattern = "dispatch"
let s:mapstate_pattern = ""
let s:mapdispatch_pattern = ""
" let s:action_creator_pattern = ""

function s:DetectReduxFile()
  let s:redux_import_found = search(s:redux_import_pattern, 'npw')
  let s:dispatch_found = search(s:dispatch_pattern, 'npw')
  let s:mapstate_found = search(s:mapstate_pattern, 'npw')
  let s:mapdispatch_found = search(s:mapdispatch_pattern, 'npw')

  if s:redux_import_found || s:dispatch_found || s:mapstate_found || s:mapdispatch_found
    return 1
  else
    return 0
  endif
endfunction
