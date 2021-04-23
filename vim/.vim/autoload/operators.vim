" ----------- "
"  Operators  "
" ----------- "

function operators#Format(type, ...)
  " Format code ALE style using the command defined for the buffer.
  let l:format_cmd = exists("b:op_format_cmd") ? b:op_format_cmd : ""

  if len(l:format_cmd) > 0
    echom "let's format!"
    let sel_save = &selection
    let &selection = "inclusive"

    if a:0
      silent exe "normal! '<V'>\<Esc>"
    else
      silent exe "normal! '[V']\<Esc>"
    endif
    execute "'<,'>!".l:format_cmd

    let &selection = sel_save
  endif
endfunction

function operators#LimeLight(type, ...)
  " Hilight code using the LimeLight Plugin.
  let sel_save = &selection
  let &selection = "inclusive"

  if a:0
    silent exe "normal! gv:Limelight\<CR>"
  elseif a:type == 'line'
    silent exe "normal! '[V']:Limelight\<CR>"
  else
    silent exe "normal! `[V`]:Limelight\<CR>"
  endif

  let &selection = sel_save
endfunction
