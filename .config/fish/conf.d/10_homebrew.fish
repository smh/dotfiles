if status --is-interactive
  eval (/opt/homebrew/bin/brew shellenv)
  # ensure homebrew installed binaries take precedence
  fish_add_path /opt/homebrew/bin
end
