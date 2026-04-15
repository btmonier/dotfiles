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

# Returns the release tag without a leading "v" (install URLs use "v${version}" elsewhere).
gh_latest_version() {
    local ver
    ver="$(curl -fsSL "https://api.github.com/repos/$1/releases/latest" \
        | sed -n 's/.*"tag_name"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -1 \
        | tr -d '\r')"
    printf '%s\n' "${ver#v}"
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

install_fzf() {
    if installed "$BIN/fzf"; then log_ok "skip fzf (already installed)"; return; fi
    log_step "fzf"
    local version
    version="$(gh_latest_version junegunn/fzf)"
    local url="https://github.com/junegunn/fzf/releases/download/v${version}/fzf-${version}-linux_amd64.tar.gz"
    curl -fsSL "$url" -o "$TMPDIR/fzf.tar.gz"
    tar -xzf "$TMPDIR/fzf.tar.gz" -C "$TMPDIR"
    install -m 755 "$TMPDIR/fzf" "$BIN/fzf"
    log_ok "fzf installed"
}

install_ripgrep() {
    if installed "$BIN/rg"; then log_ok "skip ripgrep (already installed)"; return; fi
    log_step "ripgrep"
    # Resolve the exact asset URL from the API so we never guess tag vs. tarball filename (avoids 404).
    local url
    url="$(curl -fsSL "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" \
        | sed -n 's/.*"browser_download_url"[[:space:]]*:[[:space:]]*"\([^"]*x86_64-unknown-linux-musl\.tar\.gz\)".*/\1/p' | head -1 \
        | tr -d '\r')"
    if [[ -z "$url" ]]; then
        log_err "Could not find ripgrep musl tarball URL (GitHub API error, rate limit, or asset rename)."
        exit 1
    fi
    curl -fsSL "$url" -o "$TMPDIR/ripgrep.tar.gz"
    tar -xzf "$TMPDIR/ripgrep.tar.gz" -C "$TMPDIR"
    local rgpath
    rgpath="$(find "$TMPDIR" -type f -name rg 2>/dev/null | head -1)"
    [[ -n "$rgpath" ]] || { log_err "rg binary not found inside ripgrep archive"; exit 1; }
    install -m 755 "$rgpath" "$BIN/rg"
    log_ok "ripgrep installed"
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
    if installed "$BIN/tmux"; then log_ok "skip tmux (already installed)"; return; fi
    log_step "tmux"
    local version
    version="$(gh_latest_version tmux/tmux-builds)"
    local url="https://github.com/tmux/tmux-builds/releases/download/v${version}/tmux-${version}-linux-x86_64.tar.gz"
    curl -fsSL "$url" -o "$TMPDIR/tmux.tar.gz"
    tar -xzf "$TMPDIR/tmux.tar.gz" -C "$TMPDIR"
    install -m 755 "$TMPDIR/tmux" "$BIN/tmux"
    log_ok "tmux installed"
}

install_tree_sitter() {
    if installed "$BIN/tree-sitter"; then log_ok "skip tree-sitter (already installed)"; return; fi
    log_step "tree-sitter CLI (building from source for glibc compatibility)"
    if ! command -v cargo &>/dev/null && [[ -f "$HOME/.cargo/env" ]]; then
        # shellcheck source=/dev/null
        source "$HOME/.cargo/env"
    fi
    if ! command -v cargo &>/dev/null; then
        log_step "Rust toolchain not found – installing via rustup"
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
            | sh -s -- -y --no-modify-path --default-toolchain stable
        # shellcheck source=/dev/null
        source "$HOME/.cargo/env"
    fi
    cargo install --root "$LOCAL" tree-sitter-cli --no-default-features
    log_ok "tree-sitter installed"
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
install_fzf
install_ripgrep
install_btop
install_yazi
install_fastfetch
install_lazygit
install_dua
install_tmux
install_tree_sitter

echo
log_section "Installing pixi"
install_pixi

echo
log_section "Installing SDKMAN"
install_sdkman

# ── Dotfiles ──────────────────────────────────────────────────────────────────

echo
log_section "Linking dotfiles"
"$SCRIPT_DIR/setup.sh"

# ── BioHPC fastfetch logo ─────────────────────────────────────────────────────

echo
log_section "Setting up BioHPC fastfetch logo"

FF_CONFIG="$HOME/.config/fastfetch"

# setup.sh symlinks the whole fastfetch directory; replace with individual
# links so we can swap the logo without touching the shared config.
[ -L "$FF_CONFIG" ] && rm "$FF_CONFIG"
mkdir -p "$FF_CONFIG"
ln -sf "$SCRIPT_DIR/fastfetch/config.jsonc"     "$FF_CONFIG/config.jsonc"
ln -sf "$SCRIPT_DIR/fastfetch/logo_biohpc.txt"  "$FF_CONFIG/logo.txt"
log_ok "fastfetch configured with BioHPC logo"

# ── Bash config ───────────────────────────────────────────────────────────────

echo
log_section "Linking bash config"

link_file() {
    local src="$1" dst="$2" name="$3"
    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
        log_ok "skip ~/$name (already linked)"
    elif [ -e "$dst" ]; then
        log_step "backup ~/$name → ~/${name}.bak"
        mv "$dst" "${dst}.bak"
        ln -s "$src" "$dst"
        log_ok "linked ~/$name"
    else
        ln -s "$src" "$dst"
        log_ok "linked ~/$name"
    fi
}

link_file "$SCRIPT_DIR/bash/.bash_profile" "$HOME/.bash_profile" ".bash_profile"
link_file "$SCRIPT_DIR/bash/.bashrc"       "$HOME/.bashrc"       ".bashrc"

# ── Suppress system MOTD ──────────────────────────────────────────────────────

echo
log_section "Suppressing system MOTD"

if [ -f "$HOME/.hushlogin" ]; then
    log_ok "skip ~/.hushlogin (already exists)"
else
    touch "$HOME/.hushlogin"
    log_ok "created ~/.hushlogin"
fi

echo
log_ok "Done. Restart your shell or run: source ~/.bashrc"
