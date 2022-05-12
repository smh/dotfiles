local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local utils = require('telescope.utils')

require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_zorter,
    color_devicons = true,

    -- file_previewer = previewers.vim_buffer_cat.new,
    -- grep_previewer = previewers.vim_buffer_vimgrep.new,
    -- qflist_previewer = previewers.vim_buffer_qflist.new,

    mappings = {
      i = {
        -- ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      }
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

nnoremap('<C-p>', [[<cmd>lua require('smh.telescope').project_files()<cr>]])

nnoremap('<leader>pb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]])
nnoremap('<leader>pd', [[<cmd>lua require('smh.telescope').yadm_files({})<cr>]])
nnoremap('<leader>pv', [[<cmd>lua require('smh.telescope').yadm_files({ cwd = "$HOME/.config/nvim" })<cr>]])
nnoremap('<leader>pf', [[<cmd>lua require('telescope.builtin').find_files()<cr>]])
nnoremap('<leader>ph', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]])
nnoremap('<leader>ps', [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For> ")})<cr>]])
nnoremap('<leader>pw', [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>)})<cr>]])

