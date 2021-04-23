" Vim Compiler File
" Compiler:	pytest
" Maintainer:	Ben Tilley <targansaikhan@gmail.com>
" Last Change:	Tue 30 Mar 16:00:35 BST 2021

if exists("current_compiler")
    finish
endif
let current_compiler = "pytest"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pytest\ --tb=short\ -vv\ $*
CompilerSet errorformat=
  \%+G%[=]%\\+\ %*\\d\ passed%.%#,
  \%-G%[_\ ]%\\+,
  \%+GE%.%\\+,
  \%I_%\\+\ %o\ _%\\+,
  \%E%f:%l:\ in\ %.%\\+,
  \%E%f:%l:%m,
  \%Z\ %\\{3}%m,
  \%-G,
  \%-G%.%\\+
"   " \%-GE%.%#,
  " \%E_%#\ %o\ _%#,
  " \%C%f:%l:\ in\ %.%#,
  " \%ZE%\\@=%m,
  " \%-G%[%^E]%.%#,
  " \%-G
" CompilerSet errorformat=
"       \%EE\ \ \ \ \ File\ \"%f\"\\,\ line\ %l,
"       \%CE\ \ \ %p^,
"       \%ZE\ \ \ %[%^\ ]%\\@=%m,
"       \%Afile\ %f\\,\ line\ %l,
"       \%+ZE\ %mnot\ found,
"       \%CE\ %.%#,
"       \%-G_%\\+\ ERROR%.%#\ _%\\+,
"       \%A_%\\+\ %o\ _%\\+,
"       \%C%f:%l:\ in\ %o,
"       \%ZE\ %\\{3}%m,
"       \%EImportError%.%#\'%f\'\.,
"       \%C%.%#,
"       \%+G%[=]%\\+\ %*\\d\ passed%.%#,
"       \%-G%[%^E]%.%#,
"       \%-G
