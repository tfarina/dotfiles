alias reload="source ~/.bashrc"

# Emacs.
alias e='emacsclient -t -c -a ""'

# Vim.
alias v="vim"

# Git.
alias g="git"
alias gd="git diff"

alias bd="sudo biosdecode"
alias bi="sudo hwinfo --bios | less"
alias db="sudo dmidecode --type bios"
alias lh="sudo lshw"
#
# https://rtcamp.com/tutorials/nginx/troubleshooting/emerg-bind-failed-98-address-already-in-use/
alias kill80="sudo fuser -k 80/tcp"
# http://www.cyberciti.biz/faq/find-linux-what-running-on-port-80-command/
alias whois80="sudo netstat -tulpn | grep :80"
alias servers="sudo netstat -tulpn"
# sudo fuser 80/tcp
# ls -l /proc/12161/exe

# Some Chromium aliases that make me more productive.
alias crd="cd ${HOME}/chromium/src"
alias bkd="cd ${HOME}/blink/src/third_party/WebKit"

# Microsoft Lifechat LX-3000
# http://askubuntu.com/questions/153438/unable-to-make-sound-play-in-headset
# http://askubuntu.com/questions/341836/volume-control-microsoft-lifechat-lx-3000
alias headset="pulseaudio -k"
# pactl list sinks | grep -A2 -B2 -i running
alias mute="pactl set-sink-mute 1 1"
alias unmute="pactl set-sink-mute 1 0"
alias audiocards="cat /proc/asound/cards"
alias audiodevices="sudo aplay -l"
# mp3player $ehr or mp3player -C $ehr
alias mp3player="mpg123 -a hw:1,0"
export ehr="http://stream.europeanhitradio.com:8000/ehr.mp3"

alias network_connect="wicd-cli --wired --connect"
alias network_disconnect="wicd-cli --wired --disconnect"
# http://www.cyberciti.biz/faq/howto-linux-renew-dhcp-client-ip-address/
alias release_dhcp="sudo dhclient -v -r wlan0"
alias renew_dhcp="sudo dhclient -v wlan0"

# LS alias.
alias ls="ls -F --color"
alias lld="ls -lUd */"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# Mac OS X 'open' alias.
alias open="xdg-open"

# Get my ip address.
alias myip="wget -O - -q http://www.networksecuritytoolkit.org/nst/cgi-bin/ip.cgi"
