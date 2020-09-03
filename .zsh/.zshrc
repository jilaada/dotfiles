# Set shell options
setopt nomatch
setopt prompt_subst
setopt extended_history
setopt append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Unset shell options
unsetopt autocd
unsetopt beep

# Load prompt settings
typeset -U FPATH fpath
fpath=("$ZDOTDIR/functions" "$fpath[@]")
export FPATH
autoload -Uz promptinit
promptinit
prompt jilada

# Aliases
alias ls='ls --color=auto -N'
alias gs='git status'
alias gl='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset %<(50,trunc)%s'\'' --all'
alias gvl='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %Cgreen%aD%Creset%n''          %C(bold blue)<%an>%Creset %<(80,trunc)%s'\'' --all'
alias weather='curl http://wttr.in/'

# History
HISTFILE=${ZDOTDIR}/.zsh_hist
HISTSIZE=5000
SAVEHIST=${HISTSIZE}
export HISTSIZE SAVEHIST HISTFILE

# Editor
export EDITOR="nano"
export VISUAL="$EDITOR"
bindkey -e
export KEYTIMEOUT=1

# Keybinding
bindkey ";5C" forward-word
bindkey ";5D" backward-word

# Autocompletion
autoload -Uz compinit                                                                                                        
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Display WSL
export DISPLAY="$(/sbin/ip route | awk '/default/ { print $3 }'):0"
# Comment below if using WSL2 and XServer
export DISPLAY=:1

# TMUX colour profile
export TERM=xterm-256color
