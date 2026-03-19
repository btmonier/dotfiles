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

## tmux keybindings (`tmux/keybindings.conf`)

All bindings use **Alt** (Meta) as prefix; no need to press `Ctrl-b` first.

### General

| Key   | Action                                      |
|-------|---------------------------------------------|
| `Alt-r` | Reload tmux config                         |
| `Alt-n` | New session (prompts for name)              |
| `Alt-.` | Switch to next session                     |
| `Alt-,` | Switch to previous session                 |
| `Alt-g` | Open lazygit in popup (90%×90%)            |

### Pane navigation (Alt + vim keys)

| Key   | Action                                      |
|-------|---------------------------------------------|
| `Alt-h` | Select pane left                           |
| `Alt-j` | Select pane down                           |
| `Alt-k` | Select pane up                             |
| `Alt-l` | Select pane right                          |

### Pane resizing (Alt + Shift + vim keys)

| Key     | Action                                      |
|---------|---------------------------------------------|
| `Alt-Shift-H` | Resize pane left (5 cells)             |
| `Alt-Shift-J` | Resize pane down (5 cells)             |
| `Alt-Shift-K` | Resize pane up (5 cells)               |
| `Alt-Shift-L` | Resize pane right (5 cells)            |

### Pane splitting

| Key   | Action                                      |
|-------|---------------------------------------------|
| `Alt-v` | Split window horizontally (same directory)  |
| `Alt-s` | Split window vertically (same directory)   |

### Prefix bindings (Ctrl-b first)

| Key   | Action                                      |
|-------|---------------------------------------------|
| `Ctrl-b c` | New window (same directory as current pane) |
| `Ctrl-b Tab` | Switch to last pane                       |
