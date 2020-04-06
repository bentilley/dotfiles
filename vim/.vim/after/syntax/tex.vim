" Tex Syntax

" File for additional tex syntax

" rules for disabling spelling, e.g. for URLs
syntax match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell containedin=texComment
highligh link UrlNoSpell texComment
syntax match EmailAddrsNoSpell '\w\+@\w\+\.\w\+' contains=@NoSpell containedin=texComment
highligh link EmailAddrsNoSpell texComment
syntax match FileNameNoSpell '[a-zA-Z0-9-_]\+\.[a-zA-Z0-9-_]\+' contains=@NoSpell containedin=texComment
highligh link FileNameNoSpell texComment

