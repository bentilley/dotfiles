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
hi clear SignColumn                     " make ALE gutter neutral colour
hi MatchParen ctermbg=243               " colour of bracket matching
highlight ColorColumn        ctermfg=NONE  ctermbg=233   cterm=NONE
highlight LineNR             ctermfg=244   ctermbg=NONE  cterm=NONE
highlight CursorLineNR       ctermfg=125   ctermbg=236   cterm=NONE
highlight Visual             ctermfg=NONE  ctermbg=236   cterm=NONE

" colours for the line at the bottom of viewports
highlight StatusLine         ctermfg=250   ctermbg=125   cterm=NONE
highlight StatusLineNC       ctermfg=125   ctermbg=233   cterm=NONE
highlight StatusLineTerm     ctermfg=233   ctermbg=002   cterm=NONE
highlight StatusLineTermNC   ctermfg=002   ctermbg=233   cterm=BOLD
highlight VertSplit          ctermfg=125   ctermbg=NONE  cterm=NONE
highlight NonText            ctermfg=125   ctermbg=NONE  cterm=NONE
highlight SpecialKey         ctermfg=160   ctermbg=NONE  cterm=NONE

" tab line colours
highlight TabLine            ctermfg=015   ctermbg=242   cterm=NONE
highlight TabLineFill        ctermfg=007   ctermbg=234   cterm=NONE
highlight TabLineSel         ctermfg=007   ctermbg=234   cterm=BOLD

" diff tool colours
highlight DiffAdd            ctermfg=NONE  ctermbg=022   cterm=NONE
highlight DiffChange         ctermfg=NONE  ctermbg=233   cterm=NONE
highlight DiffDelete         ctermfg=124   ctermbg=233   cterm=NONE
highlight DiffText           ctermfg=178   ctermbg=232   cterm=NONE

" alerts
highlight Todo               ctermfg=000   ctermbg=185   cterm=NONE

" spell checking
highlight! link SpellBad Error

" search
highlight Search             ctermfg=016   ctermbg=153   cterm=NONE
" highlight! link Search Todo
highlight! link IncSearch WarningMsg

" popup menu
highlight Pmenu              ctermfg=0     ctermbg=238   cterm=NONE
highlight PmenuSel           ctermfg=232   ctermbg=246   cterm=BOLD
" highlight PmenuSbar          ctermfg=NONE  ctermbg=248   cterm=NONE
" highlight PmenuThumb         ctermfg=NONE  ctermbg=0     cterm=NONE

" folds
highlight Folded            ctermfg=248    ctermbg=235   cterm=NONE
highlight link FoldedColumn Folded

" --------------------- "
" Generic Colour Groups "
" --------------------- "

highlight Comment            ctermfg=060   ctermbg=NONE   cterm=NONE
highlight Type               ctermfg=220   ctermbg=NONE   cterm=NONE
highlight PreProc            ctermfg=001   ctermbg=NONE   cterm=NONE
highlight Keyword            ctermfg=162   ctermbg=NONE   cterm=NONE
highlight Conditional        ctermfg=162   ctermbg=NONE   cterm=NONE
highlight Include            ctermfg=208   ctermbg=NONE   cterm=NONE
highlight Function           ctermfg=081   ctermbg=NONE   cterm=NONE
highlight FunctionSpecial    ctermfg=014   ctermbg=NONE   cterm=NONE
highlight Structure          ctermfg=014   ctermbg=NONE   cterm=BOLD
highlight StorageClass       ctermfg=165   ctermbg=NONE   cterm=NONE
highlight Constant           ctermfg=098   ctermbg=NONE   cterm=NONE
highlight String             ctermfg=160   ctermbg=NONE   cterm=NONE
highlight StringSpecial      ctermfg=088   ctermbg=NONE   cterm=NONE
highlight Statement          ctermfg=081   ctermbg=NONE   cterm=NONE
highlight VariableSpecial    ctermfg=047   ctermbg=NONE   cterm=NONE
highlight ClassSpecial       ctermfg=042   ctermbg=NONE   cterm=NONE
highlight TryCatchSpecial    ctermfg=202   ctermbg=NONE   cterm=NONE

" Layout

highlight Title              ctermfg=218   ctermbg=NONE   cterm=NONE


" --- "
" ALE "
" --- "

" highlight ALEWarning         ctermfg=000   ctermbg=011   cterm=NONE
" highlight ALEStyleWarning    ctermfg=015   ctermbg=012   cterm=NONE
" highlight ALEInfo            ctermfg=088   ctermbg=NONE   cterm=NONE
highlight link ALEError Error
highlight link ALEWarningSign Todo
highlight link ALEErrorSign ALEError
highlight link ALEWarning ALEWarningSign


" ---- "
" HTML "
" ---- "

highlight htmlItalic         ctermfg=016   ctermbg=246   cterm=NONE


" --- "
" XML "
" --- "

highlight XmlKeyword         ctermfg=077   ctermbg=NONE   cterm=NONE
highlight XmlAdditional      ctermfg=168   ctermbg=NONE   cterm=NONE
highlight XmlDull            ctermfg=250   ctermbg=NONE   cterm=NONE

highlight link xmlTagName       XmlAdditional
highlight link xmlAttrib        XmlKeyword
highlight link xmlTag           Normal


" -------- "
" Markdown "
" -------- "

highlight link mkdHeading Title

" --- "
" Tex "
" --- "

highlight texItalStyle       ctermfg=016   ctermbg=246   cterm=NONE
