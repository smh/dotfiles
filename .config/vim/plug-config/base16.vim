" Fix highlighting for spell checks in terminal
" function! s:base16_customize() abort
"   " Colors: https://github.com/chriskempson/base16/blob/master/styling.md
"   " Arguments: group, guifg, guibg, ctermfg, ctermbg, attr, guisp
"   " call Base16hi("SpellBad",   "", "", g:base16_cterm08, g:base16_cterm00, "", "")
"   " call Base16hi("SpellCap",   "", "", g:base16_cterm0A, g:base16_cterm00, "", "")
"   " call Base16hi("SpellLocal", "", "", g:base16_cterm0D, g:base16_cterm00, "", "")
"   " call Base16hi("SpellRare",  "", "", g:base16_cterm0B, g:base16_cterm00, "", "")
"   call Base16hi("SpellBad",   "", "", "", g:base16_cterm01, "", "")
"   call Base16hi("SpellCap",   "", "", "", g:base16_cterm01, "", "")
"   call Base16hi("SpellLocal", "", "", "", g:base16_cterm01, "", "")
"   call Base16hi("SpellRare",  "", "", "", g:base16_cterm01, "", "")
" endfunction
"
" augroup on_change_colorschema
"   autocmd!
"   autocmd ColorScheme * call s:base16_customize()
" augroup END
" above maybe not necessary with termguicolors
set termguicolors

let base16colorspace=256

" load base16 colorscheme
if filereadable(expand('~/.vimrc_background'))
  let g:base16colorspace=256
  source ~/.vimrc_background
endif
