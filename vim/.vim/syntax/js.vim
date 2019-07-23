" Vim syntax file
" Language: Celestia Star Catalogs
" Maintainer: Kevin Lauder
" Latest Revision: 26 April 2008

if exists("b:current_syntax")
  finish
endif

syn keyword JFtest JFScript

let b:current_syntax = "js"

hi def link JFtest Statement

"
" Keywords
"syn keyword syntaxElementKeyword keyword1 keyword2 nextgroup=syntaxElement2

" Matches
"syn match syntaxElementMatch 'regexp' contains=syntaxElement1 nextgroup=syntaxElement2 skipwhite

" Regions
"syn region syntaxElementRegion start='x' end='y'
