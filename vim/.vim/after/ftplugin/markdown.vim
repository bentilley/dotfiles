" Vim filetype plugin file
" Language:     Markdown

" General Settings (make editing Markdown easier)
let maplocalleader = ";"
setlocal formatoptions+=a

" Hotkeys

nnoremap <buffer> <silent> <localleader>f :call ToggleAutoFormatting()<CR>

function ToggleAutoFormatting()
  let l:format_options = &formatoptions
  if l:format_options =~# "a"
    setlocal formatoptions-=a
  else
    setlocal formatoptions+=a
  endif
endfunction

" ALE (linting and fixing) Settings
let b:ale_fixers = ['prettier', 'remove_trailing_lines', 'trim_whitespace']

" Abbreviations
abbreviate <buffer> td **TODO:**

" Font Styling
nnoremap <buffer> <localleader>b wbi**<Esc>ea**<Esc>
nnoremap <buffer> <localleader>e wbi_<Esc>ea_<Esc>
xnoremap <buffer> <localleader>b <Esc>`>a**<Esc>`<i**<Esc>
xnoremap <buffer> <localleader>e <Esc>`>a_<Esc>`<i_<Esc>
xnoremap <buffer> <localleader>l <Esc>`>a]<Esc>`<i[<Esc>f]a(<C-R>+)<Esc>

" Colours
hi markdownItalic   ctermfg=NONE   ctermbg=241   cterm=NONE
