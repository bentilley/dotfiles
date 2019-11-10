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
