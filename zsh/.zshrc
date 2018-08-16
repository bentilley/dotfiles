#source ~/.dotfiles/zsh/.alias

for file in ~/.dotfiles/zsh/.{alias,function}; do
  [ -f $file ] && source $file;
  [ -f $file ] && echo $file
done;
