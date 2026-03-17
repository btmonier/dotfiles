# --- Powerlevel10k instant prompt (must stay near top) ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Oh-My-Zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
source $ZSH/oh-my-zsh.sh

# --- P10k config ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- Exports (JAVA_HOME, PATH, etc.) ---
[ -f "$HOME/.config/zsh/exports.zsh" ] && source "$HOME/.config/zsh/exports.zsh"

# --- Conda / Mamba (lazy-loaded) ---
CONDA_ROOT="${CONDA_ROOT:-$HOME/Development/mambaforge}"
_conda_lazy_init() {
  [[ -n "${_conda_initialized:-}" ]] && return
  _conda_initialized=1
  if [[ -f "$CONDA_ROOT/etc/profile.d/conda.sh" ]]; then
    source "$CONDA_ROOT/etc/profile.d/conda.sh"
  else
    export PATH="$CONDA_ROOT/bin:$PATH"
  fi
  [[ -f "$CONDA_ROOT/etc/profile.d/mamba.sh" ]] && source "$CONDA_ROOT/etc/profile.d/mamba.sh"
}
conda()  { _conda_lazy_init; conda "$@"; }
mamba()  { _conda_lazy_init; mamba "$@"; }

# --- lf cd helper ---
[ -f "$HOME/.config/lf/lfcd.sh" ] && source "$HOME/.config/lf/lfcd.sh"

# --- Logging / color helpers (used by functions and scripts) ---
# Prefer ~/.config/zsh; if .zshrc is a symlink into the repo, fall back to that dir
_zsh_dir="${HOME}/.config/zsh"
if [[ -L "$HOME/.zshrc" ]]; then
  _zsh_src="$HOME/.zshrc"
  while [[ -L "$_zsh_src" ]]; do
    _zsh_src="$(readlink "$_zsh_src")"
    [[ "$_zsh_src" != /* ]] && _zsh_src="$(dirname "$HOME/.zshrc")/$_zsh_src"
  done
  _zsh_dir="$(dirname "$_zsh_src")"
fi
[ -f "$_zsh_dir/log.sh" ] && source "$_zsh_dir/log.sh"
# Only source functions when running in zsh (avoids parse errors if sourced by another shell)
[[ -n "${ZSH_VERSION:-}" ]] && [ -f "$_zsh_dir/functions.zsh" ] && source "$_zsh_dir/functions.zsh"
unset _zsh_dir _zsh_src

# --- Aliases ---
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"

# --- SDKMAN (must stay at end) ---
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"



