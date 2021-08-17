#!/bin/bash

# Thanks to: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# cf actual_file link_file
cf() {
   DIR="$SCRIPT_DIR/$1"
   if [[ $1 =~ ^/ ]]; then
      DIR=$1
   fi

   if [ -e "$DIR" ]; then
      rm -f ~/$2
      mkdir -p $(dirname ~/$2)
      ln -s $DIR ~/$2
   fi
}

cf zshrc              .zshrc
cf zshenv             .zshenv
cf bashrc             .bashrc
cf aliases            .aliases
cf xinitrc            .xinitrc
cf bash_profile       .bash_profile
cf profile            .profile
cf Xresources         .Xresources
cf tmuxconf           .tmux.conf
cf keynavrc           .keynavrc
cf local_aliases      .local_aliases
cf local_bash_profile .local_bash_profile
cf local_gitconfig    .local_gitconfig
cf gitignore          .gitignore
cf doom               .doom.d
cf git-templates      .git-templates
cf nvim               .config/nvim
cf kak                .config/kak
cf kak-lsp            .config/kak-lsp
cf bspwmrc            .config/bspwm/bspwmrc
cf sxhkdrc            .config/sxhkd/sxhkdrc
cf gitconfig          .config/git/config
cf kitty-config       .config/kitty/kitty.conf
cf concards-data      .local/share/concards
cf concards-config    .config/concards
cf ssh-config         .ssh/config
cf mimeapps.list      .config/mimeapps.list
cf alacritty.yml      .config/alacritty/alacritty.yml
cf search-ignore      .config/fd/ignore
cf irssi-config       .irssi/config
cf irssi-theme        .irssi/default.theme

# Use whichever one exists. One is mac, one is arch.
cf /usr/share/kak/rc        .config/kak/autoload/rc
cf /usr/local/share/kak/rc  .config/kak/autoload/rc

# Ripgrep config can't recognize environment variables in its configuration.
# Putting the config here is my best solution.
cat << EOF > $HOME/.rgconfig
--no-heading
--no-follow
--hidden
--ignore-file=${HOME}/.dotfiles/search-ignore
EOF

# For irssi, you need to generate a pem file and connect to it. In a shell:
# openssl req -nodes -newkey rsa:4096 -keyout /tmp/libera.key -x509 -days 365 -out /tmp/libera.cer
# mkdir -p ~/.irssi/certs
# cat /tmp/libera.cer /tmp/libera.key > ~/.irssi/certs
# rm /tmp/libera.cer /tmp/libera.key

# Then in irssi:
# /msg nickserv identify <pass>
# /msg nickserv cert add
