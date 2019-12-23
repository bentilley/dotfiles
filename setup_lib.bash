DOTFILE_DIR="$HOME/.dotfiles"

# colours
blue=$(tput setaf 4)
green=$(tput setaf 2)
normal=$(tput sgr0)

dotfile_link() {
  SOURCE_FILE=$DOTFILE_DIR/"$1"
  TARGET_FILE="$2"

  test_target_file_dir $TARGET_FILE

  if [ -f $SOURCE_FILE -o -d $SOURCE_FILE ]; then
    if [ ! -h $TARGET_FILE ]; then
      ln -s $SOURCE_FILE $TARGET_FILE
      if [ $? -eq 0 ]; then
        symlink_success $SOURCE_FILE $TARGET_FILE
      fi
    else
      symlink_error $TARGET_FILE "Symlink already exists"
    fi
  else
    symlink_error $SOURCE_FILE "No source file"
  fi
}

test_target_file_dir() {
  TARGET_DIR=$(dirname "$1")
  if [ ! -d $TARGET_DIR ]; then
    mkdir -p $TARGET_DIR
  fi
}

symlink_success() {
  printf "  ${green}Linking${normal} $1 to $2 :)\n"
}

symlink_error() {
  printf "  Did not link file $1. ${blue}$2.${normal}\n"
}
