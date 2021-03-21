# Autoload Functions

This directory contains functions for ZSH to autoload. See `fpath` in `.zshrc`
for how this happens.

The current functions are:

1. Misc:
  - `print256colours` - print the 256 terminal colors.
  - `testy` - a function for testing how autolaoded function work!
1. Pytest:
  - `ptf` - "pytest fzf", a mash up to quickly run pytest files by fuzzy finding.
1. Vim:
  - `vf` - "vim fzf", a mash up to quickly open files by fuzzy finding.
  - `vt` - "vim that", a way of opening the last `rg` search results in vim.
