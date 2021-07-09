# Defined via `source`
function ls --wraps=exa --wraps=lazygit --description 'alias ls=exa'
  exa $argv; 
end
