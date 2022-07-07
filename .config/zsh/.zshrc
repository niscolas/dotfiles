source "$ZI_HOME/bin/zi.zsh"

zi ice wait
zi load "zsh-users/zsh-autosuggestions"
zi load "zsh-users/zsh-syntax-highlighting"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

## exports
FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules,**/*.meta}/*" 2> /dev/null'
HISTFILE=~/.zshhistory
HISTSIZE=1000
SAVEHIST=1000

## aliases
alias cat="bat"
alias cd="z"
alias clip="xclip -selection clipboard"
alias l="exa -aghHl@ --group-directories-first --icons --color always"
alias lt="l -T"
alias n="nvim --startuptime /tmp/nvim-startuptime"
alias r=". ranger"
alias x="xplr"
alias dot="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

## settings
# https://stackoverflow.com/a/24237590/16589245
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

bindkey -v

### ctrl+arrows
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
# urxvt
bindkey "\eOc" forward-word
bindkey "\eOd" backward-word

### ctrl+delete
bindkey "\e[3;5~" kill-word
# urxvt
bindkey "\e[3^" kill-word

### ctrl+backspace
bindkey '^H' backward-kill-word

### ctrl+shift+delete
bindkey "\e[3;6~" kill-line
# urxvt
bindkey "\e[3@" kill-line

