" Vim filetype plugin file
" Language:     Django HTML


" General Settings (make editing HTML easier)

setlocal nowrap
let maplocalleader = ";"


" ALE (linting and fixing) Settings

let b:ale_linters = ['htmlhint']
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
" TODO work out if you can / want to add 'tidy' to the fixers


" Abbreviations


" Additional Surround Mappings

let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
