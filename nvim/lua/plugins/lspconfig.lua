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
        -- No inline end-of-line message on every line — it clutters the buffer.
        -- Gutter signs still mark which lines have issues; the full message
        -- shows in the hover float when the cursor rests on the line (see the
        -- CursorHold autocmd in config/autocmds.lua), or in the diagnostics
        -- list (<leader>xx Trouble / :lua vim.diagnostic.setloclist()).
        virtual_text = false,
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
