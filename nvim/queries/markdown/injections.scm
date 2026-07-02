; Markdown injections — user override placed in `queries/` (NOT `after/`) and
; WITHOUT a `; extends` modeline, so it becomes the BASE query and REPLACES the
; built-in generic fenced-code rule. (An `after/` file without `; extends` is
; silently dropped — Neovim keeps the plugin base — which is why this lives
; here instead.)
;
; Purpose: stop the GraphQL parser from running on ```graphql fences (e.g. in
; LSP hover popups, native or noice). The GraphQL LSP puts non-GraphQL
; signature lines like `Type.field: ReturnType` inside graphql fences; the real
; parser can't tokenize those and renders them plain white. Excluding graphql
; makes such blocks fall back to the uniform raw-code-block style.
;
; Buffer-level gql`` highlighting is UNAFFECTED — that comes from the
; typescript/tsx/javascript injections, not this markdown file.
;
; Every other rule is copied verbatim from the built-in markdown injections so
; typescript blocks, html, yaml/toml frontmatter, tables, and math still work.

(fenced_code_block
  (info_string
    (language) @injection.language)
  (code_fence_content) @injection.content
  (#not-eq? @injection.language "graphql"))

((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))

((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

([
  (inline)
  (pipe_table_cell)
] @injection.content
  (#set! injection.language "markdown_inline"))

; math fences -> latex (kept from the built-in after/ query so it still works)
(fenced_code_block
  (info_string (language) @lang)
  (#eq? @lang "math")
  (code_fence_content) @injection.content
  (#set! injection.language "latex"))
