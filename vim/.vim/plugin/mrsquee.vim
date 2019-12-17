if exists('g:loaded_mrsquee')
  finish
endif
let g:loaded_mrsquee = 1

nnoremap <Leader>ef :EditFTPlugin<CR>
command! -nargs=? EditFTPlugin call EditFTPlugin(<args>) 

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

function GetFirstFileType(filetypes)
  if match(a:filetypes, '\.') > 0
    return split(a:filetypes, '\.')[0]
  else
    return a:filetypes
  endif
endfunction


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
