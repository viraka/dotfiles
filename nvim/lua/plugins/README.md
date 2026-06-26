# `lua/plugins/`

**Convention: one file per plugin, named after the plugin** — the name you'd
search in `:Lazy` or Google. If a feature spans several plugins, it lives in the
file named after its *main* plugin.

Every file here is auto-imported by lazy.nvim (`{ import = "plugins" }` in
`lua/config/lazy.lua`). Each returns a list of plugin specs.

| File | Plugin / purpose | Key entry points |
| --- | --- | --- |
| `lang.lua` | Language-specific overrides (LSP server settings, e.g. `graphql`) | — |
| `lspconfig.lua` | `nvim-lspconfig` — how diagnostics are rendered | — |
| `mason.lua` | `mason.nvim` — **single source of truth for installed binaries** (LSP/lint/format/DAP) | `:Mason` |
| `inc-rename.lua` | `inc-rename.nvim` — rename with live preview | `<leader>cr` |
| `conform.lua` | `conform.nvim` — Prettier formatting (binary declared in `mason.lua`) | format on save, `<leader>cf` |
| `harpoon.lua` | `harpoon` — pinned-file navigation | `<leader>ha`, `<leader>hh`, `<leader>1..4` |
| `yanky.lua` | `yanky.nvim` — yank ring | `p`/`P`, then `<c-p>`/`<c-n>` |
| `snacks.lua` | `snacks.nvim` — file explorer, picker (telescope layout), QoL modules | `<leader>e`, `<leader>ff` |
| `neotest.lua` | `neotest` (+ vitest) — test runner | `<leader>t…` |
| `nvim-dap.lua` | `nvim-dap` (+ dap-ui) — debugging (Node/Chrome) | `<leader>d…` |

## Things that intentionally live elsewhere

- **Diagnostic-on-hover autocmd**, other autocmds → `../config/autocmds.lua`
- **Options** like `updatetime` → `../config/options.lua`
- **Custom keymaps** (e.g. `jk` to exit insert) → `../config/keymaps.lua`
- **Which extras are enabled** → `../config/lazy.lua` `spec` (imports must come
  before this folder loads; no longer `lazyvim.json`). Override them in `lang.lua`.

## Installing external tools (LSP servers, linters, formatters, DAP adapters)

Mason fetches the binaries, but it has **no lockfile** — only *declaring* a tool
makes it reproducible. So:

- **Declare every tool you want to keep in `mason.lua`'s `ensure_installed`.**
  Do *not* rely on installing via the `:Mason` UI (`i`) — those are orphans that
  vanish on a fresh machine. Use `:Mason` only to browse/experiment.
- An **LSP server** also needs to be *started*: declare it under
  `nvim-lspconfig` `opts.servers` in `lang.lua` (the binary still goes in
  `mason.lua`). Many servers come pre-wired by the LazyVim extras in
  `../config/lazy.lua` — `mason.lua`'s header comment maps which extra
  installs what.
- **Audit for orphans:** `ls ~/.local/share/nvim/mason/packages/` and check each
  entry traces back to an extra or `mason.lua`.

## How to change things

- Configure an existing LazyVim default: add `{ "owner/repo", opts = { ... } }`.
- Disable a default: `{ "owner/repo", enabled = false }`.
- `opts` as a **function** `function(_, opts) ... return opts end` *extends*
  LazyVim's defaults; `opts` as a **table** deep-merges. Use the function form
  when you need to append to a list.
