#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

CONFIGS=(
    btop
    ghostty
    neofetch
    nvim
    tmux
    yazi
)

link() {
    local src="$1" dst="$2"

    if [ -L "$dst" ]; then
        local current
        current="$(readlink "$dst")"
        if [ "$current" = "$src" ]; then
            echo "  skip  $dst (already linked)"
            return
        fi
        echo "  relink $dst -> $src (was $current)"
        rm "$dst"
    elif [ -e "$dst" ]; then
        echo "  backup $dst -> ${dst}.bak"
        mv "$dst" "${dst}.bak"
    else
        echo "  link   $dst -> $src"
    fi

    ln -s "$src" "$dst"
}

echo "Dotfiles: $DOTFILES"
echo

mkdir -p "$CONFIG_DIR"

echo "Linking ~/.config entries..."
for name in "${CONFIGS[@]}"; do
    link "$DOTFILES/$name" "$CONFIG_DIR/$name"
done

echo
echo "Linking zsh config..."
link "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
mkdir -p "$CONFIG_DIR/zsh"
link "$DOTFILES/zsh/aliases.zsh" "$CONFIG_DIR/zsh/aliases.zsh"

echo
echo "Done. You may need to restart your shell or run: source ~/.zshrc"
