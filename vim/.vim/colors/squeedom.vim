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
hi StatusLine     ctermfg=253   ctermbg=126   cterm=NONE
hi StatusLineNC   ctermfg=089   ctermbg=253   cterm=NONE
hi VertSplit      ctermfg=126   ctermbg=234   cterm=NONE
hi NonText        ctermfg=126   ctermbg=NONE  cterm=NONE
hi SpecialKey     ctermfg=160   ctermbg=NONE  cterm=NONE

" tab line colours
hi TabLine        ctermfg=015   ctermbg=242   cterm=NONE
hi TabLineFill    ctermfg=007   ctermbg=234   cterm=NONE
hi TabLineSel     ctermfg=007   ctermbg=234   cterm=BOLD

" diff tool colours
hi DiffAdd        ctermfg=NONE  ctermbg=022   cterm=NONE
hi DiffChange     ctermfg=NONE  ctermbg=094   cterm=NONE
hi DiffDelete     ctermfg=203   ctermbg=052   cterm=BOLD
hi DiffText       ctermfg=NONE  ctermbg=017   cterm=NONE
