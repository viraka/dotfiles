-- nvim-lspconfig — how diagnostics are RENDERED.
-- Related bits live elsewhere (by design, see plugins/README.md):
--   * the hover-float trigger  -> config/autocmds.lua (CursorHold autocmd)
--   * the <leader>cr rename key -> plugins/inc-rename.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- LazyVim feeds this table straight into vim.diagnostic.config().
      diagnostics = {
        -- Inline message at the end of the line (kept short with a prefix icon).
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true, -- errors render above warnings on the same line
        -- Styling for the floating window that pops up on hover (see autocmds).
        float = {
          border = "rounded",
          source = true, -- show which linter/LSP produced the message
        },
      },
    },
  },
}
