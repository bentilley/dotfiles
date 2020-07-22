
" Shell Syntax

" File for additional Shell syntax


highlight link shLoop Keyword

highlight link shVariable VariableSpecial
highlight link shDerefVar VariableSpecial

highlight link shSnglCase None

" " Types in angle brackets
" syn region cppTypeParameters start='<[^<( ]' end='>' contains=cppTypeParam,cppSTLnamespace,cppSTLtype
" syn match cppTypeParam '<\=\zs\i\+\ze[,>]' contained containedin=cppTypeParameters
" syn cluster cParenGroup add=cppTypeParam

" highligh link cppTypeParam cppType
