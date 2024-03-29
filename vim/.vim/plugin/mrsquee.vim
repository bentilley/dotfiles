if exists('g:loaded_mrsquee')
  finish
endif
let g:loaded_mrsquee = 1

" Scroll Off

command! -nargs=0 ToggleScrollView call squee#ToggleScrollView()
nnoremap <silent> <LocalLeader>c :ToggleScrollView<CR>

" Vim File Editing

command! -nargs=? EditFTPlugin call EditFTPlugin(<args>)
nnoremap <LocalLeader>ef :EditFTPlugin<CR>
command! -nargs=? EditSyntax call EditSyntax(<args>)
nnoremap <LocalLeader>es :EditSyntax<CR>

function EditFTPlugin(...)
  let l:ftplugin_after_dir = expand('~/.vim/after/ftplugin/')
  if a:0
    let l:filetype = a:1
  else
    let l:filetype = GetFirstFileType(&filetype)
  endif
  echom l:filetype
  execute 'vsplit ' . l:ftplugin_after_dir . l:filetype . '.vim'
endfunction

function EditSyntax(...)
  let l:ftplugin_after_dir = expand('~/.vim/after/syntax/')
  if a:0
    let l:filetype = a:1
  else
    let l:filetype = GetFirstFileType(&filetype)
  endif
  echom l:filetype
  execute 'vsplit ' . l:ftplugin_after_dir . l:filetype . '.vim'
endfunction

function GetFirstFileType(filetypes)
  if match(a:filetypes, '\.') > 0
    return split(a:filetypes, '\.')[0]
  else
    return a:filetypes
  endif
endfunction

" A command for silently running shell commands in the background without a
" screen redraw prompt - useful for tmux key bindings.
command! -nargs=1 Silent execute 'silent !'.<q-args> | execute 'redraw!'

" Quickfix List
" When using `dd` in the quickfix list, remove the item from the quickfix list.
" TODO make it so that this function can take a range
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>


" Redirecting vim commands
" i.e. i^R=Exec('ls')
function! Exec(command)
  redir =>output
  silent exec a:command
  redir END
  return output
endfunction
