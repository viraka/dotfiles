-- nvim-ts-autotag — auto-close / auto-rename HTML & JSX tags.
-- LazyVim pulls this in via treesitter with all behaviors ON. This override
-- lets you tune the individual triggers. Note the DOUBLE `opts`: lazy passes
-- the outer table to setup(), and autotag reads its real settings from the
-- inner `opts` key.
return {
  "windwp/nvim-ts-autotag",
  opts = {
    opts = {
      -- Type `<div>` and get `</div>` auto-inserted. This is the main feature.
      -- Set false to stop tags closing themselves entirely.
      enable_close = true,

      -- Rename the opening tag and have the matching closing tag follow along
      -- (and vice-versa). Turned OFF because auto-syncing the pair while editing
      -- an existing tag was fighting the edits. Flip back to true to re-enable.
      enable_rename = false,

      -- Auto-close when you type `</`. Often the noisiest trigger. Kept off
      -- (this is also the plugin default); leave false unless you want it.
      enable_close_on_slash = false,
    },

    -- Per-filetype overrides. Example: disable auto-close only in plain HTML
    -- but keep it in your .tsx files. Uncomment and edit as needed.
    -- per_filetype = {
    --   html = { enable_close = false },
    -- },
  },
}
