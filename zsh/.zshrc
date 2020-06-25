# https://github.com/baskerville/etc/blob/master/zsh/.zshrc
# https://github.com/addy-dclxvi/almighty-dotfiles/blob/master/.oh-my-zsh/themes/clair.zsh-theme
# https://blog.ysmood.org/my-ys-terminal-theme/

# Alias definitions.
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

if [ -f ~/.zsh_environment ]; then
    . ~/.zsh_environment
fi

if [ -f ~/.zsh_functions ]; then
    . ~/.zsh_functions
fi

setopt no_verbose

autoload -U colors && colors

# https://michaelheap.com/getting-solarized-working-on-ubuntu/
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

setopt prompt_subst

#
# Prompt format:
#
# USER at MACHINE in DIRECTORY on git:BRANCH
# $ COMMAND
#
PROMPT='
%{$fg[cyan]%}%n \
%{$fg[white]%}at \
%{$fg[green]%}%m \
%{$fg[white]%}in \
%{$fg[blue]%}%~%{$reset_color%} \
%{$fg[white]%}on%{$reset_color%} \
${vcs_info_msg_0_}\

%{$fg_bold[white]%}%# %{$reset_color%}'

fpath+=$HOME/.zsh/pure

autoload -U promptinit; promptinit

#PURE_PROMPT_SYMBOL="$"

# change the color for `prompt:success`
zstyle ':prompt:pure:prompt:success' color green

prompt pure
