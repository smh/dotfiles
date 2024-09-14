return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', function(opts)
        local ok = pcall(builtin.git_files, opts)
        if not ok then
          builtin.find_files(opts)
        end
      end)
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
    end
  },
}
