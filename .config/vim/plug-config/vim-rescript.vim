" Note that <buffer> allows us to use different commands with the same keybindings depending
" on the filetype. This is useful if to override your e.g. ALE bindings while working on
" ReScript projects.
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>f :RescriptFormat<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>t :RescriptTypeHint<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>c :RescriptBuild<CR>
autocmd FileType rescript nnoremap <silent> <buffer> gd :RescriptJumpToDefinition<CR>

" Hooking up the ReScript autocomplete function
set omnifunc=rescript#Complete

" When preview is enabled, omnicomplete will display additional
" information for a selected item
set completeopt+=preview

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

function! SwitchRescriptJavascript()
  "update!
  if (expand ("%:e") == "res")
    find %:t:r.bs.js
  else
    " let l:bsfile = substitute("%", ".bs.js", ".res")
    find %:s/.bs.js/.res/
  endif
endfunction

autocmd FileType rescript nnoremap <silent> <buffer> <localleader>j :call SwitchRescriptJavascript()<CR>
autocmd FileType javascript nnoremap <silent> <buffer> <localleader>j :call SwitchRescriptJavascript()<CR>
