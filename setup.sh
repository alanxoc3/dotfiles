#!/bin/bash

# update this if you move the location.
SCRIPT_PATH=~/sync/work/config

# Make sure you install:
# rg, fd, nvim, vim-plug...

# cf actual_file link_file
cf() {
   rm -f ~/$2
   ln -s $SCRIPT_PATH/$1 ~/$2
}

# cfc folder actual_file link_file
cfc() {
   mkdir -p ~/$1
   cf $2 $1/$3
}

cf bashrc       .bashrc
cf bash_aliases .bash_aliases
cf xinitrc      .xinitrc
cf bash_profile .bash_profile
cf profile      .profile
cf Xresources   .Xresources
cf tmuxconf     .tmux.conf
cf keynavrc     .keynavrc
cf bin          bin

cfc .config/nvim/     nvimrc           init.vim
cfc .config/i3/       i3-config        config
cfc .config/git/      gitconfig        config
cfc .config/i3status/ i3-status-config config
cfc .ssh/             ssh-config       config
cfc .ssh/             known_hosts      known_hosts
cfc .ssh/             authorized_keys  authorized_keys
