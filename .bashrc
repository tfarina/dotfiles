# Chromium settings.
export PATH=~/depot_tools:"${PATH}"
export CC="gcc -B/usr/local/gold/bin"
export CXX="g++ -B/usr/local/gold/bin -Wno-conversion-null"
export GYP_GENERATORS="make,ninja"
export LD_LIBRARY_PATH=~/chromium/src/out/Debug:~/chromium/src/out/Debug/lib.target:$LD_LIBRARY_PATH
alias cr="cd ~/chromium/src"
alias crl="~/chromium/src/out/Debug/chrome --enable-logging --v=1"

# Make my scripts accessible everywhere.
export PATH=~/scripts:"${PATH}"

# Put ninja into PATH.
export PATH=~/src/ninja:"${PATH}"

# Chromium Clang settings.
#export PATH=~/chromium/src/third_party/llvm-build/Release+Asserts/bin:"${PATH}"
#export CC=clang
#export CXX=clang++
#export GYP_DEFINES="clang=1 clang_use_chrome_plugins=1"

# Chromium OS settings.
#alias cros="cd ~/chromiumos/src"
#eval $(keychain --eval ~/.ssh/chromium)

# Android settings.
#export PATH=~/android-sdk-linux_x86/tools/:"$PATH"
#alias ca="cd ~/android"

# Lithium settings.
alias cl="cd ~/lithium/src"

# Git settings.
alias g='git'
alias gd='g d'

# Vim settings.
alias v='vim'

# Mac OS X 'open' alias.
alias open='xdg-open'

# Emacs settings.
#alias em="emacs -nw"

# Create a new directory and enter it.
md() {
  mkdir -p "$@" && cd "$@"
}

# Some alias utilities.
alias lld="ls -lUd */"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Make the autocompleton work with the g alias.
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
|| complete -o default -o nospace -F _git g

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

GREEN='\[\033[01;32m\]'
BLUE='\[\033[01;34m\]'
YELLOW='\[\033[01;33m\]'
NORMAL='\[\033[00m\]'
PROMPT="\$"
DIR="\w"
export PS1="$GREEN\u:\h $BLUE$DIR$YELLOW\$(__git_ps1)$BLUE\n$NORMAL$PROMPT$NORMAL "
export GIT_PS1_SHOWDIRTYSTATE=1

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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
