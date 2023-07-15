#! /usr/bin/env bash

source "$HOME/scripts/git-utils.sh"

REPOS=(
  # "$HOME/bonfire/neorg"
  # "$HOME/bonfire/buku-bookmarks"
  "$HOME/bonfire/logseq"
)

handle_repos ${REPOS[@]}
