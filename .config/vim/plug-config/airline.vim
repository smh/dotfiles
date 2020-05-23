let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V-L',
    \ '^V' : 'V-B',
    \ 's'  : 'S',
    \ 'S'  : 'S-L',
    \ '^S' : 'S-B',
    \ }

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'

let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = {
      \'a'    : '#S #I:#P',
      \'b'    : '#H',
      \'c'    : '',
      \'win'  : '#I:#W#F',
      \'cwin' : '#I:#W#F',
      \'x'    : '#(~/bin/tmux-spotify-info)',
      \'y'    : "#{?client_prefix, cmd ,#{?pane_in_mode, cp }}",
      \'z'    : '%a %b %d  %H:%M '}
