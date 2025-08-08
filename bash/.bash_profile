# ~/.bash_profile: user-specific profile for bash login shells
#
# This file is sourced only for login shells (i.e. shells invoked with "-"
# as the first character of argv[0], and shells invoked with the -l flag.),
# such as when logging in via TTY, SSH, or using 'bash --login'. It is not
# used for interactive non-login shells (like urxvt or most terminal
# emulators).
#
# Load order for Bash login shells:
#   1. /etc/profile
#   2. ~/.bash_profile (this file)
#      or ~/.bash_login
#      or ~/.profile (only if the above two are missing)

# Load shared environment settings (optional)
[ -f "$HOME/.config/shell/env.sh" ] && source "$HOME/.config/shell/env.sh"

# Load interactive Bash config (aliases, prompt, etc.)
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
