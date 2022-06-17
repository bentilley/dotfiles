" Typescript Syntax

" File for additional Typescript syntax

syntax keyword typescriptAbstract abstract

highlight link typescriptStatementKeyword Keyword
highlight link typescriptOperator Keyword
highlight link typescriptRepeat Keyword

highlight link typescriptVariable StorageClass

highlight link typescriptConsoleMethod Function
highlight link typescriptDateMethod Function
highlight link typescriptPromiseMethod Function
highlight link typescriptObjectStaticMethod Function
highlight link typescriptArrowFunc Function
highlight link typescriptIdentifier FunctionSpecial

highlight link typescriptExceptions Exception

highlight link tsxIntrinsicTagName XmlAdditional
highlight link tsxTagName XmlAdditional
highlight link tsxAttrib XmlKeyword

highlight link typescriptCall Preproc
highlight link typescriptExport Include
highlight link typescriptImport Include

highlight link typescriptGlobal Constant

highlight link typescriptPredefinedType Type
highlight link typescriptTypeReference Type

highlight link typescriptIdentifierName Special
highlight link typescriptDefault VariableSpecial

highlight link typescriptTemplateSB StringSpecial

highlight link typescriptBOMWindowProp Normal
highlight link typescriptBOMHistoryProp Normal
highlight link typescriptPaymentShippingOptionProp Normal
highlight link typescriptDOMDocMethod Normal
highlight link typescriptDOMFormProp Normal
highlight link typescriptEndColons Normal
highlight link typescriptFuncComma Normal
highlight link typescriptObjectLabel Normal
highlight link typescriptURLUtilsProp Normal
highlight link typescriptArrayMethod Normal
highlight link typescriptMathStaticMethod Normal
highlight link typescriptCacheMethod Normal
highlight link typescriptBOM Normal
highlight link typescriptUnion Normal
highlight link tsxCloseString Normal

" syntax match typescriptFuncVarDeclaration '\i\+\s=\s([a-zA-Z0-9,]\=)\s=>' contains=typescriptFuncVar
" syntax match typescriptFuncVar '\i\+\ze\s=' contained containedin=typescriptFuncVarDeclaration
