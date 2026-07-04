;; vim: ft=query
;; extends

; Alabaster ships no tsx/jsx queries, so its definition coloring never applies in
; .tsx files. Re-add the arrow-function / function-expression definition rule here,
; and boost priority above semantic tokens (125 > treesitter 100) so React components
; and hooks written as `const Foo = () => ...` get the definition color, while plain
; data consts (`const total = 5`) stay default text.
((variable_declarator
  name: (identifier) @AlabasterDefinition
  value: (arrow_function))
 (#set! "priority" 200))

((variable_declarator
  name: (identifier) @AlabasterDefinition
  value: (function_expression))
 (#set! "priority" 200))
