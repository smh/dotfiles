let g:mapleader = ' '

set hidden " Required for operations modifying multiple buffers like rename.

" enable mouse scrolling and selection
set mouse=a

set list
set relativenumber number
set autowrite
set smartcase
set expandtab
set softtabstop=2
set shiftwidth=2
set smartindent
set cursorline
set lazyredraw
" set backspace=2
set hlsearch
if has('nvim')
  set inccommand=nosplit
endif

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

set signcolumn=yes

" More natural split opening.
set splitbelow
set splitright

" Show leader key
set showcmd

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

set undofile
set undodir="$HOME/.config/.vim_undo_files"

set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
