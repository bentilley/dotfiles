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

" ----- "
"  FZF  "
" ----- "
function squee#FZFDiff(...)
  " Fuzzy search the files that have changed between two diffs.
  " The default is to diff the HEAD and the merge-base.
  let l:base = get(a:000, 0, '$(git merge-base master HEAD)')
  call fzf#run({'source': 'git diff --name-only '.l:base, 'sink': 'e'})
endfunction

function! s:FZFHistorySink(...)
  let l:args_copy = deepcopy(a:000)
  call map(l:args_copy, {k, v -> substitute(v, '^\s*\d\+\s\+', '', '')})
  call append(line('.'), l:args_copy)
endfunction

function! squee#FZFHistory(...)
  let l:command = 'fc -R ~/.config/zsh/.zsh_history && fc -l 1'
  let l:history = system(l:command)
  call fzf#run({
    \'source': systemlist(l:command),
    \'options': ['--tac', '--multi'],
    \'sink': function('s:FZFHistorySink')
  \})
endfunction

" ----- "
"  ALE  "
" ----- "
function squee#ToggleALEFixOnSave()
  " Function to toggle the ALE fix on save setting for an individual buffer
  if !exists("b:ale_fix_on_save")
    let b:ale_fix_on_save = 0
    echom "Fix on save: OFF"
  else
    let b:ale_fix_on_save = !b:ale_fix_on_save
    echom "Fix on save: ".(b:ale_fix_on_save ? "ON" : "OFF")
  endif
endfunction
