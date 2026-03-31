#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOCAL="$HOME/.local"
BIN="$LOCAL/bin"
LIB="$LOCAL/lib"
PIXI_HOME="$HOME/.pixi"

TMPDIR=""
FORCE=0

# shellcheck source=zsh/log.sh
source "$SCRIPT_DIR/zsh/log.sh"

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Install CLI tools locally for HPC environments (no root required).
Downloads prebuilt x86_64 Linux binaries and links dotfiles configs.

Options:
    --force     Re-download and reinstall all tools
    -h, --help  Show this message
EOF
}

for arg in "$@"; do
    case "$arg" in
        --force)    FORCE=1 ;;
        -h|--help)  usage; exit 0 ;;
        *)          log_err "Unknown option: $arg"; usage; exit 1 ;;
    esac
done

cleanup() { [[ -n "${TMPDIR:-}" && -d "${TMPDIR:-}" ]] && rm -rf "$TMPDIR"; }
trap cleanup EXIT

need_cmd() {
    command -v "$1" &>/dev/null || { log_err "Required command not found: $1"; exit 1; }
}

installed() { [[ "$FORCE" -eq 0 && -x "$1" ]]; }

gh_latest_version() {
    curl -fsSL "https://api.github.com/repos/$1/releases/latest" \
        | grep '"tag_name"' | head -1 | sed -E 's/.*"v?([^"]+)".*/\1/'
}

# ── Prerequisites ─────────────────────────────────────────────────────────────

log_section "Checking prerequisites"
need_cmd curl
need_cmd tar
need_cmd unzip
log_ok "curl, tar, unzip available"

mkdir -p "$BIN" "$LIB"
TMPDIR="$(mktemp -d)"

# ── Tool installers ───────────────────────────────────────────────────────────

echo
log_section "Installing tools"

install_neovim() {
    if installed "$BIN/nvim"; then log_ok "skip nvim (already installed)"; return; fi
    log_step "Neovim"
    local url="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
    curl -fsSL "$url" -o "$TMPDIR/nvim.tar.gz"
    tar -xzf "$TMPDIR/nvim.tar.gz" -C "$TMPDIR"
    rm -rf "$LIB/nvim"
    mv "$TMPDIR/nvim-linux-x86_64" "$LIB/nvim"
    ln -sf "$LIB/nvim/bin/nvim" "$BIN/nvim"
    log_ok "nvim installed"
}

install_btop() {
    if installed "$BIN/btop"; then log_ok "skip btop (already installed)"; return; fi
    log_step "btop"
    local url="https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-unknown-linux-musl.tbz"
    curl -fsSL "$url" -o "$TMPDIR/btop.tbz"
    tar -xjf "$TMPDIR/btop.tbz" -C "$TMPDIR"
    install -m 755 "$TMPDIR/btop/bin/btop" "$BIN/btop"
    log_ok "btop installed"
}

install_yazi() {
    if installed "$BIN/yazi"; then log_ok "skip yazi (already installed)"; return; fi
    log_step "Yazi"
    local url="https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-musl.zip"
    curl -fsSL "$url" -o "$TMPDIR/yazi.zip"
    unzip -qo "$TMPDIR/yazi.zip" -d "$TMPDIR"
    install -m 755 "$TMPDIR/yazi-x86_64-unknown-linux-musl/yazi" "$BIN/yazi"
    install -m 755 "$TMPDIR/yazi-x86_64-unknown-linux-musl/ya"   "$BIN/ya"
    log_ok "yazi installed"
}

install_fastfetch() {
    if installed "$BIN/fastfetch"; then log_ok "skip fastfetch (already installed)"; return; fi
    log_step "Fastfetch"
    local url="https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.tar.gz"
    curl -fsSL "$url" -o "$TMPDIR/fastfetch.tar.gz"
    tar -xzf "$TMPDIR/fastfetch.tar.gz" -C "$TMPDIR"
    install -m 755 "$TMPDIR/fastfetch-linux-amd64/usr/bin/fastfetch" "$BIN/fastfetch"
    log_ok "fastfetch installed"
}

install_lazygit() {
    if installed "$BIN/lazygit"; then log_ok "skip lazygit (already installed)"; return; fi
    log_step "lazygit"
    local version
    version="$(gh_latest_version jesseduffield/lazygit)"
    local url="https://github.com/jesseduffield/lazygit/releases/download/v${version}/lazygit_${version}_Linux_x86_64.tar.gz"
    curl -fsSL "$url" -o "$TMPDIR/lazygit.tar.gz"
    tar -xzf "$TMPDIR/lazygit.tar.gz" -C "$TMPDIR"
    install -m 755 "$TMPDIR/lazygit" "$BIN/lazygit"
    log_ok "lazygit installed"
}

install_dua() {
    if installed "$BIN/dua"; then log_ok "skip dua (already installed)"; return; fi
    log_step "dua"
    local version
    version="$(gh_latest_version Byron/dua-cli)"
    local url="https://github.com/Byron/dua-cli/releases/download/v${version}/dua-v${version}-x86_64-unknown-linux-musl.tar.gz"
    curl -fsSL "$url" -o "$TMPDIR/dua.tar.gz"
    tar -xzf "$TMPDIR/dua.tar.gz" -C "$TMPDIR"
    install -m 755 "$TMPDIR/dua-v${version}-x86_64-unknown-linux-musl/dua" "$BIN/dua"
    log_ok "dua installed"
}

install_pixi() {
    if installed "$PIXI_HOME/bin/pixi"; then log_ok "skip pixi (already installed)"; return; fi
    log_step "pixi"
    curl -fsSL https://pixi.sh/install.sh -o "$TMPDIR/pixi-install.sh"
    PIXI_NO_PATH_UPDATE=1 bash "$TMPDIR/pixi-install.sh"
    log_ok "pixi installed"
}

install_tmux() {
    if installed "$PIXI_HOME/bin/tmux"; then log_ok "skip tmux (already installed)"; return; fi
    log_step "tmux (via pixi)"
    local pixi_bin="$PIXI_HOME/bin/pixi"
    if [[ ! -x "$pixi_bin" ]]; then
        log_err "pixi not found at $pixi_bin — cannot install tmux"
        return 1
    fi
    "$pixi_bin" global install tmux
    log_ok "tmux installed"
}

install_sdkman() {
    local sdkman_dir="$HOME/.sdkman"
    if [[ "$FORCE" -eq 0 && -s "$sdkman_dir/bin/sdkman-init.sh" ]]; then
        log_ok "skip sdkman (already installed)"; return
    fi
    log_step "SDKMAN"
    curl -fsSL "https://get.sdkman.io?rcupdate=false" -o "$TMPDIR/sdkman-install.sh"
    SDKMAN_DIR="$sdkman_dir" bash "$TMPDIR/sdkman-install.sh"
    log_ok "sdkman installed"
}

install_neovim
install_btop
install_yazi
install_fastfetch
install_lazygit
install_dua

echo
log_section "Installing pixi + tmux"
install_pixi
install_tmux

echo
log_section "Installing SDKMAN"
install_sdkman

# ── Dotfiles ──────────────────────────────────────────────────────────────────

echo
log_section "Linking dotfiles"
"$SCRIPT_DIR/setup.sh"

# ── Bash config ───────────────────────────────────────────────────────────────

echo
log_section "Linking bash config"

BASHRC_SRC="$SCRIPT_DIR/bash/.bashrc"
BASHRC_DST="$HOME/.bashrc"

if [ -L "$BASHRC_DST" ] && [ "$(readlink "$BASHRC_DST")" = "$BASHRC_SRC" ]; then
    log_ok "skip ~/.bashrc (already linked)"
elif [ -e "$BASHRC_DST" ]; then
    log_step "backup ~/.bashrc → ~/.bashrc.bak"
    mv "$BASHRC_DST" "${BASHRC_DST}.bak"
    ln -s "$BASHRC_SRC" "$BASHRC_DST"
    log_ok "linked ~/.bashrc"
else
    ln -s "$BASHRC_SRC" "$BASHRC_DST"
    log_ok "linked ~/.bashrc"
fi

echo
log_ok "Done. Restart your shell or run: source ~/.bashrc"
