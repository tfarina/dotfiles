alias reload="source ~/.bashrc"

# Vim settings.
alias v="vim"

# Git settings.
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
