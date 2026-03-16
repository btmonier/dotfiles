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

# --- SDKMAN (must stay at end) ---
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# --- Aliases ---
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"
