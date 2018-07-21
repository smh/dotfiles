set encoding=utf-8
scriptencoding utf-8

augroup vimrc
  autocmd!
augroup END

" Attempt to support XDG_CONFIG_HOME
" Environment
"set directory=$XDG_CACHE_HOME/vim,~/,/tmp
"set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
"set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
"set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
"let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

if &shell =~# 'fish$'
  set shell=sh
endif

let g:python_host_prog = '/Users/smh/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/smh/.pyenv/versions/neovim3/bin/python'

language en_US.UTF-8

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent! execute '!curl --create-dirs -fsSLo ~/.local/share/nvim/site/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd vimrc VimEnter * silent! PlugInstall
endif

" https://www.reddit.com/r/vim/wiki/vimrctips#wiki_you_don.27t_need_set_nocompatible
"set nocompatible
"filetype off

" Setup vim-plug ----------------------------{{{
call plug#begin('~/.config/vim/plugged')

Plug 'jreybert/vimagit'

" Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-obsession'
if !has('nvim')
  Plug 'tpope/vim-sensible'
endif
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/syntastic'
"Plug 'majutsushi/tagbar'
" Plug 'jeetsukumaran/vim-buffergator'
"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'vimwiki/vimwiki'
"Plug 'skammer/vim-css-color' " causing slow loading of html files
"Plug 'basepi/vim-conque'
"Plug 'skwp/vim-ruby-conque'
"Plug 'godlygeek/tabular'
Plug 'ledger/vim-ledger'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
autocmd vimrc BufNewFile,BufRead *.json setf json
Plug 'editorconfig/editorconfig'
Plug 'airblade/vim-gitgutter'

Plug 'mbbill/undotree'

Plug 'gorodinskiy/vim-coloresque'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-slash'
Plug 'junegunn/limelight.vim'
" Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-journal'

Plug 'sbdchd/neoformat'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'w0rp/ale'

Plug 'mattn/emmet-vim'

" Clojure stuff
"Plug 'guns/vim-clojure-static'
"Plug 'kien/rainbow_parentheses.vim'
"Plug 'tpope/vim-fireplace'
"Plug 'tpope/vim-leiningen'
"Plug 'vim-scripts/paredit.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'wakatime/vim-wakatime'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim'
" endif

Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'jaawerth/nrun.vim' " which and exec functions targeted at node projects

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'wilriker/vim-fish'

Plug 'tomlion/vim-solidity'

Plug 'reasonml-editor/vim-reason-plus'

" LanguageClient plugin
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" function signatures from completions in command line
Plug 'Shougo/echodoc.vim'

" completion
Plug 'ncm2/ncm2'
" ncm2 requires nvim-yarp
Plug 'roxma/nvim-yarp'

Plug 'machakann/vim-highlightedyank'

call plug#end()
" }}}
"
" Settings -------------------------{{{
"filetype plugin indent on

" enable mouse scrolling and selection
set mouse=a

if !exists('g:syntax_on')
    syntax enable
endif

set list
set relativenumber number
set autowrite
set incsearch
set smartcase
set expandtab
set softtabstop=2
set shiftwidth=2
set cursorline
set laststatus=2
set lazyredraw
set backspace=2
set hlsearch
if has('nvim')
  set inccommand=nosplit
endif

" LanuageClient ***************************************************************
" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Minimal LSP configuration for JavaScript
" let g:LanguageClient_serverCommands = {}
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

if executable('javascript-typescript-stdio')
  " let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " let g:LanguageClient_serverCommands['javascript.jsx']= ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif

" <leader>ld to go to definition
autocmd FileType javascript,javascript.jsx nnoremap <buffer>
  \ <leader>ld :call LanguageClient_textDocument_definition()<cr>
" <leader>lh for type info under cursor
autocmd FileType javascript,javascript.jsx nnoremap <buffer>
  \ <leader>lh :call LanguageClient_textDocument_hover()<cr>
" <leader>lr to rename variable under cursor
autocmd FileType javascript,javascript.jsx nnoremap <buffer>
  \ <leader>lr :call LanguageClient_textDocument_rename()<cr>

" <leader>lf to fuzzy find the symbols in the current document
autocmd FileType javascript,javascript.jsx nnoremap <buffer>
  \ <leader>lf :call LanguageClient_textDocument_documentSymbol()<cr>

autocmd FileType reason,javascript,javascript.jsx nnoremap <buffer>
  \ gd :call LanguageClient_textDocument_definition({'gotoCmd': 'split'})<cr>
autocmd FileType reason,javascript,javascript.jsx nnoremap <buffer>
  \ gD :call LanguageClient_textDocument_documentSymbol()<cr>
autocmd FileType reason,javascript,javascript.jsx nnoremap <buffer>
  \ gf :call LanguageClient_textDocument_formatting()<cr>
autocmd FileType reason,javascript,javascript.jsx nnoremap <buffer>
  \ <cr> :call LanguageClient_textDocument_hover()<cr>
autocmd FileType reason,javascript,javascript.jsx nnoremap <buffer>
  \ gr :call LanguageClient_textDocument_rename()<cr>
autocmd FileType reason,javascript,javascript.jsx nnoremap <buffer>
  \ gm :call LanguageClient_contextMenu()<cr>

" Required for operations modifying multiple buffers like rename.
set hidden
set signcolumn=yes

" Ultisnips *******************************************************************
" Trigger configuration
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Show tabs and trailing spaces
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && v:version >= 700
  "set listchars=tab:›,trail:·
  "let &listchars = "tab:\u21e5\u00b7,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  let &listchars = "tab:\u203a\u00b7,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  let &fillchars = "vert:\u259a,fold:\u00b7"
else
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif

let g:mapleader = ' '

map <leader>n :NERDTreeFocus<CR>
map <leader>v :vsplit<CR>
map <leader>h :split<CR>
"map <leader>m :TagbarToggle<CR>

map <leader>gs :Gstatus<CR>

map <a-/> <Plug>NERDCommenterToggle
map <c-_> <Plug>NERDCommenterToggle
"}}}
"
" Color ---------------------------------{{{
" Fix highlighting for spell checks in terminal
function! s:base16_customize() abort
  " Colors: https://github.com/chriskempson/base16/blob/master/styling.md
  " Arguments: group, guifg, guibg, ctermfg, ctermbg, attr, guisp
  call Base16hi("SpellBad",   "", "", "", g:base16_cterm01, "", "")
  call Base16hi("SpellCap",   "", "", "", g:base16_cterm01, "", "")
  call Base16hi("SpellLocal", "", "", "", g:base16_cterm01, "", "")
  call Base16hi("SpellRare",  "", "", "", g:base16_cterm01, "", "")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END
"set background=dark
"let g:solarized_termcolors=16
"let g:solarized_visibility="high"
"let g:solarized_contrast="high"
"color solarized

"set background=dark
"let base16colorspace=256
"colorscheme base16-default-dark


" load base16 colorscheme
if filereadable(expand('~/.vimrc_background'))
  let g:base16colorspace=256
  source ~/.vimrc_background
endif

"}}}

set undofile
set undodir="$HOME/.config/.vim_undo_files"

" Remember cursor position between vim sessions
autocmd vimrc BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
            " center buffer around cursor when opening files
autocmd vimrc BufRead * normal zz

set foldmethod=syntax
"set foldlevelstart=1
"
autocmd vimrc Syntax javascript,json,c,java,ruby,python,clojure normal zR

let g:javaScript_fold=1         " JavaScript
let g:perl_fold=1               " Perl
let g:php_folding=1             " PHP
let g:r_syntax_folding=1        " R
let g:ruby_fold=1               " Ruby
let g:sh_fold_enabled=1         " sh
let g:vimsyn_folding='af'       " Vim script
" let xml_syntax_folding=1      " XML

let g:jsx_ext_required = 0

"let g:syntastic_mode_map = { 'mode': 'active',
"                           \ 'active_filetypes': ['foo', 'bar'],
"                           \ 'passive_filetypes': ['java'] }

"au FileType javascript call JavaScriptFold()
"

let g:syntastic_html_tidy_ignore_errors=[' proprietary attribute ']
"let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

let g:ledger_fillstring = '·'

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

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
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

call airline#parts#define_raw('linenr', '%l')
call airline#parts#define_accent('linenr', 'bold')
" let g:airline_section_z = airline#section#create(['%2p%%', g:airline_symbols.linenr .'', 'linenr', ':%c'])
let g:airline_section_z = airline#section#create(['%2p%% ', 'linenr', ':%c'])

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_skip_empty_sections = 1

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

" enable ncm2 for all buffer
autocmd BufEnter * call ncm2#enable_for_buffer()

" note that must keep noinsert in completeopt, the others is optional
set completeopt=noinsert,menuone,noselect
set shortmess+=c

" UltiSnips config
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_map_keys=1
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  let g:tern#command = ['tern']
  let g:tern#arguments = ['--persistent']

  autocmd omnifuncs FileType javascript setlocal omnifunc=tern#Complete
endif

" update navigation keys
"for dir in ["h", "j", "k", "l"]
  "execute "nnoremap" "<silent>" "<c-" . dir . ">" "<c-w>" . dir
  "execute "vnoremap" "<silent>" "<c-" . dir . ">" "<c-\><c-n><c-w>" . dir . ">"
  "execute "inoremap" "<silent>" "<c-" . dir . ">" "<c-\><c-n><c-w>" . dir . ">"
  "execute "cnoremap" "<silent>" "<c-" . dir . ">" "<c-\><c-n><c-w>" . dir . ">"
  "if has('nvim')
    "execute "tnoremap" "<c-" . dir . ">" "<c-\><c-n><c-w>" . dir . ">"
  "endif
"endfor
"if has('nvim')
  "au WinEnter *pid:* call feedkeys('i')
"endif
nnoremap <silent> <a-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <a-j> :TmuxNavigateDown<cr>
nnoremap <silent> <a-k> :TmuxNavigateUp<cr>
nnoremap <silent> <a-l> :TmuxNavigateRight<cr>
nnoremap <silent> <a-\\> :TmuxNavigatePrevious<cr>
vnoremap <a-h> <c-\><c-n>:TmuxNavigateLeft<cr>
vnoremap <a-j> <c-\><c-n>:TmuxNavigateDown<cr>
vnoremap <a-k> <c-\><c-n>:TmuxNavigateUp<cr>
vnoremap <a-l> <c-\><c-n>:TmuxNavigateRight<cr>
vnoremap <a-\\> <c-\><c-n>:TmuxNavigatePrevious<cr>
inoremap <a-h> <c-\><c-n>:TmuxNavigateLeft<cr>
inoremap <a-j> <c-\><c-n>:TmuxNavigateUp<cr>
inoremap <a-k> <c-\><c-n>:TmuxNavigateDown<cr>
inoremap <a-l> <c-\><c-n>:TmuxNavigateRight<cr>
inoremap <a-\\> <c-\><c-n>:TmuxNavigatePrevious<cr>
cnoremap <a-h> <c-\><c-n>:TmuxNavigateLeft<cr>
cnoremap <a-j> <c-\><c-n>:TmuxNavigateUp<cr>
cnoremap <a-k> <c-\><c-n>:TmuxNavigateDown<cr>
cnoremap <a-l> <c-\><c-n>:TmuxNavigateRight<cr>
cnoremap <a-\\> <c-\><c-n>:TmuxNavigatePrevious<cr>
if has('nvim')
  tnoremap <a-j> <c-\><c-n>:TmuxNavigateLeft<cr>
  tnoremap <a-k> <c-\><c-n>:TmuxNavigateUp<cr>
  tnoremap <a-h> <c-\><c-n>:TmuxNavigateDown<cr>
  tnoremap <a-l> <c-\><c-n>:TmuxNavigateRight<cr>
  autocmd vimrc WinEnter *pid:* call feedkeys('i')
endif

"nnoremap <a-j> <c-w>j
"nnoremap <a-k> <c-w>k
"nnoremap <a-h> <c-w>h
"nnoremap <a-l> <c-w>l
"vnoremap <a-j> <c-\><c-n><c-w>j
"vnoremap <a-k> <c-\><c-n><c-w>k
"vnoremap <a-h> <c-\><c-n><c-w>h
"vnoremap <a-l> <c-\><c-n><c-w>l
"inoremap <a-j> <c-\><c-n><c-w>j
"inoremap <a-k> <c-\><c-n><c-w>k
"inoremap <a-h> <c-\><c-n><c-w>h
"inoremap <a-l> <c-\><c-n><c-w>l
"cnoremap <a-j> <c-\><c-n><c-w>j
"cnoremap <a-k> <c-\><c-n><c-w>k
"cnoremap <a-h> <c-\><c-n><c-w>h
"cnoremap <a-l> <c-\><c-n><c-w>l
"if has('nvim')
  "tnoremap <a-j> <c-\><c-n><c-w>j
  "tnoremap <a-k> <c-\><c-n><c-w>k
  "tnoremap <a-h> <c-\><c-n><c-w>h
  "tnoremap <a-l> <c-\><c-n><c-w>l
  "au WinEnter *pid:* call feedkeys('i')
"endif

" nerdtree-git-plugin symbols{{{
let g:NERDTreeIndicatorMapCustom = {
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
"}}}

"set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h11
set guifont=Mononoki-Regular\ Nerd\ Font\ Complete\ Mono:h11

let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

autocmd vimrc FileType nerdtree setlocal nolist

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" vim-prettier
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Neoformat -----------------------------------{{{
augroup NeoFormatPrettier
  autocmd BufWritePre *.js,*.jsx,*.re Neoformat
  " autocmd FileType javascript,javascript.jsx,jsx setlocal formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma\ all
augroup END
" Use formatprg when available
let g:neoformat_try_formatprg = 1
" let g:neoformat_only_msg_on_error = 1
" }}}
" Neomake ------------------------------------{{{

" function! s:findRootPackageJsonFolder() abort
"   " Try to use nearest first; findfile .; goes from current file upwards
"   let l:filepath = findfile('package.json', '.;')
"   if empty(l:filepath)
"     return ''
"   else
"     return fnamemodify(resolve(expand(l:filepath)), ':h')
"   endif
" endfunction

" Sets b:neomake_javascript_enabled_makers based on what is present in the
" project
" function! s:setupEslint() abort
"     if !exists('b:neomake_javascript_eslint_exe')
"       let l:rootFolder = s:findRootPackageJsonFolder()
"       let l:eslint = l:rootFolder . '/node_modules/eslint/bin/eslint.js'
"       if !empty(l:rootFolder)
"         if filereadable(l:eslint)
"           let b:neomake_javascript_eslint_exe = l:eslint
"         else
"           let b:neomake_javascript_eslint_exe = 'eslint'
"         endif
"       else
"         let b:neomake_javascript_eslint_exe = 'eslint'
"       endif
"     endif
" endfunction

" autocmd! BufNewFile,BufReadPre * call s:setupEslint()

" autocmd! BufWritePost,BufEnter * Neomake
" let g:neomake_javascript_enabled_makers = ['eslint']
" "let g:neomake_javascript_eslint_exe = system('npm root') .'/eslint/bin/eslint.js'
" "let g:neomake_javascript_maker = 'npm run lint'
" "let g:neomake_open_list = '2
" "let g:neomake_javascript_eslint_maker = {
"   "\ 'exe': 'yarn',
"   "\ 'args': ['run', 'lint', '--', '-f', 'compact'],
"   "\ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,%W%f: line %l\, col %c\, Warning - %m'
"   "\ }
" let g:neomake_javascript_maker = {
"   \ 'exe': 'yarn',
"   \ 'args': ['run', 'lint', '--', '-f', 'compact'],
"   \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,%W%f: line %l\, col %c\, Warning - %m'
"   \ }


"}}}

" Ale ---------------------------------------- {{{
let g:ale_sign_error = '◉'
let g:ale_sign_warning = '◉'
highlight ALEErrorSign ctermfg=red ctermbg=18
"}}}

" emmet-vim ---------------------------------- {{{
" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
"}}}
" VimWiki ------------------------------------ {{{
let g:vimwiki_list = [{'path': '~/Dropbox (Personal)/Private/vimwiki'}]
if has('win32unix')
  let g:vimwiki_list = [{'path': '~/vimwiki'}]
endif
"}}}

" Use DiffOrig to view diff after recovery --- {{{
if !exists(':DiffOrig')
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif
"}}}

" Fzf ---------------------------------------- {{{
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir GitFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
"
" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                 <bang>0)

fun! FzfOmniFiles()
  let s:is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles
  endif
endfun

nnoremap <leader>b :Buffers<CR>
nnoremap <C-g>a :Ag<CR>
nnoremap <C-g>r :Rg<CR>
nnoremap <C-g>h :BCommits<CR>
nnoremap <C-g>g :Commits<CR>
nnoremap <leader><leader> :Commands<CR>
nnoremap <C-p> :call FzfOmniFiles()<CR>

nnoremap <leader>s :source ~/.config/vim/init.vim<CR>
" nnoremap <leader>f :call FzfOmniFiles()<cr>
"}}}
"
" session options ---------------------------- {{{
set sessionoptions=options " don't save options and mappings
set sessionoptions=folds
"}}}

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
