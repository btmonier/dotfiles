# ~/.bashrc — lean config for HPC environments

# Source system defaults (module paths, etc.)
[ -f /etc/bashrc ] && . /etc/bashrc 2>/dev/null

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

# ── Remote SSH theme (gruvbox-material) ───────────────────────────────────────
# Every SSH shell gets the gruvbox-material visual cue: Ghostty bg is repainted
# and yazi swaps to its gruvbox-material variant. Plain `ssh` sets
# SSH_CONNECTION / SSH_CLIENT; the local `gssh` wrapper additionally exports
# LC_GSSH_BG to override the bg color per-host. Both paths converge here, so
# nvim / tmux (which key off SSH_CONNECTION too) stay in sync with the shell.
if [[ -n "${SSH_CONNECTION:-}" || -n "${SSH_CLIENT:-}" || -n "${LC_GSSH_BG:-}" ]]; then
    # LC_GSSH_BG wins when set; otherwise fall back to gruvbox-material bg0 hard.
    _gssh_bg="${LC_GSSH_BG:-#1d2021}"
    _gssh_bg="${_gssh_bg#\#}"

    # Re-apply the bg before every prompt so TUI apps that reset the background
    # on exit (yazi, btop, nvim, …) don't strip the visual cue that this shell
    # is remote.
    _gssh_paint_bg() { printf '\e]11;#%s\a' "$_gssh_bg" >/dev/tty 2>/dev/null; }
    # Restore the local terminal's bg on shell exit. gssh emits OSC 111 locally
    # too, so the double-reset is harmless; this hook is what covers plain ssh.
    _gssh_reset_bg() { printf '\e]111\a' >/dev/tty 2>/dev/null; }
    _gssh_paint_bg
    trap _gssh_reset_bg EXIT

    # Bash 5+ supports PROMPT_COMMAND as an array; older versions need a
    # string. Append our hook either way without clobbering existing entries.
    if [[ "${BASH_VERSINFO[0]:-0}" -ge 5 ]] && declare -p PROMPT_COMMAND 2>/dev/null | grep -q 'declare \-a'; then
        PROMPT_COMMAND+=("_gssh_paint_bg")
    else
        case ";${PROMPT_COMMAND:-};" in
            *";_gssh_paint_bg;"*) : ;;
            *) PROMPT_COMMAND="_gssh_paint_bg${PROMPT_COMMAND:+; $PROMPT_COMMAND}" ;;
        esac
    fi

    # Swap yazi to its gruvbox-material variant by pointing
    # YAZI_CONFIG_HOME at the parallel config dir built in setup_biohpc.sh.
    # `command yazi` avoids recursion; we keep it a function (not an alias)
    # so the existing `lf='yazi 2>/dev/null'` alias still resolves correctly.
    if [[ -d "${XDG_CONFIG_HOME:-$HOME/.config}/yazi-remote" ]]; then
        yazi() {
            YAZI_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/yazi-remote" \
                command yazi "$@"
        }
    fi
fi

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

alias ct="cd $HOME/Temporary/"
alias cdl="cd $HOME/Downloads/"
alias cdproj="cd $HOME/Projects/"
alias cdoc="cd $HOME/Documents/"
alias cdot="cd $HOME/Projects/dotfiles/"

alias zrl="source $HOME/.bashrc"

export WORKDIR="/workdir/$USER"

wrk() {
    mkdir -p "$WORKDIR" 2>/dev/null
    cd "$WORKDIR" || return
}

# ── SDKMAN ────────────────────────────────────────────────────────────────────

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# ── Completion ────────────────────────────────────────────────────────────────

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion 2>/dev/null
elif [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion 2>/dev/null
fi

# ── Startup banner ────────────────────────────────────────────────────────────

if [[ $- == *i* ]] && [[ -z "${TMUX-}" || "$(tmux list-panes 2>/dev/null | wc -l)" -le 1 ]]; then
    clear
    command -v fastfetch &>/dev/null && fastfetch
fi
