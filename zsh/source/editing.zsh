# Open the output of the last command with the editor.
function vl() {
  $EDITOR $(eval $(fc -ln -1))
}
