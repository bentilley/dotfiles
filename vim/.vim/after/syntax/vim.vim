" Vim Syntax

" File for additional Vim syntax


highlight link vimHighlight Keyword
highlight link vimCommand Keyword

highlight link vimSynType Statement

highlight link vimHiGroup Normal

" Custom Highligh Groups

" syn keyword cppClassDef	class nextgroup=cppClassName skipwhite
" syn match cppClassDecl '\i\+\(\s:\s\i\+\(,\s\i\+\)*\)\=\s{' contains=cppClassName
" syn match cppClassName '\i\+\ze[a-zA-Z0-9 :,]\+{' contained containedin=cppClassDecl

" highligh link cppClassDef Keyword
" highligh link cppClassName Structure
