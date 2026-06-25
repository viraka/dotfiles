-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Diagnostics on hover: when the cursor sits still on a line with an error/warning,
-- pop a floating window with the full message. `updatetime` (in options.lua)
-- controls how long "still" means before CursorHold fires.
vim.api.nvim_create_autocmd("CursorHold", {
  group = vim.api.nvim_create_augroup("hover_diagnostics", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      scope = "cursor", -- only the diagnostic under the cursor, not the whole line
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    })
  end,
})
