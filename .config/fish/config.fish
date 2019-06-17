if status --is-interactive
  set -g EDITOR nvim
  set -g FZF_TMUX 1

  set PATH ~/bin $PATH
  if not test -f ~/.base16_theme
    base16 ocean
  end
  sh ~/.base16_theme

  command --search direnv >> /dev/null; and eval (direnv hook fish)

  alias vi=nvim
  alias dc=docker-compose
  alias dm=docker-machine

  #fish_vi_cursor
end

