" Vim filetype plugin file
" Language:     LaTeX

" General Settings (make editing Latex easier)
let maplocalleader = ";"
setlocal spell

" augroup LatexSave
"   autocmd!
"   autocmd BufWritePost *.tex call CompileLatex()
" augroup END
"
nnoremap <silent><buffer> <LocalLeader>r :call CompileLatex()<CR>

function CompileLatex()
  silent !xelatex "%" && open "%:r.pdf"
  redraw!
endfunction

" ALE (linting and fixing) Settings
let b:ale_linters = ['lacheck']
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']

" Abbreviations
abbreviate ;t % TODO

" Operator Pending Mappings
