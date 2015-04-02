#!/usr/bin/env bash

function dir_exists() {
  if [ ! -d $1 ]
    then
      echo "Target directory $1 does not exist"
      mkdircmd="mkdir $1"
      echo $mkdircmd
      $($mkdircmd)
  fi        
}

VIMRC=$HOME/.vimrc

if [ -f $VIMRC ]
then
    if [ ! -h $VIMRC ]
    then
      echo "$HOME/.vimrc already exists"
      echo "Backing up $HOME/.vimrc to $HOME/.vim-backup/.vimrc"
      dir_exists $HOME/.vim-backup
      mv $HOME/.vimrc $HOME/.vim-backup/.vimrc
    fi
fi 

if [ -d $HOME/.vim ]
then
    if [ ! -h $VIMRC ]
    then
      echo "$HOME/.vim already exists"
      echo "Backing up $HOME/.vim to $HOME/.vim-backup/.vim"
      dir_exists $HOME/.vim-backup
      mv $HOME/.vim $HOME/.vim-backup/.vim
    fi
fi 

if [ ! -h $VIMRC ]
then
    echo "Creating symbolic links"
    ln -s $PWD/.vimrc $HOME/.vimrc
    if [ ! -h $HOME/.vim ]
    then
        ln -s $PWD/.vim $HOME/.vim
    fi
fi

if [ ! -d $HOME/.fonts ]
then
    echo "Installing fonts"
    $HOME/.vim/fonts/install.sh
    fc-cache -vf ~/.fonts/
fi

# Put this in .bashrc
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi
