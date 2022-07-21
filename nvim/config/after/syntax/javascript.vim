" Javascript Syntax

" File for additional Javascript syntax

highlight link jsComment Comment

highlight link jsClassKeyword Keyword
highlight link jsClassMethodType Keyword
highlight link jsOperatorKeyword Keyword
highlight link jsReturn Keyword
highlight link jsExtendsKeyword Keyword
highlight link jsFunction Keyword
highlight link jsLabel Keyword
highlight link jsRepeat Keyword
highlight link jsArrowFunction Keyword
highlight link jsException Keyword
highlight link jsStatement Keyword

highlight link jsNull Type
highlight link jsUndefined Type

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

highlight link jsTry Keyword
highlight link jsCatch Keyword

syn match jsDocFlag '@\i\+' contained containedin=jsComment

highligh link jsDocFlag Special
