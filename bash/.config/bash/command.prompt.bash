# -*- mode: sh; -*-

if [ -f ~/.config/bash/git.prompt.bash ]; then
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    . ~/.config/bash/git.prompt.bash
fi

COLOR_PREFIX="\[\033["
COLOR_SUFFIX="m\]"

RESET="${COLOR_PREFIX}00${COLOR_SUFFIX}"
BLACK="${COLOR_PREFIX}0;30${COLOR_SUFFIX}"
RED="${COLOR_PREFIX}0;31${COLOR_SUFFIX}"
GREEN="${COLOR_PREFIX}0;32${COLOR_SUFFIX}"
YELLOW="${COLOR_PREFIX}0;33${COLOR_SUFFIX}"
BLUE="${COLOR_PREFIX}0;34${COLOR_SUFFIX}"
MAGENTA="${COLOR_PREFIX}0;35${COLOR_SUFFIX}"
CYAN="${COLOR_PREFIX}0;36${COLOR_SUFFIX}"
WHITE="${COLOR_PREFIX}0;37${COLOR_SUFFIX}"
BRIGHTBLACK="${COLOR_PREFIX}0;90${COLOR_SUFFIX}"
BRIGHTRED="${COLOR_PREFIX}0;91${COLOR_SUFFIX}"
BRIGHTGREEN="${COLOR_PREFIX}0;92${COLOR_SUFFIX}"
BRIGHTYELLOW="${COLOR_PREFIX}0;93${COLOR_SUFFIX}"
BRIGHTBLUE="${COLOR_PREFIX}0;94${COLOR_SUFFIX}"
BRIGHTMAGENTA="${COLOR_PREFIX}0;95${COLOR_SUFFIX}"
BRIGHTCYAN="${COLOR_PREFIX}0;96${COLOR_SUFFIX}"
BRIGHTWHITE="${COLOR_PREFIX}0;97${COLOR_SUFFIX}"

BP_START="[";
BP_END="]";

# DO NOT USE '>' AS PROMPT SYMBOL! DO NOT CHANGE IT BACK TO '>'!
# In Bash shell, '>' is a redirection operator.
# If the PS1 Command Prompt is copy/pasted by accident it can cause a
# redirection and get a file truncated to zero bytes! So, be careful
# and do not use '>' as a prompt symbol in UNIX systems.
PROMPT_SYMBOL="$"

PS1_USERNAME="\u"
BP_USER="${GREEN}${PS1_USERNAME}${RESET}"

# Only display the hostname for an ssh connection
if [ -n "${SSH_CONNECTION}" ] || [ -n "${SSH_CLIENT}" ] || [ -n "${SSH_TTY}" ]; then
    PS1_HOSTNAME="@\h"
else
    PS1_HOSTNAME=""
fi

PS1_HOSTNAME="@\h"
BP_HOST="${GREEN}${PS1_HOSTNAME}${RESET} "

PS1_PWD="\W";
BP_PWD="${BLUE}${PS1_PWD}${RESET}"

PS1_VCS="\$(__git_ps1)";
BP_VCS="${YELLOW}${PS1_VCS}${RESET}";

# DO NOT REMOVE THE TRAILING WHITESPACE! THIS IS THE STANDARD PROMPT.
BP_PROMPT_SYMBOL="\${PROMPT_SYMBOL} ";

# Check if we want a fancy prompt (with color). Why? Because
# the linux terminal in tty1 (up to tty6) has a black background.
# Why is that an issue? It is an issue because I set the color of
# the working path to black, and thus there it becomes invisible.
# To fix that we should check this $TERM variable, and make a PS1
# variable without colors.
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

#
# Prompt format:
#
# [USER@HOST DIRECTORY (GIT BRANCH)]$ COMMAND
#
if [ "$color_prompt" = yes ]; then
PS1="${BP_START}";
PS1+="${BP_USER}";             # username
PS1+="${BP_HOST}";             # @hostname
PS1+="${BP_PWD}";              # basename of current working directory
PS1+="${BP_VCS}";              # git branch status
PS1+="${BP_END}";
PS1+="${BP_PROMPT_SYMBOL}";
else
# DO NOT BREAK THIS INTO MULTIPLE LINES.
PS1="[\u@\h \W\$(__git_ps1)]\${PROMPT_SYMBOL} ";
fi
