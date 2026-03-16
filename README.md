```
  ▒▒▒▒▒▒▒▒▒▒▒▒

▒▒▒▒  ▒▒▒▒▒▒▒▒

▒▒▒▒▒▒▒▒▒  ▒▒▒

▒▒▒▒▒▒▒▒▒▒▒▒
```

Configuration files for my current terminal setup.

## Contents

| Directory   | Config                                                         |
|-------------|----------------------------------------------------------------|
| `btop/`     | [btop](https://github.com/aristocratos/btop) system monitor    |
| `ghostty/`  | [Ghostty](https://ghostty.org) terminal (+ Catppuccin themes)  |
| `neofetch/` | [Neofetch](https://github.com/dylanaraps/neofetch) system info |
| `nvim/`     | [Neovim](https://neovim.io) (Kickstart-based)                  |
| `tmux/`     | [tmux](https://github.com/tmux/tmux) multiplexer               |
| `yazi/`     | [Yazi](https://yazi-rs.github.io) file manager                 |
| `zsh/`      | Zsh shell config + aliases                                     |


## Setup

```sh
./setup.sh
```

This symlinks each config directory into `~/.config/` and links `~/.zshrc`.
Existing files are backed up to `*.bak` before being replaced.
