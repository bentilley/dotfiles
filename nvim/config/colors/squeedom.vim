" squeedom.vim
" Author:  Ben Tilley
" Created: 2022-09-09
" Squeedom Colour Scheme

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

if &background ==# 'light'

" light {{{

" design system {{{

  highlight Normal             ctermfg=000   ctermbg=015   cterm=none

  highlight Primary            ctermfg=125   ctermbg=none  cterm=none
  highlight Secondary          ctermfg=014   ctermbg=none  cterm=none

" }}}

" editor {{{

  highlight clear SignColumn

  highlight WinSeparator       ctermfg=125   ctermbg=none  cterm=none
  highlight NonText            ctermfg=248   ctermbg=none  cterm=none
  highlight SpecialKey         ctermfg=160   ctermbg=none  cterm=none
  highlight Folded             ctermfg=008   ctermbg=252   cterm=none
  highlight FoldColumn         ctermfg=014   ctermbg=none  cterm=none
  highlight MatchParen         ctermfg=none  ctermbg=243   cterm=none
  highlight LineNR             ctermfg=008   ctermbg=252   cterm=none
  highlight CursorLineNR       ctermfg=000   ctermbg=254   cterm=bold
  highlight Visual             ctermfg=none  ctermbg=252   cterm=none
  highlight VisualSpecial      ctermfg=none  ctermbg=141   cterm=none

  highlight TabLine            ctermfg=008   ctermbg=252   cterm=none
  highlight TabLineFill        ctermfg=008   ctermbg=252   cterm=none
  highlight TabLineSel         ctermfg=000   ctermbg=250   cterm=bold

  highlight Pmenu              ctermfg=000   ctermbg=252   cterm=none
  highlight PmenuSel           ctermfg=000   ctermbg=248   cterm=bold

" }}}

" objects {{{

  highlight Title              ctermfg=218   ctermbg=none  cterm=none
  highlight Todo               ctermfg=000   ctermbg=185   cterm=none
  highlight Emphasis           ctermfg=016   ctermbg=246   cterm=none

" }}}

" search {{{

  highlight Search             ctermfg=094   ctermbg=180
  highlight IncSearch          ctermfg=094   ctermbg=180   cterm=reverse

" }}}

" diff {{{


  highlight DiffAdd               ctermfg=040   ctermbg=254   cterm=none
  highlight DiffAddText           ctermfg=040   ctermbg=none  cterm=bold
  highlight DiffDelete            ctermfg=160   ctermbg=254   cterm=none
  highlight DiffDeleteText        ctermfg=160   ctermbg=none  cterm=bold
  highlight DiffText              ctermfg=220   ctermbg=none  cterm=bold
  highlight DiffChange            ctermfg=none  ctermbg=254   cterm=none

" }}}

" code {{{

  highlight Comment            ctermfg=060   ctermbg=none   cterm=none
  highlight CommentSpecial     ctermfg=242   ctermbg=none   cterm=none
  highlight Type               ctermfg=220   ctermbg=none   cterm=none
  highlight PreProc            ctermfg=001   ctermbg=none   cterm=none
  highlight Keyword            ctermfg=162   ctermbg=none   cterm=none
  highlight Conditional        ctermfg=162   ctermbg=none   cterm=none
  highlight Include            ctermfg=208   ctermbg=none   cterm=none
  highlight Function           ctermfg=081   ctermbg=none   cterm=none
  highlight FunctionSpecial    ctermfg=014   ctermbg=none   cterm=none
  highlight Structure          ctermfg=087   ctermbg=none   cterm=bold
  highlight StorageClass       ctermfg=165   ctermbg=none   cterm=none
  highlight Constant           ctermfg=134   ctermbg=none   cterm=none
  highlight String             ctermfg=098   ctermbg=none   cterm=none
  highlight StringSpecial      ctermfg=088   ctermbg=none   cterm=none
  highlight Statement          ctermfg=081   ctermbg=none   cterm=none
  highlight VariableSpecial    ctermfg=047   ctermbg=none   cterm=none
  highlight ClassSpecial       ctermfg=042   ctermbg=none   cterm=none
  highlight TryCatchSpecial    ctermfg=202   ctermbg=none   cterm=none
  highlight Exception          ctermfg=160   ctermbg=none   cterm=bold

" }}}

" statusline {{{

  highlight StatusLine                   ctermfg=125   ctermbg=252   cterm=none
  highlight StatusLineNC                 ctermfg=008   ctermbg=252   cterm=none
  highlight StatusLineTerm               ctermfg=000   ctermbg=002   cterm=none
  highlight StatusLineTermNC             ctermfg=002   ctermbg=234   cterm=none
  highlight StatusLinePromptAccent       ctermfg=015   ctermbg=125   cterm=bold
  highlight StatusLineFileAccent         ctermfg=000   ctermbg=252   cterm=bold
  highlight StatusLinePositionInfoAccent ctermfg=008   ctermbg=252   cterm=none
  highlight StatusLineLspAccent          ctermfg=008   ctermbg=250   cterm=none

" }}}

" spellcheck {{{

  highlight clear SpellBad
  highlight clear SpellCap
  highlight clear SpellRare
  highlight clear SpellLocal

  highlight SpellBad                     ctermfg=none  ctermbg=252   cterm=undercurl
  highlight link SpellCap SpellBad
  highlight link SpellRare SpellBad
  highlight link SpellLocal SpellBad

" }}}

" gitsigns plugin {{{

  highlight link GitSignsCurrentLineBlame CommentSpecial

  highlight link GitSignsAdd DiffAddText
  highlight link GitSignsChange DiffText
  highlight link GitSignsDelete DiffDeleteText

  highlight link GitSignsAddNr GitSignsAdd
  highlight link GitSignsChangeNr GitSignsChange
  highlight link GitSignsDeleteNr GitSignsDelete

  highlight link GitSignsAddLn GitSignsAdd
  highlight link GitSignsChangeLn GitSignsChange
  highlight link GitSignsDeleteLn GitSignsDelete

  highlight link GitSignsAddInline GitSignsAdd
  highlight link GitSignsChangeInline GitSignsChange
  highlight link GitSignsDeleteInline GitSignsDelete

  highlight link GitSignsAddLnInline GitSignsAdd
  highlight link GitSignsChangeLnInline GitSignsChange
  highlight link GitSignsDeleteLnInline GitSignsDelete

  highlight link GitSignsAddVirtLnInline GitSignsAdd
  highlight link GitSignsChangeVirtLnInline GitSignsChange
  highlight link GitSignsDeleteVirtLnInline GitSignsDelete

" }}}

" indent-blankline plugin {{{

  highlight link IndentBlanklineContextChar FoldColumn

" }}}

" document highlights {{{

  highlight link LspReferenceText Visual
  highlight link LspReferenceRead Visual
  highlight link LspReferenceWrite VisualSpecial

" }}}

" }}}

else

" dark {{{

" design system {{{

  highlight Normal             ctermfg=015   ctermbg=000   cterm=none

  highlight Primary            ctermfg=125   ctermbg=none  cterm=none
  highlight Secondary          ctermfg=014   ctermbg=none  cterm=none

" }}}

" editor {{{

  highlight clear SignColumn

  highlight WinSeparator       ctermfg=125   ctermbg=none  cterm=none
  highlight NonText            ctermfg=240   ctermbg=none  cterm=none
  highlight SpecialKey         ctermfg=160   ctermbg=none  cterm=none
  highlight Folded             ctermfg=248   ctermbg=235   cterm=none
  highlight FoldColumn         ctermfg=014   ctermbg=none  cterm=none
  highlight MatchParen         ctermfg=none  ctermbg=243   cterm=none
  highlight LineNR             ctermfg=244   ctermbg=234   cterm=none
  highlight CursorLineNR       ctermfg=255   ctermbg=236   cterm=bold
  highlight Visual             ctermfg=none  ctermbg=236   cterm=none
  highlight VisualSpecial      ctermfg=none  ctermbg=141   cterm=none

  highlight TabLine            ctermfg=015   ctermbg=238   cterm=none
  highlight TabLineFill        ctermfg=007   ctermbg=234   cterm=none
  highlight TabLineSel         ctermfg=007   ctermbg=234   cterm=bold

  highlight Pmenu              ctermfg=0     ctermbg=238   cterm=none
  highlight PmenuSel           ctermfg=232   ctermbg=246   cterm=bold

" }}}

" objects {{{

  highlight Title              ctermfg=218   ctermbg=none  cterm=none
  highlight Todo               ctermfg=000   ctermbg=185   cterm=none
  highlight Emphasis           ctermfg=016   ctermbg=246   cterm=none

" }}}

" search {{{

  highlight Search             ctermfg=094   ctermbg=180
  highlight IncSearch          ctermfg=094   ctermbg=180   cterm=reverse

" }}}

" diff {{{

  highlight DiffAdd               ctermfg=040   ctermbg=234   cterm=none
  highlight DiffAddText           ctermfg=040   ctermbg=none  cterm=bold  " custom
  highlight DiffDelete            ctermfg=160   ctermbg=234   cterm=none
  highlight DiffDeleteText        ctermfg=160   ctermbg=none  cterm=bold  " custom
  highlight DiffText              ctermfg=220   ctermbg=none  cterm=none
  highlight DiffChange            ctermfg=none  ctermbg=234   cterm=none

" }}}

" code {{{

  highlight Comment            ctermfg=060   ctermbg=none   cterm=none
  highlight CommentSpecial     ctermfg=242   ctermbg=none   cterm=none
  highlight Type               ctermfg=220   ctermbg=none   cterm=none
  highlight PreProc            ctermfg=001   ctermbg=none   cterm=none
  highlight Keyword            ctermfg=162   ctermbg=none   cterm=none
  highlight Conditional        ctermfg=162   ctermbg=none   cterm=none
  highlight Include            ctermfg=208   ctermbg=none   cterm=none
  highlight Function           ctermfg=081   ctermbg=none   cterm=none
  highlight FunctionSpecial    ctermfg=014   ctermbg=none   cterm=none
  highlight Structure          ctermfg=087   ctermbg=none   cterm=bold
  highlight StorageClass       ctermfg=165   ctermbg=none   cterm=none
  highlight Constant           ctermfg=134   ctermbg=none   cterm=none
  highlight String             ctermfg=098   ctermbg=none   cterm=none
  highlight StringSpecial      ctermfg=088   ctermbg=none   cterm=none
  highlight Statement          ctermfg=081   ctermbg=none   cterm=none
  highlight VariableSpecial    ctermfg=047   ctermbg=none   cterm=none
  highlight ClassSpecial       ctermfg=042   ctermbg=none   cterm=none
  highlight TryCatchSpecial    ctermfg=202   ctermbg=none   cterm=none
  highlight Exception          ctermfg=160   ctermbg=none   cterm=bold

" }}}

" statusline {{{

  highlight StatusLine                   ctermfg=125   ctermbg=234   cterm=none
  highlight StatusLineNC                 ctermfg=242   ctermbg=234   cterm=none
  highlight StatusLineTerm               ctermfg=233   ctermbg=002   cterm=none
  highlight StatusLineTermNC             ctermfg=002   ctermbg=234   cterm=none
  highlight StatusLinePromptAccent       ctermfg=233   ctermbg=125   cterm=bold
  highlight StatusLineFileAccent         ctermfg=250   ctermbg=234   cterm=bold
  highlight StatusLinePositionInfoAccent ctermfg=242   ctermbg=234   cterm=none
  highlight StatusLineLspAccent          ctermfg=236   ctermbg=250   cterm=none

" }}}

" spellcheck {{{

  highlight clear SpellBad
  highlight clear SpellCap
  highlight clear SpellRare
  highlight clear SpellLocal

  highlight SpellBad                     ctermfg=none  ctermbg=234   cterm=undercurl
  highlight link SpellCap SpellBad
  highlight link SpellRare SpellBad
  highlight link SpellLocal SpellBad

" }}}

" gitsigns plugin {{{

  highlight link GitSignsCurrentLineBlame CommentSpecial

  highlight link GitSignsAdd DiffAddText
  highlight link GitSignsChange DiffText
  highlight link GitSignsDelete DiffDeleteText

  highlight link GitSignsAddNr GitSignsAdd
  highlight link GitSignsChangeNr GitSignsChange
  highlight link GitSignsDeleteNr GitSignsDelete

  highlight link GitSignsAddLn GitSignsAdd
  highlight link GitSignsChangeLn GitSignsChange
  highlight link GitSignsDeleteLn GitSignsDelete

  highlight link GitSignsAddInline GitSignsAdd
  highlight link GitSignsChangeInline GitSignsChange
  highlight link GitSignsDeleteInline GitSignsDelete

  highlight link GitSignsAddLnInline GitSignsAdd
  highlight link GitSignsChangeLnInline GitSignsChange
  highlight link GitSignsDeleteLnInline GitSignsDelete

  highlight link GitSignsAddVirtLnInline GitSignsAdd
  highlight link GitSignsChangeVirtLnInline GitSignsChange
  highlight link GitSignsDeleteVirtLnInline GitSignsDelete

" }}}

" indent-blankline plugin {{{

  highlight link IndentBlanklineContextChar FoldColumn

" }}}

" document highlights {{{

  highlight link LspReferenceText Visual
  highlight link LspReferenceRead Visual
  highlight link LspReferenceWrite VisualSpecial

" }}}

" }}}

endif

