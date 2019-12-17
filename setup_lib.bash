DOTFILE_DIR="$HOME/.dotfiles"

dotfile_link() {
  SOURCE_FILE=$DOTFILE_DIR/"$1"
  TARGET_FILE="$2"

  if [ -f $SOURCE_FILE ]; then
    if [ ! -h $TARGET_FILE ]; then
      ln -s $SOURCE_FILE $TARGET_FILE
    else
      symlink_error $TARGET_FILE "Symlink already exists"
    fi
  else
    symlink_error $SOURCE_FILE "No source file"
  fi
}

symlink_error() {
  printf "Could not link file $1. $2."
}
