# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

### SYSTEM ###
DOTFILES_PATH="$HOME/.config/shell"
ALIASES_PATH="$DOTFILES_PATH/aliases"

export SCRIPTS="$HOME/.scripts"

export PATH="$HOME/.local/bin:$PATH"

shopt -s globstar
for f in "$ALIASES_PATH/**/*"; do
  [ -f "$f" ] && source "$f"
done

### OMARCHY ###
export OMARCHY_RC="$HOME/.local/share/omarchy/default/bash/rc"
[ -f "$OMARCHY_RC" ] && source "$OMARCHY_RC" && unset SDL_VIDEODRIVER

### NVIM ###
set -h
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

### GODOT ###
[ -f "$HOME/.local/bin/godot4" ] && export GODOT4_BIN="$HOME/.local/bin/godot4"
. "$HOME/.config/godotenv/env" # Added by GodotEnv
export PATH="/home/paxton/.gdvm/bin/current_godot:/home/paxton/.gdvm/bin:$PATH"
