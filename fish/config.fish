if status is-interactive
  starship init fish | source
  zoxide init fish | source
  fastfetch
end

  alias lok-search="$HOME/scripts/lok-search.sh"


export PATH="$HOME/.local/bin:$PATH"
