" Vim filetype plugin file
" Language:     Protocol Buffer


" General Settings (make editing python easier)
let maplocalleader = ";"


" Indenting
setlocal softtabstop=4
setlocal shiftwidth=4


" ALE (linting and fixing) Settings
let b:ale_linters = ['protoc-gen-lint', 'protolint']
let b:ale_fixers = ['protolint', 'remove_trailing_lines', 'trim_whitespace']

let b:ale_proto_protoc_gen_lint_options = '--proto_path=/Users/MrSquee/Projects/algo-trading/fez/etc/protobuf'


" Vim-test Plugin


" Abbreviations
