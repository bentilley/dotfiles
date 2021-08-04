" Vim filetype plugin file
" Language:     C++


" General Settings
let maplocalleader = ";"


" Indenting
setlocal softtabstop=2
setlocal shiftwidth=2


" ALE  Settings
let b:ale_linters = [] " currently handling this through CoC
" let b:ale_linters = ['clang']
let b:ale_fixers = ['clang-format', 'remove_trailing_lines', 'trim_whitespace']
" let b:ale_cpp_clang_options = '-std=c++14 -Wall -I/Users/MrSquee/Projects/fractal-flow/JUCE/modules -I/Users/MrSquee/Projects/fractal-flow/well-plug/libs -DDEBUG=1'


" Online Docs
setlocal keywordprg=devdocs\ -l\ cpp\ -q


" Abbreviations

iabbrev <n << "\n";
