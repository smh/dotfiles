return {
  { "folke/lazydev.nvim", ft = "lua" },
  { "j-hui/fidget.nvim", opts = {} },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    lazy = true,
    config = false,
  },
  {
      "williamboman/mason.nvim",
      lazy = false,
      config = true,
  },
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      -- Snippets
      {"L3MON4D3/LuaSnip"},
      {"rafamadriz/friendly-snippets"},
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        sources = {
          {name = "nvim_lsp"},
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })
    end
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    cmd = {"LspInfo", "LspInstall", "LspStart"},
    dependencies = {
      {"hrsh7th/cmp-nvim-lsp"},
      -- {"hrsh7th/cmp-buffer"},
      -- {"hrsh7th/cmp-path"},
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      local lsp_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover(()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration(()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation(()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition(()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references(()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "gF", "<cmd>lua vim.lsp.buf.format(()<cr>", opts)
        vim.keymap.set({ 'v', 'n' }, 'gA', "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        vim.keymap.set("n", "<leader>ws", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", opts)
        vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

      -- if client.supports_method("textDocument/formatting") then
      --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      --   vim.api.nvim_create_autocmd("BufWritePre", {
      --     group = augroup,
      --     buffer = bufnr,
      --     callback = function()
      --       -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
      --       vim.lsp.buf.format({ bufnr = bufnr })
      --     end,
      --   })
      -- end
      end

      lsp_zero.extend_lspconfig({
        float_border = 'rounded',
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {
          "tsserver",
          "eslint",
          "lua_ls",
          "yamlls",
        },
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            -- if server_name == "tsserver" then
            --   server_name = "ts_ls"
            -- end
            require('lspconfig')[server_name].setup({})
          end,

          -- this is the "custom handler" for `lua_ls`
          -- lua_ls = function()
          --   require('lspconfig').lua_ls.setup({
          --     on_init = function(client)
          --       lsp_zero.nvim_lua_settings(client, {})
          --     end,
          --   })
          -- end,
        },
      })


    end
  },
}
