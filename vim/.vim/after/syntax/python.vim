" Python Syntax

" File for additional python syntax

" Highlighting for type hints
syntax keyword pythonTypeHint Any Optional Union
syntax keyword pythonTypeHint DefaultDict Dict List Set
highlight link pythonTypeHint Type

highlight link pythonStatement Keyword
highlight link pythonRepeat Keyword
highlight link pythonOperator Keyword
highlight link pythonException Keyword

highlight link pythonDecorator PreProc
highlight link pythonDecoratorName PreProc

" Multi-line Comments
syntax region pythonMultilineComment start=+^\s*"""+ end=+"""+
highlight link pythonMultilineComment Comment

" Comments in multiline strings - used in verbose regex
syntax match pythonRawStringComment ' #.*$' contained containedin=pythonRawString
highlight link pythonRawStringComment Comment
