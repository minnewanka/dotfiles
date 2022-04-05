function fish_user_key_bindings
  # peco
  bind \co peco_change_directory # Bind for peco select history to Ctrl+O
  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
  bind \cp peco_change_directory # Bind for peco change directory to Ctrl+F
  bind \cb beginning-of-line
  bind \eh backward-word
  bind \el forward-word
end

fzf_key_bindings
