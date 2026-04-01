#!/bin/bash

VERBOSE=false

while [[ "$1" == -* ]]; do
  case "$1" in
  -v | --verbose)
    VERBOSE=true
    shift
    ;;
  *)
    echo "Unknown flag: $1"
    exit 1
    ;;
  esac
done

WT_BRANCH_NAME=$1
REPOSITORY=$(basename "$(git rev-parse --show-toplevel)")
REPOSITORY_PATH="$HOME/.worktrees/$REPOSITORY"
WT_PATH="$REPOSITORY_PATH/$WT_BRANCH_NAME"

log() { echo "[info] $*"; }
verbose() { $VERBOSE && echo "[verbose] $*"; }

if [[ -z "$WT_BRANCH_NAME" ]]; then
  echo "Usage: $0 [-v|--verbose] <branch-name>"
  exit 1
fi

verbose "Repository:    $REPOSITORY"
verbose "Branch:        $WT_BRANCH_NAME"
verbose "Worktree path: $WT_PATH"

if [[ ! -d "$WT_PATH" ]]; then
  echo "[error] Worktree directory not found: $WT_PATH"
  exit 1
fi

log "Removing worktree '$WT_BRANCH_NAME'..."
if git worktree remove --force "$WT_PATH"; then
  log "Worktree removed successfully."
else
  echo "[error] Failed to remove worktree."
  exit 1
fi

log "Deleting branch '$WT_BRANCH_NAME'..."
if git branch -D "$WT_BRANCH_NAME"; then
  verbose "Branch '$WT_BRANCH_NAME' deleted."
else
  echo "[error] Failed to delete branch '$WT_BRANCH_NAME'."
  exit 1
fi

log "Done."
