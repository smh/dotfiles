-- install packer
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if fn.empty(fn.glob(install_path)) > 0 then
  is_bootstrap = true
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd [[packadd packer.nvim]]
end

-- automatically run PackerCompile whenever this file is updated
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer.lua source <afile> | PackerCompile
augroup end
]])

local packer = require('packer')
packer.init {
  max_jobs = 5, -- max jobs to get around slow and buggy proxy
}

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', --tag = '0.1.0', -- or , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- use({
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine')
  --   end
  -- })

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use 'nvim-treesitter/nvim-treesitter-context'

  use 'nvim-treesitter/playground'
  use 'nkrkv/nvim-treesitter-rescript'

  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'

  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
        },
        filetypes = {
          python = true,
          gitcommit = true,
          yaml = true,
          lua = true,
          javascript = true,
          typescript = true,
        },
      })
    end,
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use {
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/discussions/593
    -- :NullLsInfo
    -- format with :lua vim.lsp.buf.formatting()
    "jose-elias-alvarez/null-ls.nvim",
    -- config = function()
    --   -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save#sync-formatting
    --   local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    --   local null_ls = require("null-ls")
    --   null_ls.setup({
    --     -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
    --     sources = {
    --       null_ls.builtins.formatting.black,
    --       null_ls.builtins.diagnostics.flake8,
    --       null_ls.builtins.diagnostics.shellcheck,
    --     },

    --     -- you can reuse a shared lspconfig on_attach callback here
    --     on_attach = function(client, bufnr)
    --       if client.supports_method("textDocument/formatting") then
    --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --           group = augroup,
    --           buffer = bufnr,
    --           callback = function()
    --             -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --             vim.lsp.buf.formatting_sync()
    --           end,
    --         })
    --       end
    --     end,

    --   })
    -- end,
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use 'j-hui/fidget.nvim'

  use({
    'sQVe/sort.nvim',

    -- Optional setup for overriding defaults.
    -- config = function()
    --   require("sort").setup({
    --     -- Input configuration here.
    --     -- Refer to the configuration section below for options.
    --   })
    -- end
  })

  -- from old
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

  -- use 'scrooloose/nerdtree'
  -- use 'Xuyuanp/nerdtree-git-plugin'
  -- use 'tiagofumo/vim-nerdtree-syntax-highlight'
  -- use {
  -- 'kyazdani42/nvim-web-devicons',
  -- config = function () require 'nvim-web-devicons'.setup { default = true } end,
  -- }

  use 'chriskempson/base16-vim'

  use {
    'vimwiki/vimwiki',
    config = function() vim.g.vimwiki_list = { { path = '~/Dropbox/Private/vimwiki' } } end,
  }

  -- use 'sheerun/vim-polyglot'

  use 'rescript-lang/vim-rescript'

  use 'editorconfig/editorconfig-vim'
  use 'airblade/vim-rooter'

  use 'mhinz/vim-signify'

  -- use 'gorodinskiy/vim-coloresque'
  use {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup({
        user_default_options = {
          css = true,           -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true,        -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes for `mode`: foreground, background,  virtualtext
          mode = "virtualtext", -- Set the display mode.
          -- Available methods are false / true / "normal" / "lsp" / "both"
          -- True is same as normal
          tailwind = 'both',                             -- Enable tailwind colors
          -- parsers can contain values used in |user_default_options|
          sass = { enable = false, parsers = { css }, }, -- Enable sass colors
          virtualtext = "■",
        }
      })
    end
  }
  -- use {
  --   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  --   config = function() require('gitsigns').setup() end
  -- }

  -- use 'junegunn/fzf', { 'do': { -> fzf#install() } }
  -- use 'junegunn/fzf.vim'
  -- use 'stsewd/fzf-checkout.vim'

  use 'junegunn/gv.vim'
  -- use 'junegunn/vim-slash'
  -- use 'junegunn/limelight.vim'
  use 'junegunn/rainbow_parentheses.vim'
  -- use 'junegunn/vim-journal'

  -- use 'w0rp/ale'

  use 'alexghergh/nvim-tmux-navigation'

  -- use 'neoclide/coc.nvim', {'branch': 'release'}

  -- use 'SirVer/ultisnips'
  -- use 'honza/vim-snippets'

  -- use 'ludovicchabant/vim-gutentags'

  use 'machakann/vim-highlightedyank'

  use 'folke/which-key.nvim'

  -- use 'nvim-lua/popup.nvim'
  -- use {
  --   'nvim-telescope/telescope.nvim',
  --   requires = { {'nvim-lua/plenary.nvim' }},
  --   config = function() require 'config.telescope' end,
  -- }
  -- use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if is_bootstrap then
    require('packer').sync()
  end
end)
