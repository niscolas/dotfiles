scripts_dir="$HOME/scripts"

source "$ZI_HOME/bin/zi.zsh"

run_script () {
    source "$scripts_dir/$1"
}

run_script "fetch_os_name.sh"
run_script "fetch_nvim_exec.sh"

zi ice wait
zi load "zsh-users/zsh-autosuggestions"
zi load "zsh-users/zsh-syntax-highlighting"

eval "$(zoxide init zsh)"

## aliases
alias b="buku --suggest"
alias bo="$XDG_CONFIG_HOME/zsh/scripts/buku-open.sh"
alias cat="bat"
alias cd="z"
alias clip="xclip -selection clipboard"
alias dot="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias ext="~/.config/zsh/scripts/extract-file.sh"
alias l="exa -aghHl@ --group-directories-first --icons --color always"
alias lt="l -T"
alias nvim="$nvim_exec"
alias n="nvim --startuptime /tmp/nvim-startuptime"
alias r=". ranger"
alias x="xplr"

## settings
# https://stackoverflow.com/a/24237590/16589245
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

bindkey -v

run_script "load_starship.sh"
run_script "sdkman.sh"
