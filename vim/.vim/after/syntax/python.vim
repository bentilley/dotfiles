" Python Syntax

" File for additional python syntax


highlight link pythonStatement Keyword
highlight link pythonRepeat Keyword
highlight link pythonOperator Keyword

highlight link pythonDecorator PreProc
highlight link pythonDecoratorName PreProc

" Multi-line Comments
syntax region pythonMultilineComment start=+"""+ end=+"""+
highlight link pythonMultilineComment Comment
