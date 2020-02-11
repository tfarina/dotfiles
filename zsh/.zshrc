# https://github.com/baskerville/etc/blob/master/zsh/.zshrc
# https://github.com/addy-dclxvi/almighty-dotfiles/blob/master/.oh-my-zsh/themes/clair.zsh-theme
# https://blog.ysmood.org/my-ys-terminal-theme/

. ~/.zsh_environment
. ~/.zsh_aliases
. ~/.zsh_functions
. ~/.git-prompt.sh

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

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

unsetopt share_history

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# Turn on and configure the version control system information
autoload -Uz vcs_info

precmd() {
  vcs_info
}

zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%u%c|%s:%b'
zstyle ':vcs_info:*' actionformats '%c%u|%s@%a:%b'
zstyle ':vcs_info:*' branchformat '%b@%r'
zstyle ':vcs_info:*' unstagedstr "%{$fg_no_bold[red]%}"
zstyle ':vcs_info:*' stagedstr "%{$fg_no_bold[yellow]%}"
zstyle ':vcs_info:*' enable git hg

# vcs-specific formatting...
#zstyle ':vcs_info:hg*:*' hgrevformat "%r"
#zstyle ':vcs_info:fossil:*' fsrevformat '%.5h'
# Silly git doesn't honor branchformat
zstyle ':vcs_info:git*:*' formats '%c%u%s:%b:%.5i'
zstyle ':vcs_info:git*:*' actionformats '%c%u%s@%a:%b@%.5i'

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

%{$fg[red]%}%# %{$reset_color%}'
#%{$fg[red]%}❯ %{$reset_color%}'
