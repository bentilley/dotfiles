" squeedom.vim
" Author:  Ben Tilley
" Created: 2022-09-09
" Squeedom Colourscheme

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
highlight clear Normal
set background&

" Remove all existing highlighting and set the defaults.
highlight clear

" Load the syntax highlighting defaults, if it's enabled.
if exists('syntax_on')
  syntax reset
endif

let colors_name = 'squeedom'

" -------- "
" Squeedom "
" -------- "

" design system {{{

highlight Primary            ctermfg=125   ctermbg=NONE  cterm=NONE
highlight Secondary          ctermfg=014   ctermbg=NONE  cterm=NONE

" }}}

" editor {{{

highlight clear SignColumn

highlight WinSeparator       ctermfg=125   ctermbg=NONE  cterm=NONE
highlight NonText            ctermfg=240   ctermbg=NONE  cterm=NONE
highlight SpecialKey         ctermfg=160   ctermbg=NONE  cterm=NONE
highlight Folded             ctermfg=248   ctermbg=235   cterm=NONE
highlight FoldColumn         ctermfg=014   ctermbg=NONE  cterm=NONE
highlight MatchParen         ctermfg=NONE  ctermbg=243   cterm=NONE
highlight LineNR             ctermfg=244   ctermbg=234   cterm=NONE
highlight CursorLineNR       ctermfg=255   ctermbg=236   cterm=BOLD
highlight Visual             ctermfg=NONE  ctermbg=236   cterm=NONE
highlight VisualSpecial      ctermfg=NONE  ctermbg=141   cterm=NONE

highlight TabLine            ctermfg=015   ctermbg=238   cterm=NONE
highlight TabLineFill        ctermfg=007   ctermbg=234   cterm=NONE
highlight TabLineSel         ctermfg=007   ctermbg=234   cterm=BOLD

highlight Pmenu              ctermfg=0     ctermbg=238   cterm=NONE
highlight PmenuSel           ctermfg=232   ctermbg=246   cterm=BOLD

" }}}

" objects {{{

highlight Title              ctermfg=218   ctermbg=NONE  cterm=NONE
highlight Todo               ctermfg=000   ctermbg=185   cterm=NONE
highlight Emphasis           ctermfg=016   ctermbg=246   cterm=NONE

" }}}

" search {{{

highlight Search             ctermfg=094   ctermbg=180
highlight IncSearch          ctermfg=094   ctermbg=180   cterm=REVERSE

" }}}

" diff {{{

highlight DiffAdd               ctermfg=040   ctermbg=234   cterm=NONE
highlight DiffDelete            ctermfg=160   ctermbg=234   cterm=NONE
highlight DiffText              ctermfg=220   ctermbg=NONE  cterm=NONE
highlight DiffChange            ctermfg=NONE  ctermbg=234   cterm=NONE

" }}}

" code {{{

highlight Comment            ctermfg=060   ctermbg=NONE   cterm=NONE
highlight CommentSpecial     ctermfg=242   ctermbg=NONE   cterm=NONE
highlight Type               ctermfg=220   ctermbg=NONE   cterm=NONE
highlight PreProc            ctermfg=001   ctermbg=NONE   cterm=NONE
highlight Keyword            ctermfg=162   ctermbg=NONE   cterm=NONE
highlight Conditional        ctermfg=162   ctermbg=NONE   cterm=NONE
highlight Include            ctermfg=208   ctermbg=NONE   cterm=NONE
highlight Function           ctermfg=081   ctermbg=NONE   cterm=NONE
highlight FunctionSpecial    ctermfg=014   ctermbg=NONE   cterm=NONE
highlight Structure          ctermfg=087   ctermbg=NONE   cterm=BOLD
highlight StorageClass       ctermfg=165   ctermbg=NONE   cterm=NONE
highlight Constant           ctermfg=134   ctermbg=NONE   cterm=NONE
highlight String             ctermfg=098   ctermbg=NONE   cterm=NONE
highlight StringSpecial      ctermfg=088   ctermbg=NONE   cterm=NONE
highlight Statement          ctermfg=081   ctermbg=NONE   cterm=NONE
highlight VariableSpecial    ctermfg=047   ctermbg=NONE   cterm=NONE
highlight ClassSpecial       ctermfg=042   ctermbg=NONE   cterm=NONE
highlight TryCatchSpecial    ctermfg=202   ctermbg=NONE   cterm=NONE
highlight Exception          ctermfg=160   ctermbg=NONE   cterm=BOLD

" }}}

" statusline {{{

highlight StatusLine                   ctermfg=125   ctermbg=234   cterm=NONE
highlight StatusLineNC                 ctermfg=242   ctermbg=234   cterm=NONE
highlight StatusLineTerm               ctermfg=233   ctermbg=002   cterm=NONE
highlight StatusLineTermNC             ctermfg=002   ctermbg=234   cterm=NONE
highlight StatusLinePromptAccent       ctermfg=233   ctermbg=125   cterm=BOLD
highlight StatusLineFileAccent         ctermfg=250   ctermbg=234   cterm=BOLD
highlight StatusLinePositionInfoAccent ctermfg=242   ctermbg=234   cterm=NONE
highlight StatusLineLspAccent          ctermfg=236   ctermbg=250   cterm=NONE

" }}}

" spellcheck {{{

highlight link SpellBad Error

" }}}

" gitsigns plugin {{{

highlight link GitSignsCurrentLineBlame CommentSpecial

highlight link GitSignsAdd DiffAdd
highlight link GitSignsChange DiffText
highlight link GitSignsDelete DiffDelete

highlight link GitSignsAddNr DiffAdd
highlight link GitSignsChangeNr DiffText
highlight link GitSignsDeleteNr DiffDelete

highlight link GitSignsAddLn DiffAdd
highlight link GitSignsChangeLn DiffText
highlight link GitSignsDeleteLn DiffDelete

highlight link GitSignsAddInline DiffAdd
highlight link GitSignsChangeInline DiffText
highlight link GitSignsDeleteInline DiffDelete

highlight link GitSignsAddLnInline DiffAdd
highlight link GitSignsChangeLnInline DiffText
highlight link GitSignsDeleteLnInline DiffDelete

highlight link GitSignsAddVirtLnInline DiffAdd
highlight link GitSignsChangeVirtLnInline DiffText
highlight link GitSignsDeleteVirtLnInline DiffDelete

" }}}

" indent-blankline plugin {{{

highlight link IndentBlanklineContextChar FoldColumn

" }}}

" document highlights {{{

highlight link LspReferenceText Visual
highlight link LspReferenceRead Visual
highlight link LspReferenceWrite VisualSpecial

" }}}
