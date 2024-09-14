return {
  "folke/which-key.nvim",
  "airblade/vim-rooter",
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
  -- "nvim-tree/nvim-web-devicons",
  "echasnovski/mini.icons",
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = { enable = true, },
        indent = { enable = true, },
        -- cannot get line_num to work
        line_num = {
          enabled = true,
          use_treesitter = true,
          -- style = "#806d9c",
          style = "#ff0000",
        },
      }, 100)
    end
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup({
        user_default_options = {
          css = true,           -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true,        -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes for `mode`: foreground, background,  virtualtext
          mode = "virtualtext", -- Set the display mode.
          tailwind = 'both',                               -- Enable tailwind colors
          -- parsers can contain values used in |user_default_options|
          sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
          virtualtext = "■",
        }
      })
    end
  },
}
