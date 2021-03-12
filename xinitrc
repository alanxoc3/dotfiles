export CURR_WM=bspwm
export DESKTOP_SESSION=bspwm

setxkbmap us -variant dvorak
xmodmap -e "clear lock"
xmodmap -e "keysym Caps_Lock = Escape"
keynav
fcitx -d -r
redshift &
sxhkd &
# xsetroot -solid black

xss-lock -- i3lock -nc 000000 &
exec bspwm
