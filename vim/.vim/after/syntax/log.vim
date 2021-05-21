" Log Syntax

" File for additional log file syntax

" Log Level
highlight logLevelInfo      ctermfg=081   ctermbg=NONE  cterm=NONE
highlight logLevelWarning   ctermfg=185   ctermbg=NONE  cterm=NONE
highlight logLevelError     ctermfg=124   ctermbg=NONE  cterm=NONE

" Highlight mapping
highlight link logDate Comment
highlight link logTime Comment
highlight link logDomain ClassSpecial


" Custom Highligh Groups

" Simple Time
syn match logSimpleTime '^\d\d:\d\d'
highligh link logSimpleTime logTime
