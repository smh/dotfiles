if status --is-interactive
  set -g EDITOR nvim
  set -g FZF_TMUX 1

  set PATH ~/bin $PATH

  alias vi nvim
  alias dc "docker compose"
  alias dm docker-machine
end
