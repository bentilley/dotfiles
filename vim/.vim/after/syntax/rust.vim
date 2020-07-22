" Rust Syntax

" File for additional Rust syntax

" syn keyword cppClassDef	class nextgroup=cppClassName skipwhite
" syn match cppClassDecl '\i\+\(\s:\s\i\+\(,\s\i\+\)*\)\=\s{' contains=cppClassName
" syn match cppClassName '\i\+\ze[a-zA-Z0-9 :,]\+{' contained containedin=cppClassDecl

highligh link rustType Statement

highligh link rustTrait ClassSpecial
highligh link rustModPath ClassSpecial
highligh link rustModPathSep None
