-- Yanky — a yank "ring". After pasting, cycle <c-p>/<c-n> to replace the paste
-- with an earlier yank. Standalone (in-memory ring, no sqlite needed).
return {
  {
    "gbprod/yanky.nvim",
    opts = {
      ring = { history_length = 100 },
    },
    keys = {
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put after (cursor moves past)" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put before (cursor moves past)" },
      { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Cycle to previous yank" },
      { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Cycle to next yank" },
    },
  },
}
