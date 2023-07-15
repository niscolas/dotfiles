source "$SCRIPTS_DIR/load_zi.sh"
source "$SCRIPTS_DIR/export_nvim_exec.sh"

eval "$(zoxide init zsh)"

export SUDO_EDITOR="nvim"

## aliases
alias b="buku --suggest"
alias bo="buku_open.sh"
alias cargo="RUSTC_WRAPPER=sccache cargo"
alias cat="bat"
alias cd="z"
alias clip="xclip -selection clipboard"
alias dot="git --git-dir=$HOME/bonfire/dotfiles --work-tree=$HOME"
alias ext="extract_file.sh"
alias g="git"
alias nvim="$NVIM_EXEC"
alias n="nvim"
alias r=". ranger"
alias wget="wget --hsts-file='$XDG_DATA_HOME/wget-hsts'"
alias x="xplr"
# exa
exa_default="exa -a --group-directories-first --icons --color always"
alias l="$exa_default -1"
alias ls="$exa_default"
alias ld="$exa_default -aghHl@"
alias lt="$exa_default -T"

alias nixaudiorelay="NIXPKGS_ALLOW_UNFREE=1 nix run github:JamesReynolds/audiorelay-flake --impure"
alias nixr="sudo nixos-rebuild switch --flake /etc/nixos#izalith"

## settings
# https://stackoverflow.com/a/24237590/16589245
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

bindkey -v

source "$SCRIPTS_DIR/load_starship.sh"
source "$SCRIPTS_DIR/sdkman.sh"
source "$SCRIPTS_DIR/unreal.sh"

source /home/niscolas/.config/broot/launcher/bash/br
