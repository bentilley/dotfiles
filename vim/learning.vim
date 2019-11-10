let s:a = 5
let s:b = "hi"

function DisplayName(name)
  echom "Hello, may name is " . a:name
  let l:cat = "cat"
  if s:a == 5
    echom "a is 5"
  endif

  if l:cat ==# "cat"
    echom "We got a lowercase cat"
  endif

  return "Fo sho bro!"
endfunction

function Varg2(foo, ...)
  echom a:foo
  echom a:0
  echom a:1
  echo a:000
endfunction

function PositionPlay()
  echo getpos('.')
  echo col('.')
  echo line('.')
endfunction
