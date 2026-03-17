#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

# Load logging helpers (same as zsh uses)
# shellcheck source=zsh/log.sh
source "$DOTFILES/zsh/log.sh"

CONFIGS=(
    btop
    ghostty
    fastfetch
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
            log_ok "skip $dst (already linked)"
            return
        fi
        log_warn "relink $dst → $src (was $current)"
        rm "$dst"
    elif [ -e "$dst" ]; then
        log_step "backup $dst → ${dst}.bak"
        mv "$dst" "${dst}.bak"
    else
        log_step "link $dst → $src"
    fi

    ln -s "$src" "$dst"
}

log_section "Dotfiles: $DOTFILES"
echo

mkdir -p "$CONFIG_DIR"

log_section "Linking ~/.config entries"
for name in "${CONFIGS[@]}"; do
    link "$DOTFILES/$name" "$CONFIG_DIR/$name"
done

echo
log_section "Linking zsh config"
link "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
link "$DOTFILES/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
mkdir -p "$CONFIG_DIR/zsh"
link "$DOTFILES/zsh/aliases.zsh" "$CONFIG_DIR/zsh/aliases.zsh"
link "$DOTFILES/zsh/exports.zsh" "$CONFIG_DIR/zsh/exports.zsh"
link "$DOTFILES/zsh/functions.zsh" "$CONFIG_DIR/zsh/functions.zsh"
link "$DOTFILES/zsh/log.sh" "$CONFIG_DIR/zsh/log.sh"

echo
log_section "Linking scripts to /usr/local/bin"
# May require: sudo ./setup.sh
mkdir -p /usr/local/bin
for script in "$DOTFILES/scripts"/*; do
    [ -f "$script" ] || continue
    name="$(basename "$script")"
    # Strip .sh for cleaner command name (e.g. tlp.sh → tlp)
    bin_name="${name%.sh}"
    link "$script" "/usr/local/bin/$bin_name"
done

echo
log_ok "Done. Restart your shell or run: source ~/.zshrc"
