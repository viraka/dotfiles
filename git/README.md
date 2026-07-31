# git

Config for git itself (not lazygit — that's a separate TUI tool with its own
config dir, see `../lazygit`).

- `gitconfig` — symlinked to `~/.gitconfig` by `install.sh`.

## What else could live here

- `gitignore_global` — global ignore patterns (`.DS_Store`, `*.swp`, etc.),
  wired up via `core.excludesFile` in `gitconfig`.
- `gitmessage` — commit message template, wired up via `commit.template`.
- `gitattributes` — global `~/.gitattributes` for line-ending/diff rules that
  apply across all repos.
- `hooks/` — templates for `git init --template` to auto-install hooks
  (e.g. a default pre-commit) in newly created repos.
- Work/personal split — separate `[user]` blocks per directory using
  `includeIf "gitdir:~/work/"` in `gitconfig`, pointing at a second file
  (e.g. `gitconfig.work`) with a different email.
