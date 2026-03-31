# ~/.bashrc — lean config for HPC environments

# Source system defaults (module paths, etc.)
[ -f /etc/bashrc ] && . /etc/bashrc

# ── PATH ──────────────────────────────────────────────────────────────────────

export PATH="$HOME/.local/bin:$HOME/.pixi/bin:$PATH"

# ── Environment ───────────────────────────────────────────────────────────────

export EDITOR="nvim"
export VISUAL="$EDITOR"
export LANG="en_US.UTF-8"
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

# ── Prompt ────────────────────────────────────────────────────────────────────

_prompt_color() { printf '\[\e[%sm\]' "$1"; }
_c_user="$(_prompt_color '1;32')"
_c_host="$(_prompt_color '1;33')"
_c_dir="$(_prompt_color '1;34')"
_c_reset="$(_prompt_color '0')"
PS1="${_c_user}\u${_c_reset}@${_c_host}\h${_c_reset}:${_c_dir}\w${_c_reset}\$ "
unset -f _prompt_color

# ── Aliases ───────────────────────────────────────────────────────────────────

alias ll='ls -lAh --color=auto'
alias la='ls -A --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias v='nvim'
alias lg='lazygit'
alias lf='yazi 2>/dev/null'

alias tn='tmux new-session -s'
alias ta='tmux a'

# ── SDKMAN ────────────────────────────────────────────────────────────────────

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# ── Completion ────────────────────────────────────────────────────────────────

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion 2>/dev/null
elif [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion 2>/dev/null
fi
