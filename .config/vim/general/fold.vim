" let g:sh_fold_enabled=1         " sh
" let g:vimsyn_folding='af'       " Vim script
"
set foldmethod=syntax
"set foldlevelstart=1

autocmd Syntax c,cpp,vim,xml,html setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,ledger,javascript,typescript,typescriptreact normal zR

