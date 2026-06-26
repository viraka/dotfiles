-- mason.nvim — the SINGLE source of truth for which external binaries
-- (LSP servers, linters, formatters, DAP adapters) get installed.
--
-- WHY this file exists:
--   Mason has no lockfile of its own. The ONLY thing that makes an install
--   reproducible is declaring it. Anything installed via the `:Mason` UI
--   (pressing `i`) is an *orphan*: it lives on disk but not in git, so a fresh
--   machine — or `:MasonUninstallAll` — loses it silently.
--   Rule: browse/experiment in `:Mason`, but KEEP things by listing them here.
--
-- ── Already covered by LazyVim extras (declared in config/lazy.lua) ─────────
-- These don't need to be repeated below; they're listed only as a map so this
-- file documents the COMPLETE inventory in one place:
--   lang.typescript.vtsls .... vtsls
--   lang.typescript.oxc ...... oxlint, oxfmt
--   lang.tailwind ............ tailwindcss-language-server
--   lang.json ................ json-lsp
--   lang.docker .............. dockerfile-language-server,
--                              docker-compose-language-service, hadolint
--   lang.markdown ............ marksman, markdownlint-cli2, markdown-toc
--   (LazyVim core) ........... lua-language-server, stylua, tree-sitter-cli
--
-- ── Audit for orphans anytime ───────────────────────────────────────────────
--   ls ~/.local/share/nvim/mason/packages/
-- Anything in that list you can't trace to an extra above or the list below is
-- an orphan: adopt it (add here) or remove it (`:Mason` → X).
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "prettier", -- formatter — wiring in conform.lua
        "js-debug-adapter", -- DAP adapter — wiring in nvim-dap.lua
        "graphql-language-service-cli", -- GraphQL LSP — server start in lang.lua
      })
      return opts
    end,
  },
}
