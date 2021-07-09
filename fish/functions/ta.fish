# Defined via `source`
function ta --wraps='tmux attach -t' --description 'alias ta tmux attach -t'
  tmux attach -t $argv; 
end
