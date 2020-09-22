# https://github.com/baskerville/etc/blob/master/zsh/.zshrc
# https://github.com/addy-dclxvi/almighty-dotfiles/blob/master/.oh-my-zsh/themes/clair.zsh-theme
# https://blog.ysmood.org/my-ys-terminal-theme/

setopt no_verbose

# https://github.com/ggreer/dotfiles/blob/master/home/.zshrc

#
# Specify which file to use to store the history.
#
HISTFILE="$HOME/.zsh_history"

#
# Set the maximum size of .zsh_history.
#
HISTSIZE=1000000

#
# Same as above
#
SAVEHIST=1000000

setopt extended_history
setopt inc_append_history
setopt hist_ignore_dups

unsetopt share_history

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

autoload -U colors && colors

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if ls --color=auto &> /dev/null
then
    # GNU ls
    alias ls='ls -F --color=auto'
else
    # BSD ls
    alias ls='ls -GF'
fi

if [ -f ~/.zsh_environment ]; then
    . ~/.zsh_environment
fi

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

if [ -f ~/.zsh_functions ]; then
    . ~/.zsh_functions
fi

if [ -f ~/.zsh_prompt ]; then
    . ~/.zsh_prompt
fi
