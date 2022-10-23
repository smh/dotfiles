-- bootstrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- automatically run PackerCompile whenever this file is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer = require('packer')
packer.init {
  max_jobs = 5, -- max jobs to get around slow and buggy proxy
}

return packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'edkolev/tmuxline.vim'

  use 'tpope/vim-commentary'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-obsession'
  use 'tpope/vim-sensible'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-speeddating'

  -- use 'liskin/vim-fubitive' -- bitbucket support for fugitive Gbrowse

  use 'scrooloose/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use {
    'kyazdani42/nvim-web-devicons',
    config = function () require 'nvim-web-devicons'.setup { default = true } end,
  }

  use {
    'chriskempson/base16-vim',
    config = function() require 'config.base16' end
  }
  use {
    'vimwiki/vimwiki',
    config = function() vim.g.vimwiki_list = { { path = '~/Dropbox/Private/vimwiki' } } end,
  }

  -- use 'sheerun/vim-polyglot'

  use 'rescript-lang/vim-rescript'

  use 'editorconfig/editorconfig-vim'
  use 'airblade/vim-rooter'

  use 'mhinz/vim-signify'

  use 'mbbill/undotree'

  -- use 'gorodinskiy/vim-coloresque'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require 'colorizer'.setup() end
  }
  -- use {
  --   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  --   config = function() require('gitsigns').setup() end
  -- }

  -- use 'junegunn/fzf', { 'do': { -> fzf#install() } }
  -- use 'junegunn/fzf.vim'
  -- use 'stsewd/fzf-checkout.vim'

  use 'junegunn/gv.vim'
  use 'junegunn/vim-slash'
  -- use 'junegunn/limelight.vim'
  use 'junegunn/rainbow_parentheses.vim'
  use 'junegunn/vim-journal'

  -- use 'w0rp/ale'

  use 'christoomey/vim-tmux-navigator'

  -- use 'neoclide/coc.nvim', {'branch': 'release'}

  -- use 'SirVer/ultisnips'
  -- use 'honza/vim-snippets'

  -- use 'ludovicchabant/vim-gutentags'

  use 'machakann/vim-highlightedyank'

  use 'liuchengxu/vim-which-key'

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require 'config.treesitter' end,
    run = ':TSUpdate',
  }
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim' }},
    config = function() require 'config.telescope' end,
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'


  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use {
    'hrsh7th/nvim-cmp',
    config = function() require 'config.nvim-cmp' end,
  }
  use 'onsails/lspkind-nvim'

  -- for vsnip users
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- sample plugin config
  -- use '9mm/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  --use {
  --  'w0rp/ale',
  --  ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --  cmd = 'ALEEnable',
  --  config = 'vim.cmd[[ALEEnable]]'
  --}

  -- Plugins can have dependencies on other plugins
  -- use {
  --   'haorenW1025/completion-nvim',
  --   opt = true,
  --   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  -- }

  -- Plugins can also depend on rocks from luarocks.org:
  -- use {
  --   'my/supercoolplugin',
  --   rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  -- }

  -- You can specify rocks in isolation
  -- use_rocks 'penlight'
  -- use_rocks {'lua-resty-http', 'lpeg'}

  -- Local plugins can be included
  -- use '~/projects/personal/hover.nvim'

  -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  -- use {
  --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  -- Use dependency and run lua function after load
  -- use {
  --   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  --   config = function() require('gitsigns').setup() end
  -- }

  -- You can specify multiple plugins in a single call
  -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
