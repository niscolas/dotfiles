#!/usr/bin/env bash

source "$HOME/scripts/git-utils.sh"

REPOS=(
  "$HOME/neorg"
  "$HOME/buku-bookmarks"
  "$HOME/_vault/logseq"
)

handle_repos ${REPOS[@]}

