if status --is-interactive
  set -g EDITOR nvim
  set -g FZF_TMUX 1

  sh ~/.base16_theme

  source (nodenv init -|psub)
  eval (direnv hook fish)

  alias vi=nvim
  alias dc=docker-compose
  alias dm=docker-machine

  fish_hybrid_key_bindings
  #fish_vi_cursor
end

