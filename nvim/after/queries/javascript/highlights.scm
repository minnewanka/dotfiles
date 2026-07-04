;; vim: ft=query
;; extends

; Arrow-function / function-expression definitions assigned to a variable.
; Same rationale as the typescript query: boost priority above semantic tokens so
; components/hooks written as `const Foo = () => ...` get the definition color, while
; plain data consts (`const total = 5`) stay default text. Also covers .jsx.
((variable_declarator
  name: (identifier) @AlabasterDefinition
  value: (arrow_function))
 (#set! "priority" 200))

((variable_declarator
  name: (identifier) @AlabasterDefinition
  value: (function_expression))
 (#set! "priority" 200))
