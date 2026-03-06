#!/bin/bash
#
# quick_setup.sh — macOS (zsh + oh-my-zsh) environment bootstrap
# Replaces ~/.zshrc and ~/.vimrc with the managed templates from this repo.
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"

# ---------- OS check ----------
if [[ "$(uname)" != "Darwin" ]]; then
    echo "[ERROR] This script is intended for macOS only."
    echo "        Detected OS: $(uname)"
    exit 1
fi

echo "=== macOS Quick Setup ==="
echo "Detected: macOS $(sw_vers -productVersion)"
echo ""

# ---------- helper ----------
backup_and_copy() {
    local src="$1"
    local dst="$2"
    local label="$3"

    if [[ ! -f "$src" ]]; then
        echo "[ERROR] Template not found: $src"
        return 1
    fi

    if [[ -f "$dst" ]]; then
        local bak="${dst}.bak_${TIMESTAMP}"
        cp "$dst" "$bak"
        echo "  Backed up existing $label -> $bak"
    fi

    cp "$src" "$dst"
    echo "  Installed $label <- $src"
}

# ---------- zshrc ----------
echo "[1/2] Setting up ~/.zshrc ..."
backup_and_copy "$SCRIPT_DIR/zshrc_template" "$HOME/.zshrc" "~/.zshrc"
echo ""

# ---------- vimrc ----------
echo "[2/2] Setting up ~/.vimrc ..."
backup_and_copy "$REPO_ROOT/vimrc_template" "$HOME/.vimrc" "~/.vimrc"
echo ""

echo "=== Done! ==="
echo "Run 'source ~/.zshrc' to reload your shell configuration."
