# Functions & scripts

## Zsh functions (`zsh/functions.zsh`)

| Function   | Description                                                                 |
|------------|-----------------------------------------------------------------------------|
| `metrics`  | Updates metrics in `btm_site_core` and `rtassel_insights`: pulls, runs `pixi run metrics`, commits and pushes if there are changes |
| `copyall`  | Runs a command and copies its combined stdout/stderr to the clipboard (`pbcopy`) |
| `gmdp`     | Wrapper for `gh markdown-preview` — preview Markdown in the browser        |

## Scripts (`scripts/`)

| Script     | Description                                                                 |
|------------|-----------------------------------------------------------------------------|
| `tlp`      | Teleport: simplified SCP for BioHPC. `tlp <remote_path>` pulls to `~/Downloads`; `tlp -t <local_path> [ ... ]` pushes to remote. Override via `TLP_LOCAL_DIR`, `TLP_REMOTE` |

## Aliases (`zsh/aliases.zsh`)

### Navigation

| Alias  | Expansion                         | Description                    |
|--------|-----------------------------------|--------------------------------|
| `ct`   | `cd $HOME/Temporary/`             | Go to Temporary directory      |
| `cdl`  | `cd $HOME/Downloads/`             | Go to Downloads                |
| `cdproj` | `cd $HOME/Projects/`            | Go to Projects                 |
| `cdoc` | `cd $HOME/Documents/`             | Go to Documents                |
| `lf`   | `yazi`                            | Launch Yazi file manager       |

### tmux

| Alias | Expansion                  | Description                          |
|-------|----------------------------|--------------------------------------|
| `tn`  | `tmux new-session -s`      | Create new tmux session with name    |
| `ta`  | `tmux a`                   | Attach to existing tmux session     |

### Jupyter / Python / R scratch

| Alias | Expansion                                                       | Description                    |
|-------|-----------------------------------------------------------------|--------------------------------|
| `pyr` | `pixi run --manifest-path $HOME/Development/scratch_py/pixi.toml jupyter` | Run Jupyter from scratch env   |

### zsh

| Alias | Expansion              | Description              |
|-------|------------------------|--------------------------|
| `zrl` | `source $HOME/.zshrc`  | Reload zsh config        |
