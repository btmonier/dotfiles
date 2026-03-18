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
    log_ok "done"
  )
}


function copyall {
  "$@" 2>&1 | pbcopy
}
