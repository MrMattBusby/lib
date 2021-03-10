#!/bin/bash

ALL=( ~/lib ~/runcoms ~/bin-tools ~/helpfiles )

function main {
  pushd ~ 1> /dev/null
  for each in ${ALL[@]} ; do
    echo "===================== ${each} ====================="
    pushd ${each} 1> /dev/null
    git $1 ${each}
    popd 1> /dev/null
  done
  popd 1> /dev/null
}

main $1
