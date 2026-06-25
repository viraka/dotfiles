# `lua/plugins/`

**Convention: one file per plugin, named after the plugin** — the name you'd
search in `:Lazy` or Google. If a feature spans several plugins, it lives in the
file named after its *main* plugin.

Every file here is auto-imported by lazy.nvim (`{ import = "plugins" }` in
`lua/config/lazy.lua`). Each returns a list of plugin specs.

| File | Plugin / purpose | Key entry points |
|------|------------------|------------------|
| `lang.lua` | Language support — imports of LazyVim lang extras (TS, Tailwind, JSON, Docker, Markdown) | — |
| `lspconfig.lua` | `nvim-lspconfig` — how diagnostics are rendered | — |
| `inc-rename.lua` | `inc-rename.nvim` — rename with live preview | `<leader>cr` |
| `conform.lua` | `conform.nvim` — Prettier formatting (+ mason install) | format on save, `<leader>cf` |
| `harpoon.lua` | `harpoon` — pinned-file navigation | `<leader>ha`, `<leader>hh`, `<leader>1..4` |
| `yanky.lua` | `yanky.nvim` — yank ring | `p`/`P`, then `<c-p>`/`<c-n>` |
| `snacks.lua` | `snacks.nvim` — file explorer, picker (telescope layout), QoL modules | `<leader>e`, `<leader>ff` |
| `neotest.lua` | `neotest` (+ vitest) — test runner | `<leader>t…` |
| `nvim-dap.lua` | `nvim-dap` (+ dap-ui) — debugging (Node/Chrome) | `<leader>d…` |

## Things that intentionally live elsewhere

- **Diagnostic-on-hover autocmd**, other autocmds → `../config/autocmds.lua`
- **Options** like `updatetime` → `../config/options.lua`
- **Custom keymaps** (e.g. `jk` to exit insert) → `../config/keymaps.lua`
- **Which extras are enabled** → `lang.lua` (no longer `lazyvim.json`)

## How to change things

- Configure an existing LazyVim default: add `{ "owner/repo", opts = { ... } }`.
- Disable a default: `{ "owner/repo", enabled = false }`.
- `opts` as a **function** `function(_, opts) ... return opts end` *extends*
  LazyVim's defaults; `opts` as a **table** deep-merges. Use the function form
  when you need to append to a list.
