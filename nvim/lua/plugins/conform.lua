-- conform.nvim — formatting. Currently: Prettier for JS/TS/CSS/JSON/etc.
return {
  -- Prettier wired into conform.nvim.
  -- This is the hand-written version of lazyvim.plugins.extras.formatting.prettier.
  -- LazyVim already runs conform on save, so registering prettier per-filetype
  -- here is all that's needed to get format-on-save for a Next.js project.
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- conform keeps a map of filetype -> list of formatters to run.
      -- We use the `opts` *function* form (not a table) so we extend LazyVim's
      -- defaults instead of clobbering them.
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs({
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "markdown.mdx",
        "graphql",
      }) do
        opts.formatters_by_ft[ft] = { "prettier" }
      end
      return opts
    end,
  },

  -- Make sure the `prettier` binary actually gets installed.
  -- (Mason moved orgs: the current repo is mason-org/mason.nvim. Matching that
  -- name exactly is what lets these opts MERGE with LazyVim's mason spec rather
  -- than creating a second, conflicting plugin.)
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "prettier")
      return opts
    end,
  },
}
