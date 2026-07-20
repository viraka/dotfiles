# External dependencies

Config files declare *behaviour*; they assume the underlying tools already
exist on the machine. This is the single place that records **what to install**
so a fresh box (macOS or Linux) can be brought up without guesswork.

Same spirit as `nvim/lua/plugins/mason.lua`: if a config needs an external
binary to work, it gets listed here — otherwise a fresh install fails silently.

Legend: ✅ already installed on this machine · 🍎 macOS · 🐧 Linux (Wayland desktop)

---

## Core CLI (needed by more than one config)

| Tool | Why | macOS | Linux (Arch) |
|------|-----|-------|--------------|
| `git` | everything | `brew install git` | `pacman -S git` |
| `zsh` | login shell (kitty launches it) | preinstalled | `pacman -S zsh` |
| `ripgrep` (`rg`) ✅ | nvim picker/grep (`<leader>sg`) | `brew install ripgrep` | `pacman -S ripgrep` |
| `fd` ✅ | nvim picker file-find | `brew install fd` | `pacman -S fd` |
| `glow` ✅ | clean terminal markdown viewer (`glow FILE.md`) | `brew install glow` | `pacman -S glow` |

---

## nvim — LazyVim (cross-platform)

| Tool | Why |
|------|-----|
| `neovim` ≥ 0.10 (0.11+ recommended) | the editor; LazyVim tracks latest |
| C compiler (`clang`/`gcc`) | compiles Tree-sitter parsers — 🍎 `xcode-select --install`, 🐧 `pacman -S base-devel` |
| `node` + `npm` | runtime for most Mason LSPs/formatters (prettier, graphql-language-service-cli, js-debug-adapter, vtsls, tailwindcss, json-lsp, marksman, markdownlint-cli2, …) |
| `ripgrep`, `fd` | see Core CLI above |
| `lazygit` | `<leader>gg` git UI (see below) |
| a Nerd Font | icons — see Fonts below |

Mason auto-installs the tools declared in `nvim/lua/plugins/mason.lua` and the
LazyVim extras on first launch (some are prebuilt binaries it just downloads;
the npm-based ones need `node`/`npm` present). Run `:checkhealth` after install.

🍎 `brew install neovim node` · 🐧 `pacman -S neovim nodejs npm`

---

## kitty — terminal (🍎 / 🐧)

| Tool | Why |
|------|-----|
| `kitty` | the terminal | 🍎 `brew install --cask kitty` · 🐧 `pacman -S kitty` |
| GeistMono Nerd Font Mono | `font_family` in `kitty.conf` — see Fonts |
| `zsh` | `shell zsh` in config |

---

## tmux + tmuxinator

| Tool | Why |
|------|-----|
| `tmux` | multiplexer (`tmux.conf` is standalone — no plugin manager) |
| `tmuxinator` | project layouts in `tmuxinator/*.yml` (Ruby gem) — 🍎 `brew install tmuxinator` · 🐧 `gem install tmuxinator` |
| `ruby` | required by tmuxinator |

The tmuxinator projects (`bigrepo.yml`, `dev.yml`) also shell out to
`pnpm`, `lazygit`, and `nvim` — install those for the layouts to work.

---

## lazygit (🍎 / 🐧)

| Tool | Why |
|------|-----|
| `lazygit` | git TUI, used standalone and from nvim/tmuxinator | 🍎 `brew install lazygit` · 🐧 `pacman -S lazygit` |

`install.sh` symlinks only `config.yml` (lazygit writes state into its config
dir, so the whole dir isn't linked).

---

## Linux Wayland desktop only (🐧 — not used on macOS)

| Config | Tool | Install |
|--------|------|---------|
| `hypr/` | Hyprland compositor | `pacman -S hyprland` |
| `waybar/` | status bar | `pacman -S waybar` |
| `rofi/` | launcher | `pacman -S rofi-wayland` |

---

## Fonts

- **GeistMono Nerd Font** — used by kitty and required for nvim/lazygit icons.
  - 🍎 `brew install --cask font-geist-mono-nerd-font`
  - 🐧 install from https://www.nerdfonts.com or your distro's `ttf-*-nerd` package.

---

## Quick bootstrap

**macOS**
```sh
brew install neovim git ripgrep fd node lazygit tmux tmuxinator
brew install --cask kitty font-geist-mono-nerd-font
xcode-select --install            # C compiler for Tree-sitter
~/dotfiles/install.sh             # symlink the configs
```

**Arch Linux (Wayland desktop)**
```sh
sudo pacman -S neovim git ripgrep fd nodejs npm lazygit tmux kitty \
               hyprland waybar rofi-wayland base-devel ruby
gem install tmuxinator
# install a Nerd Font, then:
~/dotfiles/install.sh
```
