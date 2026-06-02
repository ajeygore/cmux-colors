#!/usr/bin/env bash
set -euo pipefail

SCRIPT_NAME="cmux-colors"
RAW_URL="https://raw.githubusercontent.com/ajeygore/cmux-colors/main/cmux-colors"

# Prefer ~/bin, then ~/.local/bin, then ~/.yadr/bin (yadr users)
pick_install_dir() {
  for dir in "$HOME/bin" "$HOME/.local/bin" "$HOME/.yadr/bin"; do
    if [[ -d "$dir" ]]; then
      echo "$dir"
      return
    fi
  done
  # Fall back to ~/.local/bin and create it
  echo "$HOME/.local/bin"
}

INSTALL_DIR="$(pick_install_dir)"
DEST="$INSTALL_DIR/$SCRIPT_NAME"

echo "cmux-colors installer"
echo "─────────────────────"

# Ensure Python 3 is available
if ! command -v python3 &>/dev/null; then
  echo "✗  python3 not found. Please install Python 3 and try again."
  exit 1
fi

# Ensure cmux is installed
if [[ ! -x "/Applications/cmux.app/Contents/Resources/bin/cmux" ]]; then
  echo "✗  cmux not found at /Applications/cmux.app — is cmux installed?"
  exit 1
fi

mkdir -p "$INSTALL_DIR"

echo "  Downloading to $DEST …"
if command -v curl &>/dev/null; then
  curl -fsSL "$RAW_URL" -o "$DEST"
elif command -v wget &>/dev/null; then
  wget -qO "$DEST" "$RAW_URL"
else
  echo "✗  Neither curl nor wget found."
  exit 1
fi

chmod +x "$DEST"

# Warn if install dir is not in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo ""
  echo "  ⚠  $INSTALL_DIR is not in your PATH."
  echo "     Add this to your shell config:"
  echo "       export PATH=\"\$PATH:$INSTALL_DIR\""
fi

echo ""
echo "  ✓  Installed. Run: cmux-colors"
