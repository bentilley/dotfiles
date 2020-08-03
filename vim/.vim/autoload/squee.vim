" A way to set the colour column highlighting only on columns that go over the
" limit

let s:current_matches = {}
let g:my_colour_column = 80

function! squee#SetMyColorColumn()
  let l:win_id = win_getid()
  if has_key(s:current_matches, l:win_id)
    call matchdelete(s:current_matches[l:win_id])
  endif

  let l:col_number = exists("b:my_colour_column") ? b:my_colour_column : g:my_colour_column

  let l:match_pat = '\%'.(l:col_number + 1).'v.'
  let s:current_matches[l:win_id] = matchadd('Todo', l:match_pat, 100)
endfunction

function! squee#SetMyColorColumnCleanUp()
  let l:win_id = win_getid()
  if has_key(s:current_matches, l:win_id)
    call remove(s:current_matches, l:win_id)
  endif
endfunction
