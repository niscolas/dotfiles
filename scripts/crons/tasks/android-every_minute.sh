#!/bin/bash

source "$HOME/scripts/git-utils.sh"

REPOS=(
    "$HOME/neorg"
)

handle_repos ${REPOS[@]}
