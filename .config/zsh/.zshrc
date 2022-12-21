source load_zi.sh

eval "$(zoxide init zsh)"

## aliases
alias b="buku --suggest"
alias bo="$scripts_dir/buku_open.sh"
alias cat="bat"
alias cd="z"
alias clip="xclip -selection clipboard"
alias dot="git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias ext="$scripts_dir/buku_open.sh"
alias g="git"
alias l="exa -aghHl@ --group-directories-first --icons --color always"
alias lt="l -T"
alias nvim="$NVIM_EXEC"
alias n="nvim --startuptime /tmp/nvim-startuptime"
alias r=". ranger"
alias x="xplr"

## settings
# https://stackoverflow.com/a/24237590/16589245
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

bindkey -v

source load_starship.sh
source sdkman.sh
