" auto-install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.github.com/junegunn/vim-plug/master/plug.vim
  autocmd vimrc VimEnter * PlugInstall --sync || source $MYVIMRC
endif

" Setup vim-plug ----------------------------{{{
call plug#begin('~/.config/vim/plugged')

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'edkolev/tmuxline.vim'

  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-speeddating'

  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'


  Plug 'chriskempson/base16-vim'
  Plug 'vimwiki/vimwiki'

  Plug 'sheerun/vim-polyglot'

  Plug 'editorconfig/editorconfig'
  Plug 'airblade/vim-rooter'

  Plug 'mhinz/vim-signify'

  Plug 'mbbill/undotree'

  Plug 'gorodinskiy/vim-coloresque'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'junegunn/gv.vim'
  Plug 'junegunn/vim-slash'
  " Plug 'junegunn/limelight.vim'
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'junegunn/vim-journal'

  Plug 'sbdchd/neoformat'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'w0rp/ale'

  Plug 'christoomey/vim-tmux-navigator'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "Plug 'SirVer/ultisnips'
  "Plug 'honza/vim-snippets'

  Plug 'ludovicchabant/vim-gutentags'

  Plug 'machakann/vim-highlightedyank'

  Plug 'liuchengxu/vim-which-key'

call plug#end()
