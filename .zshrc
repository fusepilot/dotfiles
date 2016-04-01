# Detect os
export PLATFORM=`uname`

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -s $HOME/.aliases ]]; then
    source $HOME/.aliases
fi

if [[ -s $HOME/.osx ]]; then
    source $HOME/.osx
fi

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='subl -w'
else
  export EDITOR='subl'
fi

# source houdini
if [[ -s /Library/Frameworks/Houdini.framework/Versions/Current/Resources ]]; then
  cd /Library/Frameworks/Houdini.framework/Versions/Current/Resources
  source houdini_setup_bash
  cd -
fi

export VISUAL=$EDITOR

# export PATH="$HOME/bin:$PATH"
# export PATH="/bin:$PATH"
# export PATH="/sbin:$PATH"
# export PATH="/usr/bin:$PATH"
# export PATH="/usr/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.multirust/toolchains/nightly/cargo/bin:$PATH"
# export PATH="/usr/local/share/npm/bin:$PATH"

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ol" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

unalias gm

function command_exists {
  type "$1" &> /dev/null;
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# pyenv
if command_exists pyenv ; then
  export PYENV_ROOT=/usr/local/var/pyenv
  eval "$(pyenv init -)"
fi

# utils
function source-dotfiles {
  source $HOME/.zshrc
}

function sync-dotfiles {
  apm star --installed
  apm stars --install
}
