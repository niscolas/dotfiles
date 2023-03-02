#!/bin/bash

source "$HOME/scripts/git-utils.sh"

REPOS=(
  "$HOME/neorg"
  "$HOME/buku-bookmarks"
)

handle_repos ${REPOS[@]}

