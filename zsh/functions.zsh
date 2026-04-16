# --- Custom shell functions (multi-step / complex commands) ---
# This file is zsh-only; .zshrc sources it only when ZSH_VERSION is set.

function metrics {
  (
    set -e
    local repo_btm="$HOME/Projects/btm_site_core"
    local repo_rtassel="$HOME/Projects/rtassel_insights"

    log_section "Update Metrics"
    log_step "btm_site_core: pull, run metrics, commit & push"
    cd "$repo_btm"
    git pull
    pixi run metrics
    git add .
    if ! git diff --cached --quiet; then
      git commit -m "Update metrics"
      git push
      log_ok "committed and pushed"
    else
      log_info "no changes to commit"
    fi

    log_step "rtassel_insights: pull"
    cd "$repo_rtassel"
    git pull
    
    log_step "Purge local GS HTML"
    local scholar_html='_Brandon Monier_ - _Google Scholar_.html'
    rm -f "$HOME/Downloads/$scholar_html" "$HOME/Desktop/$scholar_html"

    log_ok "done"
  )
}


function copyall {
  "$@" 2>&1 | pbcopy
}

function gmdp {
  gh markdown-preview "$@"
}


# --- Remote SSH with background-color switch ----------------------------------
# Recolors only the Ghostty window background via OSC 11 (set bg) for the
# duration of an SSH session, then OSC 111 (reset bg) restores whatever the
# Ghostty config defines. Provides a visual cue that the shell is remote
# without mutating the rest of the palette.
#
# The bg color is also forwarded to the remote via LC_GSSH_BG so that the
# remote bash config can re-apply it on every prompt (TUI apps like yazi,
# btop, nvim emit OSC 111 on exit which would otherwise revert the bg).
function gssh {
  local remote_bg="${GSSH_BG:-#24273a}"   # catppuccin macchiato base by default
  remote_bg="${remote_bg#\#}"

  printf '\e]11;#%s\a' "$remote_bg"
  {
    LC_GSSH_BG="$remote_bg" ssh -o SendEnv=LC_GSSH_BG "$@"
  } always {
    printf '\e]111\a'
  }
}
