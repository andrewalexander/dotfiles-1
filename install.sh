#!/usr/bin/env bash

dir_exists() {
    if [ ! -d $1 ]; then
        echo "Target directory $1 does not exist"
        mkdircmd="mkdir $1"
        echo $mkdircmd
        $($mkdircmd)
  fi
}

create_link() {
    if [ -n $1 ]; then
        if [ ! -h $HOME/$1 ]; then
            echo "Creating symbolic link: $1"
            ln -s $PWD/$1 $HOME/$1
        fi
    else
        echo "create_link: Needs argument"
    fi
}

create_backup() {
    if [ -n $1  ]; then
        dir_exists $HOME/.backup
        if [ -f $HOME/$1 ] || [ -d $HOME/$1 ]; then
            if [ ! -h $HOME/$1 ]; then
                echo "$HOME/$1 already exists"
                POSIX_TS=$(date +%s)
                echo "Backing up $HOME/$1 to $HOME/.backup/$1.$POSIX_TS"
                mv $HOME/$1 $HOME/.backup/$1.$POSIX_TS
                unset POSIX_TS
            fi
        fi
    else
        echo "create_backup: Needs argument"
    fi
}

install_fonts() {
    if [ ! -d $HOME/.fonts ]; then
        echo "Installing fonts"
        $HOME/.vim/fonts/install.sh
        fc-cache -vf $HOME/.fonts/
    fi
}

create_local() {
    if [ -n $1  ]; then
        if [ ! -f $HOME/$1 ]; then
            echo "Creating $HOME/$1 file "
            cp $PWD/$1 $HOME/$1
        fi
    else
        echo "create_local: Needs argument"
    fi
}

set_perms() {
    if [ -n $1  ]; then
        if [ -f $HOME/$1 ]; then
            echo "Setting permissions on file $1 to 600"
            chmod 600 $HOME/$1
        fi
    else
        echo "set_perms: Needs argument"
    fi
}

run() {
    for f in .vimrc .vimrc.local .vim .bashrc.* .curlrc
    do
        [[ $f == *".local" ]] && continue
        create_backup $f
        create_link $f
    done

    create_local .bashrc.local
    create_local .vimrc.local

    install_fonts

    # Source new files in existing .bashrc
    for f in .bashrc.*
    do
        if ! grep "source \$HOME/$f" $HOME/.bashrc >/dev/null; then
            echo "Adding 'source \$HOME/$f' to .bashrc"
            echo "source \$HOME/$f" >> $HOME/.bashrc
        fi
    done
}

run
