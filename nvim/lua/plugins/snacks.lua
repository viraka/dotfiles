-- snacks.nvim — folke's all-in-one QoL collection.
-- LazyVim turns a bunch of its modules on by default; THIS file is where you
-- own and override them.
--
-- Key fact: your opts here DEEP-MERGE with LazyVim's defaults. Anything you
-- don't mention keeps its default, so you can't accidentally disable a module
-- just by leaving it out. To actually turn one off, set `enabled = false`.
--
-- See what's live at runtime anytime with:  :checkhealth snacks
return {
  {
    "folke/snacks.nvim",
    opts = {
      -- ── Background modules LazyVim enables by default ──────────────────
      -- Listed here so you can SEE them. Flip any to `enabled = false` to kill it.
      bigfile = { enabled = true }, -- turn off heavy features in huge files
      quickfile = { enabled = true }, -- render a file before plugins load (fast open)
      indent = { enabled = true }, -- indent guides + current-scope highlight
      scope = { enabled = true }, -- treesitter-aware scope text objects (ii / ai)
      scroll = { enabled = true }, -- smooth scrolling
      input = { enabled = true }, -- pretty vim.ui.input() popups
      notifier = { enabled = true }, -- toast notifications (top-right)
      words = { enabled = true }, -- highlight other uses of word under cursor
      -- statuscolumn stays off here: LazyVim wires the status column elsewhere.
      statuscolumn = { enabled = false },

      -- ── File explorer (your <leader>e) ─────────────────────────────────
      explorer = { enabled = true },

      -- The explorer is driven by the picker engine, so its "show hidden files"
      -- toggles live under picker.sources.explorer:
      picker = {
        -- Make pickers look like Telescope: results + prompt on the left,
        -- preview on the right (horizontal split). "telescope" is a built-in
        -- snacks layout preset. Other presets: ivy, vertical, dropdown, vscode.
        -- (The explorer below keeps its own sidebar layout — this only affects
        -- finders like <leader>ff / <leader>fg.)
        layout = { preset = "telescope" },
        sources = {
          explorer = {
            hidden = true, -- show dotfiles like .env, .eslintrc (handy in Next.js)
            ignored = false, -- keep gitignored stuff (node_modules, .next) hidden
            -- ^ flip `ignored = true` if you ever want to see those too.
            -- Tip: inside the explorer, press `H` to toggle hidden files on the fly.
          },
        },
      },

      -- ── Things you can switch ON (off by default) ──────────────────────
      -- Uncomment to enable; explore more at https://github.com/folke/snacks.nvim
      -- dim = { enabled = true }, -- dim code outside the current scope
      -- zen = { enabled = true }, -- distraction-free mode (call Snacks.zen())
    },
  },
}
