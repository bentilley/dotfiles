# My VIM Config (and useful info)

The `.vim` directory contained in this directory is for user vim settings. This should be symlinked to the \$HOME directory.

There is also a global settings directory available at `/usr/share/vim/vim80`. This is where most of the `vim` settings live.

## Plugins

- UltiSnips: if you would like to look at or get some example snippets they are available here - https://github.com/honza/vim-snippets
- Emmet: summary of syntax:
  - `>` is child of;
  - `+` is sybling relationship;
  - `.` and `#` are used for classes and id tags
  - `^` is used to go back up a level of the DOM tree
  - `{}` is used to insert a text node
  - `*` is multiplication to insert multiple of the preceeding element
  - `$` is a place holder for the index when using `*` - can be configured with `@-` to reverse numbering and `@N` to start at count `N`
  - `[]` are used for custom attributes e.g. `a[name="john"] => <a name="john"></a>`
  - `()` are used to group complex combinations of elements
