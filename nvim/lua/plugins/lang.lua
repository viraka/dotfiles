-- Language support — OVERRIDES live here.
--
-- The extra IMPORTS are in config/lazy.lua, NOT here. LazyVim requires extras
-- to be imported after `lazyvim.plugins` and before your own `plugins/` files,
-- and everything in this folder loads last — so the imports can't live here
-- without tripping LazyVim's import-order check.
--
-- This is the place for your own language tweaks. Example — extra vtsls
-- settings (uncomment and edit):
return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       vtsls = {
  --         settings = {
  --           typescript = {
  --             preferences = { importModuleSpecifier = "non-relative" },
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },

  -- GraphQL LSP. There's no LazyVim graphql extra, so we declare the server
  -- ourselves — this is what STARTS it. The binary
  -- (graphql-language-service-cli) is installed via plugins/mason.lua.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        graphql = {
          -- nvim-lspconfig's default filetypes are only graphql/tsx/jsx, so the
          -- LSP never attaches to plain .ts/.js files. Our B2B code keeps gql``
          -- tagged templates in .ts files, so add typescript/javascript too.
          -- (Setting filetypes REPLACES the default list — keep all five.)
          filetypes = { "graphql", "typescript", "typescriptreact", "javascript", "javascriptreact" },
        },
      },
    },
  },
}
