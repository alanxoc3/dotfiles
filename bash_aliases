#!/bin/bash
# https://stackoverflow.com/questions/4642822/commands-executed-from-vim-are-not-recognizing-bash-command-aliases
shopt -s expand_aliases  

# Alan's bash aliases.
alias runi=startx
alias editi3='vim ~/sync/work/config/i3-config'

# For syncthing:
alias serve_syncthing='ssh -N -L 9090:***REMOVED***:8384 alanxoc3@alan'

alias pe='pass edit'
alias int='sudo wifi-menu'
alias cdr='cd /'
# Clear Water stuff
alias svnignore='git svn show-ignore >> .git/info/exclude'
# alias renginx="sudo killall nginx; sudo nginx"
alias renginx="sudo nginx -s reload"
# run "mvn package" to update maven package.
alias mvnp="mvn package"
alias mvnj="mvn javadoc:javadoc"

# Alan's goals are important :D.
alias plan="vim ~/sync/shuying/alan/plan.txt"
alias goals="vim ~/sync/shuying/alan/{achieve,plan,day}.txt ~/sync/shuying/alan/logs/*"
alias umnt='sudo umount /mnt'

alias screen_off="xset dpms force off"

alias lid="echo locked > '/tmp/.lid-lock-file'"

alias gpgpin="echo tmp > /tmp/gpg_tmp; gpg -r alanxoc3 -e /tmp/gpg_tmp; gpg -d /tmp/gpg_tmp.gpg"
alias fb="/home/alanxoc3/repos/fuzzybird/fuzzybird.py --hashtag"
alias dropfile="dropbox-cli sharelink"

alias rndbkgd="feh --randomize --bg-fill ~/Pictures/photos/*"
alias difbkgd="rndbkgd"

alias vim="nvim"

alias mkflashdrive='sudo mkfs.vfat -n AMORG'

alias hy='hy --repl-output-fn=hy.contrib.hy-repr.hy-repr'

alias updatexterm='xrdb merge ~/.Xresources'
alias editxterm='vim ~/.Xresources'

alias editvim='vim ~/.config/nvim/init.vim'
alias editnvim=editvim

# other folders
alias down='cd ~/Downloads; ls'
alias drop='cd ~/Dropbox; ls'
alias cdpico="cd ~/.lexaloffle/pico-8/carts"
alias sdcard='cd /sdcard; ls;'

# -------------------------
# UN-ORGANIZED THINGS BELOW
# -------------------------
alias feh='feh --force-aliasing --scale-down'

alias today='vim ~/sync/shuying/alan/day.txt'
alias day=today
alias daily=today

# Gets a lower quality of a video.
alias getvid="youtube-dl -f 18"

# find all
alias fa="grep -r --exclude-dir='.*'"
alias fai="fa -i"

# pico lib utils.
alias p8tool='~/repos/picotool/p8tool'

# Ranger is used a lot by me.
alias r='ranger'

# Cooler watch format.
alias watch='watch -c -d'

# Poor Man's VPN
# See: https://github.com/sshuttle/sshuttle
# Pyenv fix: https://github.com/sshuttle/sshuttle/issues/381#issuecomment-564532758
alias vpn='sshuttle --dns -r alan 0/0 -x ***REMOVED*** --python /home/alanxoc3/.pyenv/versions/3.7.5/bin/python'


alias g='git'
alias commit='git add --all; git commit;'
alias status='git status'
alias pull='git pull'
alias fetch='git fetch'
alias push='git push'
alias psuh='push'
alias pushn='git push --set-upstream origin'

# If you ever want to get a pull request locally, here is an example :).
# git fetch origin pull/8864/head:develop

alias i3l='i3lock'
alias 3il='i3lock'

# sync
alias redrop='pkill dropbox; echo dropbox | bash - &'
alias dropstat='dropbox-cli status'
alias dropls='dropbox-cli ls'
alias rapiddrop="while [ true ]; do clear; dropstat; sleep 1; done"

alias mone="sudo mount /dev/sda1 /mnt"
alias mtwo="sudo mount /dev/sdb1 /mnt2"
alias umone="sudo umount /mnt"
alias umtwo="sudo umount /mnt2"

# Concards
alias flashcode='concards -rmn 20 /home/alanxoc3/sync/cards/code/*'
alias flashmand='concards -rmn 20 /home/alanxoc3/sync/cards/mandarin/*'
alias flashbook='concards -rmn 20 /home/alanxoc3/sync/cards/book/*'
alias flashr='concards -rn 20 /home/alanxoc3/sync/cards/*/*'
alias flashm='concards -mn 20 /home/alanxoc3/sync/cards/*/*'
alias flash='concards -mrn 20 /home/alanxoc3/sync/cards/*/*'

alias copycurrent='echo cd $(pwd) | xclip'
alias copypath=copycurrent

alias dd='dd status=progress'
alias ta='tmux attach'
alias todo="vim ~/sync/docs/todo.txt"
alias R="R --quiet"
alias nomouse='synclient TouchpadOff=1'
alias mouse='synclient TouchpadOff=0'
alias ruin=runi
alias rnui=runi
alias ls..="ls .."

alias powreoff=poweroff
alias poweraff=poweroff
alias pwoeroff=poweroff
alias pworeoff=poweroff

alias oweroff="poweroff"

# All possible acpi combinations, excluding acpi!
alias acip=acpi
alias aicp=acpi
alias aipc=acpi
alias apic=acpi
alias apci=acpi

alias ipac=acpi
alias ipca=acpi
alias iapc=acpi
alias iacp=acpi
alias icap=acpi
alias icpa=acpi

alias caip=acpi
alias capi=acpi
alias ciap=acpi
alias cipa=acpi
alias cpai=acpi
alias cpia=acpi

alias piac=acpi
alias pica=acpi
alias pcia=acpi
alias pcai=acpi
alias paci=acpi
alias paic=acpi

alias cpi=acpi
alias acp=acpi

# Cmus combos.
alias cmsu=cmus

# Read those scriptures!
alias zasa="zathura ~/sync/books/sankta_biblio.pdf &"

alias zath=zathura


alias slblk=lsblk
alias rmemacs='find * -name "*~" -delete'
alias noemacs=rmemacs
alias rmemac=rmemacs
alias noemac=rmemacs
alias bc='bc -q'
alias df='df -h'
alias rs="fc -s"

# This is adjusted to Los Angeles.
alias redshift='redshift -l 34.05:-118.24'
alias invert="xcalib -i -a > /dev/null"


alias bri="sbri 80"
alias dim="sbri 20"
alias mid="sbri 50"
alias morbri="sbri 90"
alias mordim="sbri 10"
alias supbri="sbri 100"
alias supdim="sbri 1"

# Dictionaries
alias 词典="vim ~/sync/alioj/chinese/cedict_ts.u8"
alias cidian="vim ~/sync/alioj/chinese/cedict_ts.u8"
alias ci2dian3="vim ~/sync/alioj/chinese/cedict_ts.u8"
alias vortaro="vim ~/sync/ref/esperanto_dictionary.txt"
alias vortar=vortaro

# Test Bash
alias testbash='source $(cat > /tmp/.testbash; echo /tmp/.testbash)';

alias updatebash='source ~/.bashrc'
alias updatealias='source ~/.bash_aliases'
alias updateprofile='source ~/.profile'

alias editbash='vim ~/.bashrc'
alias editbosh=editbash
alias editbsh=editbash
alias editprofile='vim ~/.profile'
alias editalias='vim ~/.bash_aliases'

alias eb='editbash'
alias ea='editalias'
alias ep='editprofile'

alias ub='updatebash'
alias ua='updatealias'
alias up='updateprofile'

alias bright=bri

# Tab completion and run aliases with sudo.
alias sudo='sudo '

alias l='ls'
alias l.='ls -d .*'
alias la='ls -A'
alias lsa=la

alias updatebash=". ~/.bashrc"

alias files=nautilus
alias emacs='emacs -nw'
alias cd.='cd .'
alias cd..='cd ..'

# My class folder
alias schedule='clear;cat ~/sync/remember/schedule.org'
alias editschedule='vim ~/sync/remember/schedule.org'

# Connect to the Linux Lab!
alias ***REMOVED***='ssh -p 215 alanxoc3@***REMOVED***'
alias mount***REMOVED***='sshfs -p 215 -o allow_other alanxoc3@***REMOVED***:./ ~/alan/ -C'
alias mll='mount***REMOVED***'; alias mountll='mount***REMOVED***'

# A spiritual man.
alias scrip='vim -R ~/sync/ref/scrips.txt'
alias scrips=scrip

# dictionary
alias dictionary=sdcv
alias dict=sdcv
alias dic=sdcv
alias define=sdcv
alias def=sdcv
alias defin=sdcv
alias defi=sdcv

alias daet=date

# Connect to the internet
alias netman='systemctl start NetworkManager.service'
alias nonet='systemctl stop NetworkManager.service'
alias renet='systemctl restart NetworkManager.service'

# Enable printing.
alias printer='systemctl start org.cups.cupsd'
alias noprinter='systemctl stop org.cups.cupsd'

# See if the internet is working
alias pinger='ping www.google.com'

# Google it up!
alias googleit='w3m www.google.com'
alias w3m='w3m -no-mouse'

# Keyboard Layouts
alias cdv='localectl set-keymap --no-convert dvorak-programmer'
alias cqw='localectl set-keymap --no-convert us'

alias gdv='setxkbmap -layout "us" -variant "dvorak"'
alias gqw='setxkbmap -layout "us"'
alias gwm='setxkbmap -layout "us" -variant "workman"'

# Temporary commands...
alias mountsdcard=mountcard
alias mountmicrosd=mountcard
alias gnome-terminal="dbus-launch gnome-terminal"

alias rmr="rm -r"

# For my mistakes...
alias clera=clear
alias cls=clear
alias ll='ls -l'
alias lsl='ls -l'
alias ssl='ls -l'
alias sls='ls -l'
alias lsla='ls -la'
alias vp=cp
alias eixt=exit
alias quit=exit

alias eitx=exit
alias xti=exit
alias etix=exit
alias xeit=exit
alias etxi=exit
alias xit=exit
alias ext=exit
alias exti=exit
alias xite=exit
alias ake=make
alias kmake=make
alias maek=make
alias amke=make
alias mkae=make
alias mkea=make
alias maake=make

alias jake=make
alias jmake=make

# I like color.
alias ls='ls -v --color=auto'
alias sl=ls
alias lls=ls
alias lss=ls
alias mak=make

# Replace vi with vim.
alias vi='vim'
alias im='vim'

# Navigate to various folders easily.
alias rd='cat ~/sync/goals/rd.txt | less'
alias editrd='vim ~/sync/goals/rd.txt'

# Edit a journal.
alias ed1='vim ~/shuying/alan/1_diary.txt'
alias ed2='vim ~/shuying/alan/2_diary.txt'
alias ed3='vim ~/shuying/alan/3_diary.txt'
alias ed4='vim ~/shuying/alan/4_diary.txt'
alias ed5='vim ~/shuying/alan/5_diary.txt'
alias ed6='vim ~/shuying/alan/6_diary.txt'
alias ed7='vim ~/shuying/alan/7_diary.txt'
alias ed8='vim ~/shuying/alan/8_diary.txt'
alias ed9='vim ~/shuying/alan/9_diary.txt'
alias edA='vim ~/shuying/alan/A_diary.txt'
alias edB='vim ~/shuying/alan/B_diary.txt'
alias edC='vim ~/shuying/alan/C_diary.txt'
alias edD='vim ~/shuying/alan/D_diary.txt'
alias edE='vim ~/shuying/alan/E_diary.txt'
alias edF='vim ~/shuying/alan/F_diary.txt'
alias edG='vim ~/shuying/alan/G_diary.txt'
alias edH='vim ~/shuying/alan/H_diary.txt'

alias jrn='edH'

alias journ='jrn'
alias editjour='jrn'
alias taglibro='jrn'

# Display the contents of a special blessing given to me.
# Permissions require SUDO privileges.
alias patbless='sudo cat ~/patBless.txt | less; clear;'
alias patriarchal=patbless
alias blessing=patbless

# Display and edit my future goals (more than yearly).
alias iomut=imout
alias meout=imout
alias future='cat ~/sync/goals/futureGoals.txt | less'
alias futuregoal=future
alias futuregoals=future
alias goalfuture=future
alias goalsfuture=future

alias editfuture='vim ~/sync/goals/futureGoals.txt'
alias editfuturegoal=editfuture
alias editfuturegoals=editfuture
alias editgoalfuture=editfuture
alias editgoalsfuture=editfuture

alias simplegame='~/.simplegame/simplegame'
alias skeet="~/sync/coding/completed/skeet/skeet"

# Edit this file easily, to add a command.
# Take notes from the quran with ease.
alias quran='vim ~/sync/remember/notes/quran.txt'
alias proclamation='less ~/sync/remember/proclamation.txt'

# Locks all TTYs.
alias lock="physlock"

alias gf=fg

alias nin="sudo modprobe ns588 joydev analog;"
alias nincontroller=nin
alias 64controller=nin
alias 64control=nin
alias nin64control=nin
alias controller=nin
alias nincont=nin

# Clipboard stuff
alias cclip='xclip -selection clipboard'
alias clipp='xclip -selection clipboard -o'

alias iwpoweroff='sudo iw wlan0 set power_save off'
alias jp='jp2a --colors'
alias cret='echo $?'

alias alan='sshfs -o allow_other alanxoc3@alan:/home/alanxoc3/ ~/alan/ -C'
alias mountalan=alan
alias noalan='fusermount -u ~/alan'
alias umountalan=noalan
alias unmountalan=noalan

alias vid2mp3='youtube-dl --extract-audio --audio-format mp3'
alias nops='PS1="$ "'
alias tops='PS1="[\u-\[\033[0;31m\]\#\[\033[0m\] \W]\$ "'

alias pico="pico8"
alias pic_tur="pic_open ~/.lexaloffle/pico-8/carts/sims/turing-machine"
alias pic_mou="pic_open ~/.lexaloffle/pico-8/carts/work/pico-8-club/mouth-mouth"
alias pic_ray="pic_open ~/.lexaloffle/pico-8/carts/sims/raycasting"
alias pic_chn="pic_open ~/.lexaloffle/pico-8/carts/chrononaut"
alias pic_zel="pic_open ~/.lexaloffle/pico-8/carts/games/zeldo"

alias pavucontrol="ncpamixer"

alias cnc="concards $CONCARDS_HOME"

alias psudo='sudo env "PATH=$PATH" '
