if status is-interactive
  starship init fish | source
  zoxide init fish | source
  fastfetch
end

  alias lok-search="$HOME/scripts/lok-search.sh"
  alias ls="eza --group-directories-first"


export PATH="$HOME/.local/bin:$PATH"
direnv hook fish | source
