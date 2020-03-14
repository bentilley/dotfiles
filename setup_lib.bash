DOTFILE_DIR="$HOME/.dotfiles"

# colours
green=$(tput setaf 2)
yellow=$(tput setaf 220)
blue=$(tput setaf 14)
normal=$(tput sgr0)

# create symlinks from .dotfiles dir to relevant place
# - given a source and target file, creates symlinks
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

# for installing software from github
# - this checks if the software already exists, otherwise it clones it
git_install() {
  GIT_REPO="$1"
  INSTALL_DIR="$2"
  SOFTWARE_NAME="$3"
  if [ ! -d $INSTALL_DIR ]; then
    git clone https://github.com/$GIT_REPO $INSTALL_DIR
    git_install_success $SOFTWARE_NAME $INSTALL_DIR
  else
    git_install_error $INSTALL_DIR "Directory already exists"
  fi
}

git_install_success() {
  printf "    $1 has been ${green}successfully installed${normal} to $2 :)\n"
}

git_install_error() {
  printf "    Software not installed to $1. ${blue}$2.${normal}\n"

}

# installing software from brew formulae
# - just given the executable name and the formula name, installs if not found
brew_install() {
  EXECUTABLE_NAME="$1"
  BREW_FORMULA="$2"
  if ! prog_exists $EXECUTABLE_NAME; then
    brew_install_success $EXECUTABLE_NAME
    brew install $BREW_FORMULA
  else
    brew_install_error $EXECUTABLE_NAME
  fi

}

# create a directory that some program needs
# - provide full path to dir (intermediate dirs will be created)
test_and_mkdir() {
  DIR_PATH="$1"
  REQUIRING_PROG="$2"
  if [ ! -d $DIR_PATH ]; then
    mkdir -p $DIR_PATH
    printf "Additional directory ${green}$DIR_PATH${normal} has been created for ${yellow}$REQUIRING_PROG${normal}"
  fi
}

prog_exists() {
  command -v $1 >/dev/null 2>&1
}

brew_install_success() {
  printf "  ${green}Installing${normal} $1... :)\n"
}

brew_install_error() {
  printf "  Did not install ${yellow}$1${normal}. ${blue}Software already installed.${normal}\n"
}
