if has('termguicolors')
  set termguicolors
endif

" load base16 colorscheme
if filereadable(expand('~/.vimrc_background'))
  " let g:base16colorspace=256
  source ~/.vimrc_background
endif
