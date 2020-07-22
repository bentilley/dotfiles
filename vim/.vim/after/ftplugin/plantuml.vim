" Vim filetype plugin file
" Language:     PlantUML

" General Settings (make editing python easier)
let maplocalleader = ";"

" Indenting

" ALE (linting and fixing) Settings
let b:ale_linters = []
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']

" Abbreviations

" Insert Mode Helpers

" Normal Mode Helpers

nnoremap <LocalLeader>n xi\n<Esc>
nnoremap <silent> <LocalLeader>f :<C-u>call FormatAnnotation()<CR>

" Helper functions

" Formatting Arrow/Note Annotations

let b:plantuml_max_annotation_width = 26

function! FormatAnnotation()
  let l:line_number = line('.')
  let l:line = getline('.')
  if l:line =~# ':'
    if l:line =~# '\i\+('
      let l:line = FormatAnnotationFunctionSignature(l:line)
    else
      let l:line = FormatAnnotationComment(l:line)
    endif
  endif
  call setline(l:line_number, l:line)
endfunction

function! FormatAnnotationComment(line)
  let [l:definition, l:annotation] = SplitDefinitionAndAnnotation(a:line)
  let l:annotation_tokens = split(l:annotation, ' ')
  let l:annotation = ''
  let l:next_line = ''
  while len(l:annotation_tokens) > 0
    let l:next = l:annotation_tokens->remove(0)
    if len(l:next_line.' '.l:next) > b:plantuml_max_annotation_width
      let l:next_line = l:next_line.'\n'
      let l:annotation = l:annotation.l:next_line
      let l:next_line = l:next
    else
      let l:next_line = l:next_line.' '.l:next
    endif
  endwhile
  let l:annotation = l:annotation.l:next_line
  return join([l:definition, l:annotation], ':')
endfunction

function! FormatAnnotationFunctionSignature(line)
  let [l:definition, l:annotation] = SplitDefinitionAndAnnotation(a:line)
  let l:annotation = substitute(l:annotation, '(', ' ', 'g')
  let l:annotation = substitute(l:annotation, ')', ' ', 'g')
  let l:annotation = substitute(l:annotation, ',', ' ', 'g')
  let l:annotation = substitute(l:annotation, '\s\+', ' ', 'g')
  let l:annotation_tokens = split(l:annotation, ' ')
  let l:function_name = l:annotation_tokens->remove(0)
  let l:annotation = ' '.l:function_name.'(\n  '
  while len(l:annotation_tokens) > 0
    let l:next = l:annotation_tokens->remove(0)
    let l:annotation = l:annotation.l:next
    if len(l:annotation_tokens) > 0
      let l:annotation = l:annotation.',\n  '
    endif
  endwhile
  let l:annotation = l:annotation.'\n)'
  return join([l:definition, l:annotation], ':')
  return a:line
endfunction

function! SplitDefinitionAndAnnotation(line)
  let [l:definition, l:annotation; l:rest] = split(a:line, ':')
  if len(l:rest)
    let l:annotation = join([l:annotation] + rest, ':')
  endif
  let l:annotation = trim(l:annotation)
  let l:annotation = substitute(l:annotation, '\\n', ' ', 'g')
  let l:annotation = substitute(l:annotation, '\s\+', ' ', 'g')
  return [l:definition, l:annotation]
endfunction
