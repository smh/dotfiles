lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_zorter}})

nnoremap <C-p> :lua require('smh.telescope').project_files()<CR>

nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>pd :lua require('smh.telescope').yadm_files({})<CR>
nnoremap <leader>pv :lua require('smh.telescope').yadm_files({ cwd = "$HOME/.config/nvim" })<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>ph :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For> ")})<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>)})<CR>
