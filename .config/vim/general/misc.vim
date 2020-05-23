" " Remember cursor position between vim sessions
" autocmd vimrc BufReadPost *
"             \ if line("'\"") > 0 && line ("'\"") <= line("$") |
"             \   exe "normal! g'\"" |
"             \ endif
" " center buffer around cursor when opening files
" autocmd vimrc BufRead * normal zz

"autocmd vimrc Syntax javascript,json,c,java,ruby,python,clojure normal zR

"let g:jsx_ext_required = 0

function! DoPrettyXML() abort
  " save the filetype so we can restore it later
  let l:origft = &filetype
  set filetype=
  let l:savedview = winsaveview()
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  " vint: -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
  1s/<?xml .*?>//e
  " vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  call winrestview(l:savedview)
  " restore the filetype
  exe 'set filetype=' . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" Use DiffOrig to view diff after recovery --- {{{
if !exists(':DiffOrig')
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

" not needed with vim-sensible?
" if &shell =~# 'fish$'
"   set shell=sh
" endif
