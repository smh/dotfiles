return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-context" },
      { "nvim-treesitter/playground" },
      { "rescript-lang/tree-sitter-rescript" },
    },
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          -- "help",
          "c",
          "fish",
          "html",
          "java",
          "javascript",
          "json",
          "kotlin",
          "lua",
          "ocaml",
          "ocaml_interface",
          "rescript",
          "rust",
          "sql",
          "tmux",
          "typescript",
          "vim",
          "yaml",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
