#!/usr/bin/env bash
#obtained from: https://github.com/kovidgoyal/kitty/issues/1303#issuecomment-1311202869

fzf --with-nth 2.. --bind 'enter:execute-silent(kitty @ focus-tab -m id:{1})+accept' > /dev/null \
    <<<$(kitty @ ls | jq -r '.[] | .tabs[] | select(.is_focused == false) | (.id|tostring) + " " + .title')
