function fish_default_mode_prompt --description "Display the default mode for the prompt"
  # Do nothing if not in vi mode
  if test "$fish_key_bindings" = "fish_vi_key_bindings"; or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
    switch $fish_bind_mode
      case default
        set_color --bold red
        echo -n N
        # echo -n '🅽 '
        # echo -n 🅽
      case insert
        set_color --bold green
        echo -n I
        # echo -n '🅸 '
        # echo -n 🅸
      case replace_one
        set_color --bold green
        echo -n R
        # echo -n '🆁 '
        # echo -n 🆁
      case visual
        set_color --bold brmagenta
        echo -n V
        # echo -n '🆅 '
        # echo -n 🆅
    end
    set_color normal
  end
end

