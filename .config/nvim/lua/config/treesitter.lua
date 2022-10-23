local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = { "bash", "c", "clojure", "css", "dockerfile", "elixir", "fish", "go", "html", "java", "javascript", "json", "json5", "kotlin", "ledger", "lua", "ocaml", "ocaml_interface", "python", "scss", "tsx", "typescript", "vim", "yaml" },
  highlight = {
    enable = true,
  }
}
