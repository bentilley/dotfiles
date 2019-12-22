" Vim syntax file
" Language: Ctags
" Maintainer: Ben Tilley
" Latest Revision: 21 December 2019

if exists("b:current_syntax")
  finish
endif

syntax match CtagsComment "\v# .*"
syntax match CtagsAssignment "\v\="
syntax match CtagsOption "\v--[a-z-]+"
syntax match CtagsLanguageDefinition "\v--lang(def|map)"

" highlight CtagsAssignment   ctermfg=003   ctermbg=NONE   cterm=NONE
" highlight CtagsOption       ctermfg=002   ctermbg=NONE   cterm=NONE

highlight link CtagsComment Comment
highlight link CtagsAssignment Statement
highlight link CtagsOption Identifier
highlight link CtagsLanguageDefinition Constant

let b:current_syntax = "ctags"

"
" Keywords
"syn keyword syntaxElementKeyword keyword1 keyword2 nextgroup=syntaxElement2

" Matches
"syn match syntaxElementMatch 'regexp' contains=syntaxElement1 nextgroup=syntaxElement2 skipwhite

" Regions
"syn region syntaxElementRegion start='x' end='y'
