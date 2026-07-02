-- noice.nvim overrides.
-- Disable noice's LSP hover so `K` falls back to Neovim's NATIVE floating
-- hover window (vim.lsp.util.open_floating_preview). Everything else noice
-- does (cmdline, messages, notifications, signature help) is left untouched.
return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      hover = { enabled = false },
      -- Uncomment to also get the native signature-help popup:
      -- signature = { enabled = false },
    },
  },
}
