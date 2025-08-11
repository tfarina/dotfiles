# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    if [ -x /usr/bin/clear_console ] && [ -t 0 ] && [[ $(tty) == /dev/tty* ]]; then
	# On a real Linux console
	/usr/bin/clear_console -q
    else
	# On a terminal emulator (urxvt, xterm, etc.)
	# \033[3J clears scrollback, then \033[H\033[2J clears the screen
	printf '\033[3J\033[H\033[2J'
    fi
fi
