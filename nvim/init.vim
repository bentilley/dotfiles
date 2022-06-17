" nvim config

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let g:python_host_prog = '/Users/MrSquee/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/MrSquee/.pyenv/versions/neovim3/bin/python'

source ~/.vim/vimrc
