#!/usr/bin/env bash

source "$SCRIPTS_DIR/git-utils.sh"

REPOS=(
  "$HOME/neorg"
  "$HOME/buku-bookmarks"
)

handle_repos ${REPOS[@]}

