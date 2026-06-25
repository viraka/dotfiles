-- Rename feature — inc-rename shows a live preview as you type the new name.
-- This file owns the WHOLE feature, including the parts that touch other
-- plugins, so there's one obvious place to look for "how does rename work":
--   * the inc-rename plugin itself
--   * the <leader>cr keymap (set via nvim-lspconfig's server config)
--   * the noice cmdline integration
return {
  -- The plugin. cmd = lazy-load only when :IncRename is invoked.
  { "smjonas/inc-rename.nvim", cmd = "IncRename", opts = {} },

  -- Re-point <leader>cr at inc-rename. Non-deprecated way: set keymaps via the
  -- LSP server config. `["*"]` applies to every attached server, and
  -- `has = "rename"` only binds it when that server supports renaming.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            {
              "<leader>cr",
              function()
                local inc_rename = require("inc_rename")
                return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
              end,
              expr = true,
              desc = "Rename (inc-rename)",
              has = "rename",
            },
          },
        },
      },
    },
  },

  -- Render the inc-rename prompt inline in the cmdline.
  {
    "folke/noice.nvim",
    optional = true,
    opts = { presets = { inc_rename = true } },
  },
}
