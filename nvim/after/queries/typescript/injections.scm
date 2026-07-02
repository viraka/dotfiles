; extends

; gql(`...`)  and  graphql(`...`)  — codegen-style function call with a
; template-string argument (also matches gql(/* GraphQL */ `...`)).
((call_expression
   function: (identifier) @_fn
   arguments: (arguments (template_string) @injection.content))
 (#any-of? @_fn "gql" "graphql")
 (#set! injection.language "graphql"))

; gql`...`  and  graphql`...`  — tagged-template form.
((call_expression
   function: (identifier) @_fn
   arguments: (template_string) @injection.content)
 (#any-of? @_fn "gql" "graphql")
 (#set! injection.language "graphql"))
