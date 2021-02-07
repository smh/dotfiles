if status --is-interactive
  set -g EDITOR nvim
  set -g FZF_TMUX 1

  set PATH ~/bin $PATH

  if not test -f ~/.base16_theme
    base16 ocean
  else
    sh ~/.base16_theme
  end

  alias vi=nvim
  alias dc=docker-compose
  alias dm=docker-machine
end
