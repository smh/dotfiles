" see https://github.com/rescript-lang/vim-rescript#configuration-with-coc-vim-experimental
let g:rescript_type_hint_bin = "~/src/reason-language-server/bin.exe"

" Note that <buffer> allows us to use different commands with the same keybindings depending
" on the filetype. This is useful if to override your e.g. ALE bindings while working on
" ReScript projects.
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>f :RescriptFormat<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>t :RescriptTypeHint<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>c :RescriptBuild<CR>
autocmd FileType rescript nnoremap <silent> <buffer> gd :RescriptJumpToDefinition<CR>


" autocmd FileType rescript nnoremap <silent> <buffer> <localleader>ri :find %:t:r.res.resi<CR>
" autocmd FileType rescript nnoremap <silent> <buffer> <localleader>rs :find %:t:r.res.resi<CR>

function! SwitchRescriptImplInterface()
  "update!
  if (expand ("%:e") == "res")
    find %:t:r.resi
  else
    find %:t:r.res
  endif
endfunction

autocmd FileType rescript nnoremap <silent> <buffer> <localleader>i :call SwitchRescriptImplInterface()<CR>
