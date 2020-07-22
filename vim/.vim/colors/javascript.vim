" Javascript Syntax

" File for additional Javascript syntax

highlight LittleBit          ctermfg=222   ctermbg=NONE   cterm=NONE

" Using defaults

highlight link jsComment Comment

highlight link jsOperator LittleBit
highlight link jsTernaryIfOperator LittleBit

highlight link jsClassKeyword Keyword
highlight link jsClassMethodType Keyword
highlight link jsOperatorKeyword Keyword
highlight link jsReturn Keyword
highlight link jsExtendsKeyword Keyword
highlight link jsFunction Keyword
highlight link jsLabel Keyword
highlight link jsRepeat Keyword
" highlight link jsStatement Keyword

highlight link jsConditional Conditional

highlight link jsImport Include
highlight link jsfrom Include
highlight link jsModuleAs Include
highlight link jsExport Include

highlight link jsFuncName Structure
highlight link jsClassDefinition Structure

highlight link jsModuleKeyword Function
highlight link jsClassFuncName Function
highlight link jsFuncCall Function
highlight link jsSuper Function
highlight link jsThis FunctionSpecial

highlight link jsString String
highlight link jsTemplateString String
highlight link jsTemplateBraces StringSpecial

highlight link jsStorageClass StorageClass

highlight link jsGlobalObjects Constant

highlight link jsExportDefault VariableSpecial

highlight link jsTry TryCatchSpecial
highlight link jsCatch TryCatchSpecial
highlight link jsTryCatchBraces TryCatchSpecial
highlight link jsParensCatch TryCatchSpecial
highlight link jsParenCatch Normal


" Specific JS

highlight link jsNull VariableSpecial
highlight link jsUndefined VariableSpecial


" " Class definitions
" syn keyword cppClassDef	class nextgroup=cppClassName skipwhite
" syn match cppClassDecl '\i\+\(\s:\s\i\+\(,\s\i\+\)*\)\=\s{' contains=cppClassName
" syn match cppClassName '\i\+\ze[a-zA-Z0-9 :,]\+{' contained containedin=cppClassDecl

" highligh link cppClassDef Keyword
" highligh link cppClassName Structure
