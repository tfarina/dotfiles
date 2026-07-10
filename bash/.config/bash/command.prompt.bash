# -*- mode: sh; -*-

if [ -f ~/.config/bash/git.prompt.bash ]; then
    GIT_PS1_SHOWDIRTYSTATE=
    GIT_PS1_SHOWUNTRACKEDFILES=
    . ~/.config/bash/git.prompt.bash
fi

# Bash PS1 markers for non-printing sequences.
PS1_NONPRINT_BEGIN="\["
PS1_NONPRINT_END="\]"

# ANSI Control Sequence Introducer.
CSI="\033["

# ANSI Select Graphic Rendition (SGR) sequence components.
SGR_PREFIX="${PS1_NONPRINT_BEGIN}${CSI}"
SGR_SUFFIX="m${PS1_NONPRINT_END}"

RESET="${SGR_PREFIX}0${SGR_SUFFIX}"
BLACK="${SGR_PREFIX}0;30${SGR_SUFFIX}"
RED="${SGR_PREFIX}0;31${SGR_SUFFIX}"
GREEN="${SGR_PREFIX}0;32${SGR_SUFFIX}"
YELLOW="${SGR_PREFIX}0;33${SGR_SUFFIX}"
BLUE="${SGR_PREFIX}0;34${SGR_SUFFIX}"
MAGENTA="${SGR_PREFIX}0;35${SGR_SUFFIX}"
CYAN="${SGR_PREFIX}0;36${SGR_SUFFIX}"
WHITE="${SGR_PREFIX}0;37${SGR_SUFFIX}"
BRIGHTBLACK="${SGR_PREFIX}0;90${SGR_SUFFIX}"
BRIGHTRED="${SGR_PREFIX}0;91${SGR_SUFFIX}"
BRIGHTGREEN="${SGR_PREFIX}0;92${SGR_SUFFIX}"
BRIGHTYELLOW="${SGR_PREFIX}0;93${SGR_SUFFIX}"
BRIGHTBLUE="${SGR_PREFIX}0;94${SGR_SUFFIX}"
BRIGHTMAGENTA="${SGR_PREFIX}0;95${SGR_SUFFIX}"
BRIGHTCYAN="${SGR_PREFIX}0;96${SGR_SUFFIX}"
BRIGHTWHITE="${SGR_PREFIX}0;97${SGR_SUFFIX}"

BP_START="[";
BP_END="]";

# DO NOT USE '>' AS PROMPT SYMBOL! DO NOT CHANGE IT BACK TO '>'!
# In Bash shell, '>' is a redirection operator.
# If the PS1 Command Prompt is copy/pasted by accident it can cause a
# redirection and get a file truncated to zero bytes! So, be careful
# and do not use '>' as a prompt symbol in UNIX systems.
PROMPT_SYMBOL="$"

# The username of the current user.
PS1_USERNAME="\u"
BP_USER="${GREEN}${PS1_USERNAME}${RESET}"

# Only display the hostname for an ssh connection
if [ -n "${SSH_CONNECTION}" ] || [ -n "${SSH_CLIENT}" ] || [ -n "${SSH_TTY}" ]; then
    PS1_HOSTNAME="@\h"
else
    PS1_HOSTNAME=""
fi

# The hostname, up to the first ‘.’.
PS1_HOSTNAME="@\h"
BP_HOST="${GREEN}${PS1_HOSTNAME}${RESET} "

# The basename of $PWD, with $HOME abbreviated with a tilde.
PS1_PWD="\W";
BP_PWD="${BLUE}${PS1_PWD}${RESET}"

# The current branch and status of a git repository.
PS1_VCS="\$(__git_ps1)";
BP_VCS="${YELLOW}${PS1_VCS}${RESET}";

# DO NOT REMOVE THE TRAILING WHITESPACE! THIS IS THE STANDARD PROMPT.
BP_PROMPT_SYMBOL="\\${PROMPT_SYMBOL} ";

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
PS1="${BP_START}${BP_USER}${BP_HOST}${BP_PWD}${BP_VCS}${BP_END}${BP_PROMPT_SYMBOL}";
else
# DO NOT BREAK THIS INTO MULTIPLE LINES.
PS1="[\u@\h \W\$(__git_ps1)]\\${PROMPT_SYMBOL} ";
fi
