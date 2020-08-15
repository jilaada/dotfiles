# Set shell options
setopt nomatch
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt prompt_subst

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
alias git-log='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset %<(50,trunc)%s'\'' --all'
alias git-vlog='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %Cgreen%aD%Creset%n''          %C(bold blue)<%an>%Creset %<(80,trunc)%s'\'' --all'

# History
HISTFILE=${ZDOTDIR}/.zsh_hist
HISTSIZE=5000
SAVEHIST=${HISTSIZE}
export HISTSIZE SAVEHIST HISTFILE

# Editor
export EDITOR="vim"
export VISUAL="$EDITOR"
bindkey -v
export KEYTIMEOUT=1

# Keybinding
## Editor Shortcut
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^e" edit-command-line

##
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
