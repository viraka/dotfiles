-- Treesitter overrides.
-- Ensure the GraphQL grammar is installed so `gql(`...`)` template bodies can
-- be highlighted via the injection queries in after/queries/*/injections.scm.
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "graphql" },
  },
}
