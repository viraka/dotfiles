-- Language support.
-- Instead of the magic `extras` array in lazyvim.json, the LazyVim language
-- extras are declared here as explicit imports. Why this and not copy-pasting
-- their source:
--   * they show up as code you can see and version-control
--   * you can add your own overrides right alongside them (see bottom)
--   * importing means LazyVim keeps MAINTAINING them — you still get upstream
--     fixes and deprecation patches automatically (a hand-copy would freeze and
--     silently drift, e.g. the lsp.keymaps deprecation we already hit).
return {
  -- TypeScript / JavaScript: vtsls language server + oxc linter.
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.typescript.vtsls" },
  { import = "lazyvim.plugins.extras.lang.typescript.oxc" },

  -- Web.
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.json" },

  -- Misc.
  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.markdown" },

  -- Your own language overrides go here, e.g.:
  -- { "neovim/nvim-lspconfig", opts = { servers = { vtsls = { settings = { ... } } } } },
}
