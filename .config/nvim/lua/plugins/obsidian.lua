return {
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      ui = { enable = false },
      workspaces = {
        { name = "personal", path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/personal" },
        { name = "homelab", path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/homelab" },
        { name = "work", path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/work" }
      },
    },
  }
}
