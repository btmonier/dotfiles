alias ct="cd $HOME/Temporary/"
alias cdl="cd $HOME/Downloads/"
alias cdproj="cd $HOME/Projects/"
alias cdoc="cd $HOME/Documents/"
alias lf="yazi"
alias pyr="pixi run --manifest-path $HOME/Development/scratch_py/pixi.toml jupyter"
alias zrl="source $HOME/.zshrc"
alias metrics='(
  cd "$HOME/Projects/btm_site_core/" &&
  git pull &&
  pixi run metrics &&
  git add . &&
  git diff --cached --quiet || git commit -m "Update metrics"
  git push
)'
