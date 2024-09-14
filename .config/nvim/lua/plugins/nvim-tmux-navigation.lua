return {
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nav = require("nvim-tmux-navigation")
      nav.setup {
        disable_when_zommed = false,
        keybindings = {
            left = "<C-h>",
            down = "<C-j>",
            up = "<C-k>",
            right = "<C-l>",
            last_active = "<C-\\>",
            -- next = "<C-Space>",
        },
      }
    end,
  }
}
