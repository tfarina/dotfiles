export TERM=gnome-256color
export EDITOR="vim"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Append to the history file, don't overwrite it.
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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

GREEN_BOLD='\[\033[01;32m\]'
YELLOW_BOLD='\[\033[01;33m\]'
BLUE_BOLD='\[\033[01;34m\]'
NORMAL='\[\033[00m\]'
PROMPT="\$"
DIR="\w"
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="$GREEN_BOLD\u:\h $BLUE_BOLD$DIR$YELLOW_BOLD\$(__git_ps1)\n$NORMAL$PROMPT$NORMAL "

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

alias network_connect="wicd-cli --wired --connect"
alias network_disconnect="wicd-cli --wired --disconnect"

# Chromium settings.
export CR_DIR="${HOME}/chromium/src"
alias dev="cd ${CR_DIR}"
alias bk="cd ${HOME}/blink/src/third_party/WebKit"
export PATH=~/depot_tools:"${PATH}"
export CC="clang"
export CXX="clang++" # -Wno-conversion-null
export GYP_GENERATORS="ninja"
export GYP_PARALLEL=1
export LANG=C # so sort works in ASCII order

# Chromium OS settings.
#alias cros="cd ~/chromiumos/src"
#eval $(keychain --eval ~/.ssh/chromium)

# Make my tools accessible everywhere.
export PATH=~/src/dotfiles/bin:"${PATH}"

# Put ninja into PATH.
export PATH=~/src/repos/github.com/martine/ninja:"${PATH}"

# Put clang-format into PATH.
#export PATH=~/src/repos/llvm/build/bin:"${PATH}"

# Put arcanist into PATH.
export PATH=~/src/repos/phabricator/arcanist/bin:"${PATH}"

# Put Go toolset into PATH.
export GOROOT=/usr/local/go
export GOPATH=$HOME/golib
export PATH=$GOROOT/bin:"${PATH}"
export PATH=$GOPATH/bin:"${PATH}"

# Put Plan9 into PATH.
export PLAN9=/usr/local/plan9
export PATH="${PATH}":$PLAN9/bin

# Put clang into PATH. This should come last, so it appears first in the PATH
# list. Because we want/need to use the one provided by chromium, so the plugin
# works.
export PATH=~/chromium/src/third_party/llvm-build/Release+Asserts/bin:"${PATH}"

# Export GeometricTools path variable.
export WM5_PATH=~/src/GeometricTools/WildMagic5


# LS alias.
alias lld="ls -lUd */"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# Lithium settings.
alias cl="cd ~/src/lithium/src"

# Vim settings.
alias v="vim"

# Benjamin Kalman is the author of this function.
vl() {
  file=`echo "$1" | cut -d: -f1`
  line=`echo "$1" | cut -d: -f2`
  v "$file" +"$line"
}

# Git settings.
alias g="git"
alias gd="git diff"
source ~/.git-completion.bash
source ~/.git-prompt.sh

# Mac OS X 'open' alias.
alias open="xdg-open"

# Get my ip address.
alias myip="wget -O - -q http://www.networksecuritytoolkit.org/nst/cgi-bin/ip.cgi"
function mylocalip {
  /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}';
}

# Make the autocompleton work with the g alias.
complete -o bashdefault -o default -o nospace -F _git g
complete -o default -o nospace -F _git g

po() {
  old_dir=`pwd`
  if [ -d "$1" ]; then
    cd "$1"
  elif [ -f "$1" ]; then
    cd `dirname "$1"`
  else
    echo "Couldn't find file or directory $1"
    return 1
  fi

  print_owners() {
    if [ -f OWNERS ]; then
      echo "=== `pwd`"
      cat OWNERS
      echo
    fi
  }

  while [ `pwd` != "$old_dir" -a `pwd` != / ]; do
    print_owners
    cd ..
  done
  print_owners

  unset print_owners
  cd "$old_dir"
}
