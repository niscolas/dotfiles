#!/bin/bash

source "/home/niscolas/crons/functions.sh"

REPOS=(
  "/home/niscolas/crons" 
  "/home/niscolas/dotfiles" 
  "/home/niscolas/logseq")

handle_repos ${REPOS[@]}

