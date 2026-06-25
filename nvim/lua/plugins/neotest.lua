-- Testing: neotest + a JS/TS adapter.
-- Defaults to Vitest (fast, first-class TS, common in modern Next.js apps).
-- Using Jest instead? Swap the adapter: add dependency "nvim-neotest/neotest-jest"
-- and replace the require below with require("neotest-jest")({ jestCommand = "npm test --" }).
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
    },
    -- opts is passed to require("neotest").setup(). Adapters must be instances,
    -- so we build them in a function rather than a static table.
    opts = function()
      return {
        adapters = {
          require("neotest-vitest"),
        },
      }
    end,
    keys = {
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run tests in file" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run last test" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Show test output" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle output panel" },
      { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle watch (file)" },
    },
  },
}
