
" C++ Syntax

" File for additional C++ syntax

syn keyword cppClassDef	class nextgroup=cppClassName skipwhite
syn match cppClassDecl '\i\+\(\s:\s\i\+\(,\s\i\+\)*\)\=\s{' contains=cppClassName
syn match cppClassName '\i\+\ze[a-zA-Z0-9 :,]\+{' contained containedin=cppClassDecl

highligh link cppClassDef Keyword
highligh link cppClassName Structure

syn match cppNamespaceChain '\i\+::\(\i\+::\)*' contains=cppNamespace
syn match cppNamespace '\i\+\ze::' contained containedin=cppNamespaceChain

highligh link cppNamespace ClassSpecial
