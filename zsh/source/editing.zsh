# Open the output of the last command with the editor.
function el() {
  $EDITOR $(eval $(fc -ln -1))
}
