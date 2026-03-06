#!/bin/bash
#
# quick_setup.sh — Ubuntu (tcsh/csh) environment bootstrap
# Replaces ~/.cshrc and ~/.vimrc with the managed templates from this repo.
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"

# ---------- OS check ----------
if [[ ! -f /etc/os-release ]]; then
    echo "[ERROR] Cannot find /etc/os-release. Is this a Linux system?"
    exit 1
fi

. /etc/os-release

if [[ "$ID" != "ubuntu" ]]; then
    echo "[ERROR] This script is intended for Ubuntu only."
    echo "        Detected: $PRETTY_NAME"
    exit 1
fi

echo "=== Ubuntu Quick Setup ==="
echo "Detected: $PRETTY_NAME"
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

# ---------- cshrc ----------
echo "[1/2] Setting up ~/.cshrc ..."
backup_and_copy "$SCRIPT_DIR/cshrc_template" "$HOME/.cshrc" "~/.cshrc"
echo ""

# ---------- vimrc ----------
echo "[2/2] Setting up ~/.vimrc ..."
backup_and_copy "$REPO_ROOT/vimrc_template" "$HOME/.vimrc" "~/.vimrc"
echo ""

echo "=== Done! ==="
echo "Run 'source ~/.cshrc' to reload your shell configuration."
