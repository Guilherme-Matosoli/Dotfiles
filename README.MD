# dotfiles

> My personal configuration files for macOS & Linux — terminal-first, keyboard-driven, gruvbox-themed.

```
~/.tmux.conf · ~/.zshrc · ~/.config/ghostty/config
```

---

## Setup

Clone and bootstrap with a bare git repo — no symlinks, no tools, just git.

```bash
git clone --bare git@github.com:Guilherme-Matosoli/Dotfiles.git ~/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
dotfiles config status.showUntrackedFiles no
```

Add the alias to your shell so it persists across sessions:

```bash
echo "alias dotfiles='git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'" >> ~/.zshrc
source ~/.zshrc
```

---

## Stack

| Tool | Purpose |
|------|---------|
| [Ghostty](https://ghostty.org) | Terminal emulator |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexer |
| [Zsh](https://www.zsh.org) + [Oh My Zsh](https://ohmyz.sh) | Shell |
| [TPM](https://github.com/tmux-plugins/tpm) | tmux plugin manager |
| [gruvbox](https://github.com/egel/tmux-gruvbox) | Color theme |
| [Iosevka Nerd Font](https://www.nerdfonts.com) | Font |

---

## tmux

- **Prefix** — `Ctrl+Space` (macOS) / `Alt+Space` (Linux)
- **Pane navigation** — `prefix + h/j/k/l` (vim keys, wraps to next window at edge)
- **Kill window** — `prefix + q`
- **Status bar** — top, gruvbox dark theme
- Windows auto-renumber on close

**Install plugins after cloning:**

```
prefix + I
```

---

## Zsh

- Autosuggestions via `zsh-autosuggestions` — press `→` to accept
- Oh My Zsh with git plugin

---

## Managing dotfiles

Use the `dotfiles` alias exactly like `git`:

```bash
dotfiles status
dotfiles add ~/.tmux.conf
dotfiles commit -m "update tmux prefix"
dotfiles push
```

---

## License

Do whatever you want with this.
