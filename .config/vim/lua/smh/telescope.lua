local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local utils = require('telescope.utils')

local conf = require('telescope.config').values

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

require('telescope').load_extension('fzy_native')

local M = {}

M.project_files = function(opts)
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

M.yadm_files = function(opts)
  local show_untracked = utils.get_default(opts.show_untracked, false)
  local recurse_submodules = utils.get_default(opts.recurse_submodules, false)
  if show_untracked and recurse_submodules then
    error("Git does not suppurt both --others and --recurse-submodules")
  end

  -- By creating the entry maker after the cwd options,
  -- we ensure the maker uses the cwd options when being created.
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)

  pickers.new(opts, {
    prompt_title = 'Yadm Files',
    finder = finders.new_oneshot_job(
      vim.tbl_flatten( {
        "yadm", "ls-files", "--exclude-standard", "--cached",
        show_untracked and "--others" or nil,
        recurse_submodules and "--recurse-submodules" or nil
      } ),
      opts
    ),
    previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts),
  }):find()
end

return M
