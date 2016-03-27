#!/bin/zsh

TIME=$(date "+%Y-%m-%d_%H-%M-%S")
DIR=~/.dotfiles
OLDDIR=~/.dotfiles_"$TIME"
FILES=(.zshrc .atom .osx .aliases)

# create dotfiles backup in ~
mkdir -p $OLDDIR

# change to the dotfiles directory
cd $DIR

# pull latest
# git pull origin master

for FILE in $FILES; do
  if [ -r ~/$FILE ]; then
    mv ~/$FILE $OLDDIR
  fi
  ln -s $DIR/$FILE ~/$FILE
done

source ~/.zshrc

# apm star --installed
# apm stars --install
