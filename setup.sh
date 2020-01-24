#!/bin/bash

SCRIPT_PATH=~/.dotfiles

# Make sure you install:
# rg, fd, nvim, vim-plug...

# cf actual_file link_file
cf() {
   if [ -e "$SCRIPT_PATH/$1" ]; then
      rm -f ~/$2 ;
      ln -s $SCRIPT_PATH/$1 ~/$2 ;
   fi
}

# cfc folder actual_file link_file
cfc() {
   mkdir -p ~/$1
   cf $2 "$1/$3"
}

cf bashrc             .bashrc
cf bash_aliases       .bash_aliases
cf xinitrc            .xinitrc
cf bash_profile       .bash_profile
cf profile            .profile
cf Xresources         .Xresources
cf tmuxconf           .tmux.conf
cf keynavrc           .keynavrc
cf local_bashrc       .local_bashrc
cf local_bash_profile .local_bash_profile
cf local_gitconfig    .local_gitconfig
# bin and local_bin are in the '~/.dotfiles' folder

cfc .config/nvim/     nvimrc           init.vim
cfc .config/i3/       i3-config        config
cfc .config/git/      gitconfig        config
cfc .config/i3status/ i3-status-config config
cfc .ssh/             ssh-config       config
cfc .ssh/             known_hosts      known_hosts
cfc .ssh/             authorized_keys  authorized_keys

# TODO: figure out better way to do this.
cfc .mozilla/firefox/5hc7mfqd.default-release/chrome/ userChrome.css userChrome.css
