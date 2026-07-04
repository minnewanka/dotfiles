;; vim: ft=query
;; extends

; Arrow-function / function-expression definitions assigned to a variable.
; vtsls labels these as `variable` semantic tokens (not `function`), so Alabaster's
; definition color is otherwise lost under semantic tokens (priority 125 > treesitter 100).
; Boost priority above semantic tokens so the definition (blue) wins here — WITHOUT
; coloring plain data consts (`const total = 5` stays default text).
((variable_declarator
  name: (identifier) @AlabasterDefinition
  value: (arrow_function))
 (#set! "priority" 200))

((variable_declarator
  name: (identifier) @AlabasterDefinition
  value: (function_expression))
 (#set! "priority" 200))
