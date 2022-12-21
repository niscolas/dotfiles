#/bin/bash

count_repo_changes () {
    git -C $1 status --porcelain | wc -l
}

check_repo_has_changes() {
    local change_count=$(count_repo_changes $1)
    echo $change_count != 0
}

add_files() {
    git -C $1 add -A
}

get_time() {
    date +"%d-%m-%Y %T"
}

commit() {
    git -C "$1" commit -m "$2"
}

push() {
    git -C $1 push
}

pull() {
    git -C $1 pull
}

handle_repos() {
  repo_arr=("${@}")
  for repo in ${repo_arr[@]}; do
      repo_has_changes=$(check_repo_has_changes $repo)

      pull $repo

      if [ $repo_has_changes ]; then
          time=$(get_time)
          add_files $repo
          commit "$repo" "Auto Save ($time)"
          push $repo
      else
          echo "No Modifications Found on Repo, aborting Auto Save"
      fi
  done
}

