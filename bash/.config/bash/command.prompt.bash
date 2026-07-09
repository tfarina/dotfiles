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

RESET="${PS1_NONPRINT_BEGIN}${CSI}0m${PS1_NONPRINT_END}"
BLACK="${PS1_NONPRINT_BEGIN}${CSI}0;30m${PS1_NONPRINT_END}"
RED="${PS1_NONPRINT_BEGIN}${CSI}0;31m${PS1_NONPRINT_END}"
GREEN="${PS1_NONPRINT_BEGIN}${CSI}0;32m${PS1_NONPRINT_END}"
YELLOW="${PS1_NONPRINT_BEGIN}${CSI}0;33m${PS1_NONPRINT_END}"
BLUE="${PS1_NONPRINT_BEGIN}${CSI}0;34m${PS1_NONPRINT_END}"
MAGENTA="${PS1_NONPRINT_BEGIN}${CSI}0;35m${PS1_NONPRINT_END}"
CYAN="${PS1_NONPRINT_BEGIN}${CSI}0;36m${PS1_NONPRINT_END}"
WHITE="${PS1_NONPRINT_BEGIN}${CSI}0;37m${PS1_NONPRINT_END}"
BRIGHTBLACK="${PS1_NONPRINT_BEGIN}${CSI}0;90m${PS1_NONPRINT_END}"
BRIGHTRED="${PS1_NONPRINT_BEGIN}${CSI}0;91m${PS1_NONPRINT_END}"
BRIGHTGREEN="${PS1_NONPRINT_BEGIN}${CSI}0;92m${PS1_NONPRINT_END}"
BRIGHTYELLOW="${PS1_NONPRINT_BEGIN}${CSI}0;93m${PS1_NONPRINT_END}"
BRIGHTBLUE="${PS1_NONPRINT_BEGIN}${CSI}0;94m${PS1_NONPRINT_END}"
BRIGHTMAGENTA="${PS1_NONPRINT_BEGIN}${CSI}0;95m${PS1_NONPRINT_END}"
BRIGHTCYAN="${PS1_NONPRINT_BEGIN}${CSI}0;96m${PS1_NONPRINT_END}"
BRIGHTWHITE="${PS1_NONPRINT_BEGIN}${CSI}0;97m${PS1_NONPRINT_END}"

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
