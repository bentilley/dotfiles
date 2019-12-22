" Vim color file
" Maintainer:	Ben Tilley <targansaikhan@gmail.com>
" Last Change:	2019 Oct 07

" This is an extension of the default color scheme.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "squeedom"

" Enables cursor line position tracking:
set cursorline
set colorcolumn=80
hi clear CursorLine                     " removes underline from cursorline
hi clear SignColumn                     " make ALE gutter neutral colour
hi ColorColumn ctermbg=237              " colour of colourcolumn
hi CursorLineNR ctermbg=240             " colour of cursorline number
hi MatchParen ctermbg=243               " colour of bracket matching

" colours for the line at the bottom of viewports
highlight StatusLine         ctermfg=253   ctermbg=126   cterm=NONE
highlight StatusLineNC       ctermfg=089   ctermbg=253   cterm=NONE
highlight VertSplit          ctermfg=126   ctermbg=234   cterm=NONE
highlight NonText            ctermfg=126   ctermbg=NONE  cterm=NONE
highlight SpecialKey         ctermfg=160   ctermbg=NONE  cterm=NONE

" tab line colours
highlight TabLine            ctermfg=015   ctermbg=242   cterm=NONE
highlight TabLineFill        ctermfg=007   ctermbg=234   cterm=NONE
highlight TabLineSel         ctermfg=007   ctermbg=234   cterm=BOLD

" diff tool colours
highlight DiffAdd            ctermfg=NONE  ctermbg=022   cterm=NONE
highlight DiffChange         ctermfg=NONE  ctermbg=094   cterm=NONE
highlight DiffDelete         ctermfg=203   ctermbg=052   cterm=BOLD
highlight DiffText           ctermfg=NONE  ctermbg=017   cterm=NONE

" search
highlight Search             ctermfg=000   ctermbg=159   cterm=NONE


" ALE

highlight ALEWarning         ctermfg=000   ctermbg=011   cterm=NONE
" highlight ALEStyleWarning    ctermfg=015   ctermbg=012   cterm=NONE
" highlight ALEInfo            ctermfg=088   ctermbg=NONE   cterm=NONE


" Javascript

" orange
highlight jsImport           ctermfg=208   ctermbg=NONE  cterm=NONE
highlight jsfrom             ctermfg=208   ctermbg=NONE  cterm=NONE
highlight jsModuleAs         ctermfg=208   ctermbg=NONE  cterm=NONE
highlight jsExport           ctermfg=208   ctermbg=NONE  cterm=NONE

" red
highlight jsString           ctermfg=160   ctermbg=NONE  cterm=NONE
highlight jsTemplateString   ctermfg=160   ctermbg=NONE  cterm=NONE

" cyan
highlight jsClassDefinition  ctermfg=014   ctermbg=NONE  cterm=BOLD

" bright blue
highlight jsModuleKeyword    ctermfg=081   ctermbg=NONE  cterm=NONE
highlight jsClassFuncName    ctermfg=081   ctermbg=NONE  cterm=NONE
highlight jsFuncCall         ctermfg=081   ctermbg=NONE  cterm=NONE

" purple
highlight jsClassKeyword     ctermfg=162   ctermbg=NONE  cterm=NONE
highlight jsOperatorKeyword  ctermfg=162   ctermbg=NONE  cterm=NONE
highlight jsConditional      ctermfg=162   ctermbg=NONE  cterm=NONE
highlight jsReturn           ctermfg=162   ctermbg=NONE  cterm=NONE
highlight jsExtendsKeyword   ctermfg=162   ctermbg=NONE  cterm=NONE
highlight jsFunction         ctermfg=162   ctermbg=NONE  cterm=NONE

" light green
highlight jsGlobalObjects    ctermfg=011   ctermbg=NONE  cterm=NONE

" pink
" highlight jsThis             ctermfg=069   ctermbg=NONE  cterm=NONE
" highlight jsThis             ctermfg=219   ctermbg=NONE  cterm=NONE
highlight jsThis             ctermfg=189   ctermbg=NONE  cterm=NONE

" hot green
highlight jsStorageClass     ctermfg=048   ctermbg=NONE  cterm=NONE
highlight jsTemplateBraces   ctermfg=048   ctermbg=NONE  cterm=NONE

" natural green
highlight jsComment          ctermfg=113   ctermbg=NONE  cterm=NONE

" highlight jsNoise                         ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObjectProp                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsPrototype                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsTaggedTemplate                ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDot                           ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParensError                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDestructuringBlock            ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDestructuringArray            ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsVariableDef                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFlowDefinition                ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsOperator                      ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsBooleanTrue                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsBooleanFalse                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsModuleAsterisk                ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsModuleGroup                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFlowImportType                ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsExportDefault                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFlowTypeStatement             ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsModuleComma                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsExportDefaultGroup            ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFlowTypeKeyword               ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsSpecial                       ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsTemplateExpression            ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsNumber                        ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFloat                         ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRegexpCharClass               ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRegexpBoundary                ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRegexpBackRef                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRegexpQuantifier              ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRegexpOr                      ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRegexpMod                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRegexpGroup                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRegexpString                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObjectSeparator               ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObjectShorthandProp           ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFunctionKey                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObjectValue                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObjectKey                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObjectKeyString               ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsBrackets                      ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFuncArgs                      ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObjectKeyComputed             ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObjectColon                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObjectFuncName                ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObjectMethodType              ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObjectStringKey               ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsNull                          ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsUndefined                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsNan                           ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsSuper                         ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsBlock                         ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsBlockLabel                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsBlockLabelKey                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsStatement                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParenIfElse                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsCommentIfElse                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsIfElseBlock                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParenSwitch                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRepeat                        ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParenRepeat                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsForAwait                      ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDo                            ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRepeatBlock                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsLabel                         ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsSwitchColon                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsSwitchCase                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsTry                           ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsTryCatchBlock                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFinally                       ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFinallyBlock                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsCatch                         ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParenCatch                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsException                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsAsyncKeyword                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsSwitchBlock                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsGlobalNodeObjects             ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsExceptions                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsBuiltins                      ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFutureKeys                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDomErrNo                      ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDomNodeConsts                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsHtmlEvents                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsSpreadExpression              ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsBracket                       ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParens                        ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParen                         ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParensDecorator               ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParenDecorator                ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParensIfElse                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParensRepeat                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsCommentRepeat                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParensSwitch                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsParensCatch                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFuncParens                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFuncArgCommas                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFuncArgExpression             ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRestExpression                ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFlowArgumentDef               ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsCommentFunction               ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFuncBlock                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFlowReturn                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsClassBraces                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsClassMethodType               ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsArrowFunction                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsArrowFuncArgs                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsGenerator                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDecorator                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsClassProperty                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsClassPropertyComputed         ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsClassStringKey                ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsClassBlock                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFuncBraces                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsIfElseBraces                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsTryCatchBraces                ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFinallyBraces                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsSwitchBraces                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRepeatBraces                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDestructuringBraces           ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDestructuringProperty         ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDestructuringAssignment       ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDestructuringNoise            ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDestructuringPropertyComputed ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDestructuringPropertyValue    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObjectBraces                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsObject                        ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsBraces                        ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsModuleBraces                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsSpreadOperator                ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsRestOperator                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsTernaryIfOperator             ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsTernaryIf                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFuncName                      ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFlowFunctionGroup             ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFuncArgOperator               ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsArguments                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsClassKeyword                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsClassNoise                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFlowClassFunctionGroup        ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFlowClassGroup                ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsCommentClass                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsClassValue                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsFlowClassDef                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDestructuringValue            ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDestructuringValueAssignment  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsCommentTodo                   ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsEnvComment                    ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDecoratorFunction             ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsCharacter                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsBranch                        ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsError                         ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsOf                            ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDomElemAttrs                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsDomElemFuncs                  ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsHtmlElemAttrs                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsHtmlElemFuncs                 ctermfg=   ctermbg=NONE  cterm=NONE
" highlight jsCssStyles                     ctermfg=   ctermbg=NONE  cterm=NONE
" highlight javaScript                      ctermfg=   ctermbg=NONE  cterm=NONE
