" C++ Syntax

" File for additional C++ syntax


highlight link cStorageClass Keyword
highlight link cStatement Keyword
highlight link cppStatement Keyword
highlight link cRepeat Keyword
highlight link cCustomAccessKey Keyword
highlight link cppModifier Keyword
highlight link cCustomClassKey Keyword
highlight link cppAccess Keyword
highlight link cStructure Keyword
highlight link cppExceptions Keyword
highlight link cppOperator Keyword
highlight link cLabel Keyword

highlight link cppClassDef Keyword
highlight link cppClassName Structure

highlight link cCustomClass ClassSpecial
highlight link cppSTLnamespace ClassSpecial


" Custom Highligh Groups

" Redefine the cParen region so that it doesn't include cppType
" syn region myCParen transparent start='(' end=')' contains=ALLBUT,@cParenGroup,cCppParen,@cStringGroup,@Spell,cppTypeParam

" Class definitions
syn keyword cppClassDef	class nextgroup=cppClassName skipwhite
syn match cppClassDecl '\i\+\(\s:\s\i\+\(,\s\i\+\)*\)\=\s{' contains=cppClassName
syn match cppClassName '\i\+\ze[a-zA-Z0-9 :,]\+{' contained containedin=cppClassDecl

highligh link cppClassDef Keyword
highligh link cppClassName Structure

" Namespaced functions and types
syn match cppNamespaceChain '\i\+::\(\i\+::\)*\i\+' contains=cppNamespace,cppNamespacedType,cUserFunction
syn match cppNamespace '\i\+\ze::' contained containedin=cppNamespaceChain
syn match cppNamespacedType '::\zs\i\+\ze[ }]' contained containedin=cppNamespaceChain

highligh link cppNamespace ClassSpecial
highligh link cppNamespacedType Type

" *'s and &'s for references and pointers
syn match cppReference '&\ze\i\+'
syn match cppPointer '\*\ze\i\+'
syn match cppClassInstantiation '^\s*\zs[A-Z]\i\+ '
syn match cppFunctionArgType '\i\+\ze [&*]\=\i\+[,)]'

highligh link cppReference StorageClass
highligh link cppPointer StorageClass
highligh link cppClassInstantiation Type
highligh link cppFunctionArgType cppType

" Types in angle brackets
syn region cppTypeParameters start='<[^<( =]' end='>' contains=cppTypeParam,cppSTLnamespace,cppSTLtype
syn match cppTypeParam '<\=\zs\i\+\ze[,>]' contained containedin=cppTypeParameters
syn cluster cParenGroup add=cppTypeParam

highligh link cppTypeParam cppType

" Doc String Comments
syn match cDocStringDirective '@\i\+ ' contained containedin=cComment

highlight link cDocStringDirective Special
