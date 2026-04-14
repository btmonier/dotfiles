```
  ▒▒▒▒▒▒▒▒▒▒▒▒

▒▒▒▒  ▒▒▒▒▒▒▒▒

▒▒▒▒▒▒▒▒▒  ▒▒▒

▒▒▒▒▒▒▒▒▒▒▒▒      .dotfiles
```

## Contents

| Directory   | Config                                                              |
|-------------|---------------------------------------------------------------------|
| `btop/`     | [btop](https://github.com/aristocratos/btop) system monitor         |
| `fastfetch/`| [Fastfetch](https://github.com/fastfetch-cli/fastfetch) system info |
| `ghostty/`  | [Ghostty](https://ghostty.org) terminal (+ Catppuccin themes)       |
| `nvim/`     | [Neovim](https://neovim.io) (modular, Catppuccin Mocha)             |
| `tmux/`     | [tmux](https://github.com/tmux/tmux) multiplexer                    |
| `yazi/`     | [Yazi](https://yazi-rs.github.io) file manager                      |
| `zsh/`      | Zsh shell config + aliases                                          |


## Setup

```sh
./setup.sh
```

This symlinks each config directory into `~/.config/` and links `~/.zshrc`.
Existing files are backed up to `*.bak` before being replaced.

## HPC Setup

```sh
./hpc-install.sh
```

For remote HPC environments where you don't have root access. Downloads
prebuilt x86\_64 Linux binaries to `~/.local/`, installs
[pixi](https://pixi.prefix.dev/latest/) + tmux via conda-forge, runs
`setup.sh` to link configs, and adds `~/.local/bin` / `~/.pixi/bin` to
`PATH` in `~/.bashrc`.

| Tool | Install method |
|-----------|--------------------------------------|
| Neovim | GitHub release → `~/.local/lib/nvim` |
| btop | GitHub release → `~/.local/bin` |
| Yazi | GitHub release → `~/.local/bin` |
| Fastfetch | GitHub release → `~/.local/bin` |
| lazygit | GitHub release → `~/.local/bin` |
| pixi | Official installer → `~/.pixi/bin` |
| tmux | `pixi global install` → `~/.pixi/bin`|

Re-run with `--force` to re-download everything.

## Other CLI tools/fonts

| Tool                                                                      | Description                              |
|---------------------------------------------------------------------------|------------------------------------------|
| [dua](https://github.com/Byron/dua-cli)                                   | Disk usage analyzer                      |
| [fzf](https://github.com/junegunn/fzf)                                    | Command-line fuzzy finder                |
| [gh](https://cli.github.com/)                                             | GitHub CLI                               |
| [glow](https://github.com/charmbracelet/glow)                             | Markdown CLI renderer                    |
| [Homebrew](https://brew.sh) (brew)                                        | macOS/Linux package manager              |
| [JetBrains Mono](https://www.jetbrains.com/lp/mono/)                      | The best mono font ever                  |
| [jq](https://github.com/jqlang/jq)                                        | Command-line JSON processor              |
| [lazygit](https://github.com/jesseduffield/lazygit)                       | Terminal UI for Git                      |
| [Miniconda](https://www.anaconda.com/docs/getting-started/miniconda/main) | Environment manager (old - legacy stuff) |
| [pixi](https://pixi.prefix.dev/latest/)                                   | Environment manager (current)            |
| [Powerlevel10k](https://github.com/romkatv/powerlevel10k)                 | Zsh theme                                |

See [`docs/command_overview.md`](docs/command_overview.md) for info detailing alias
and function calls.

