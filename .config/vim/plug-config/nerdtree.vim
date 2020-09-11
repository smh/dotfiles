let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  : '✹',
    \ 'Staged'    : '⊕',
    \ 'Untracked' : '⭒',
    \ 'Renamed'   : '→',
    \ 'Unmerged'  : '═',
    \ 'Deleted'   : '✖',
    \ 'Dirty'     : '✗',
    \ 'Clean'     : '✔︎',
    \ 'Ignored'   : '◌',
    \ 'Unknown'   : '?'
    \ }

" Close nerdtree after opening file
let NERDTreeQuitOnOpen = 1

autocmd vimrc FileType nerdtree setlocal nolist

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

map <leader>n :NERDTreeFind<CR>
