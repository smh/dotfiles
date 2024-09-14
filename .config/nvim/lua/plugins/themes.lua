return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  -- "chriskempson/base16-vim",
  -- { 'echasnovski/mini.base16',
  --   version = false
  -- },
  {
    "xiyaowong/transparent.nvim",
    opts = {
      exclude_groups = {
        "CursorLine",
        -- "LineNr",
      },
    },
  }
}
