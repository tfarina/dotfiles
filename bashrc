# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f ~/.bash_functions ]; then
  source ~/.bash_functions
fi

export TERM=gnome-256color
export EDITOR="vim"
export PYTHONDONTWRITEBYTECODE=1
export LANG="C" # so sort works in ASCII order.

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

# Append to the history file, don't overwrite it.
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Taken from https://github.com/mathiasbynens/dotfiles/blob/master/.exports#L4
# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE="32768";
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL="ignoreboth";

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

alias reload="source ~/.bashrc"

# Vim settings.
alias v="vim"

# Git settings.
alias g="git"
alias gd="git diff"

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# Make the autocompleton work with the g alias.
complete -o bashdefault -o default -o nospace -F _git g
complete -o default -o nospace -F _git g

# https://github.com/jelera/dotfiles/blob/master/bash/bashrc
#----------------------------------------------------------------------------//
# => COLORS
#----------------------------------------------------------------------------//
txtrst='\e[0m'    # Text Reset
# regular colors
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

# emphasized (bolded) colors
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White

# background colors
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White

# underlined colors
undblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White

BLACK='\[\033[0;30m\]'
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
GREEN_BOLD='\[\033[01;32m\]'
YELLOW='\[\033[0;33m\]'
YELLOW_BOLD='\[\033[01;33m\]'
BLUE='\[\033[0;34m\]'
BLUE_BOLD='\[\033[01;34m\]'
PURPLE='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
WHITE='\[\033[0;37m\]'
NORMAL='\[\033[00m\]'
PROMPT="\$"
DIR="\w"
TIME='\[\033[01;31m\]\t \[\033[01;32m\]'
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="$CYAN\u $YELLOW\h ${bldblu}$DIR$GREEN\$(__git_ps1)\n$NORMAL$PROMPT$NORMAL "

# Linus Torvalds bash prompt style.
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Junio Hamano bash prompt style:
#export PS1=': \h \W$(__git_ps1 "/%s"); '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Enable programmable completion features (you don't need to enable this, if
# it's already enabled in /etc/bash.bashrc and /etc/profile sources
# /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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

# Put LLVM binaries (clang, lldb, etc.) into PATH.
# It needs to come after depot_tools, otherwise it will conflict with
# depot_tools' clang-format.
export PATH=~/src/repos/llvm/build/bin:"${PATH}"

# Chromium settings.
export CR_DIR="${HOME}/chromium/src"
alias crd="cd ${HOME}/chromium/src"
alias bkd="cd ${HOME}/blink/src/third_party/WebKit"
export PATH=~/depot_tools:"${PATH}"
export GYP_GENERATORS="ninja"

# Make my tools accessible everywhere.
export PATH=~/src/dotfiles/bin:"${PATH}"

# Put ninja into PATH.
export PATH=~/src/repos/github.com/martine/ninja:"${PATH}"

# Put arcanist into PATH.
export PATH=~/src/repos/phabricator/arcanist/bin:"${PATH}"

# Put Plan9 into PATH.
export PLAN9=/usr/local/plan9
# Plan9 should be in the end of the PATH because there are some binaries there
# that we don't want to use.
export PATH="${PATH}":$PLAN9/bin

# Put clang into PATH. This should come last, so it appears first in the PATH
# list. It needs to come first to make sure we use the one from Chromium,
#otherwise the chromium-style plugin won't work.
export PATH=~/chromium/src/third_party/llvm-build/Release+Asserts/bin:"${PATH}"

# Export GeometricTools path variable.
export WM5_PATH=~/src/GeometricTools/WildMagic5

# LS alias.
alias lld="ls -lUd */"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# Mac OS X 'open' alias.
alias open="xdg-open"

# Get my ip address.
alias myip="wget -O - -q http://www.networksecuritytoolkit.org/nst/cgi-bin/ip.cgi"
function mylocalip {
  /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}';
}

### ... auto added next three lines
### dmd 2.067 installed using prefix: /usr/local/dmd
export PATH=/usr/local/dmd/bin:${PATH}
export LD_LIBRARY_PATH=/usr/local/dmd/lib:${LD_LIBRARY_PATH}
