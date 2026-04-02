#!/bin/bash

while getopts "cvi" opt; do
  case $opt in
  c) containers=true ;;
  v) volumes=true ;;
  i) images=true ;;
  ?)
    echo "Usage: $0 [-c] [-v] [-i]" >&2
    exit 1
    ;;
  esac
done

if [[ "$containers" == true ]]; then
  docker container prune -f
fi

if [[ "$volumes" == true ]]; then
  docker volume prune -f
fi

if [[ "$images" == true ]]; then
  docker image prune -f
fi
