#!/usr/bin/env bash

source "$SCRIPTS_DIR/git-utils.sh"

REPOS=(
    "$HOME/neorg"
)

handle_repos ${REPOS[@]}
