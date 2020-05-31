# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# path additions for macports
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# ruby path (brew told me)
export PATH="/usr/local/opt/ruby/bin:$PATH"

# some homebrew formulae put executables in local/sbin
export PATH="/usr/local/sbin:$PATH"

# mysql version 5.7
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# for installing python better with homebrew
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Ingresso scripts
export PATH="$PATH:$HOME/Code/ingresso-scripts/bin"

# Haskell stack packages
export PATH="$PATH:$HOME/.local/bin"

# llvm tools
export PATH="$PATH:/usr/local/opt/llvm/bin"

# Ruby gems
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export PATH="$PATH:/usr/local/lib/ruby/gems/2.7.0/bin"

# Go
export GOPATH="$HOME/.go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# view instructions here https://reactnative.dev/docs/environment-setup
