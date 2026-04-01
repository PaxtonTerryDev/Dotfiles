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
BASE_BRANCH=${2:-"$(git rev-parse --abbrev-ref HEAD)"}
REPOSITORY=$(basename "$(git rev-parse --show-toplevel)")
REPOSITORY_PATH="$HOME/.worktrees/$REPOSITORY"
WT_PATH="$REPOSITORY_PATH/$WT_BRANCH_NAME"
ENV_SOURCE="$(git rev-parse --show-toplevel)/.env"

log() { echo "[info] $*"; }
verbose() { $VERBOSE && echo "[verbose] $*"; }

if [[ -z "$WT_BRANCH_NAME" ]]; then
  echo "Usage: $0 [-v|--verbose] <branch-name> [base-branch]"
  exit 1
fi

verbose "Repository:    $REPOSITORY"
verbose "Branch:        $WT_BRANCH_NAME"
verbose "Base branch:   $BASE_BRANCH"
verbose "Worktree path: $WT_PATH"
verbose "Env source:    $ENV_SOURCE"

log "Creating directory: $REPOSITORY_PATH"
mkdir -p "$REPOSITORY_PATH"

log "Adding worktree '$WT_BRANCH_NAME' based on '$BASE_BRANCH'..."
if git worktree add -b "$WT_BRANCH_NAME" "$WT_PATH" "$BASE_BRANCH"; then
  log "Worktree created successfully at $WT_PATH"
else
  echo "[error] Failed to create worktree."
  exit 1
fi

if [[ -f "$ENV_SOURCE" ]]; then
  log "Copying .env to worktree..."
  cp "$ENV_SOURCE" "$WT_PATH/.env"
  verbose "Copied $ENV_SOURCE -> $WT_PATH/.env"
else
  echo "[warn] No .env found at $ENV_SOURCE, skipping."
fi

cd $WT_PATH
