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
  -- NOTE: the `prettier` binary is installed via Mason. All Mason installs are
  -- declared in one place — see plugins/mason.lua.
}
