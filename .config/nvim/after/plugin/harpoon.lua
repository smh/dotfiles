local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'

vim.keymap.set('n', 'gh', mark.add_file, { desc = 'Harpoon add file' })
vim.keymap.set('n', 'gH', ui.toggle_quick_menu, { desc = 'Harpoon quick menu' })
vim.keymap.set('n', ']h', ui.nav_next, { desc = 'Harpoon next' })
vim.keymap.set('n', '[h', ui.nav_next, { desc = 'Harpoon prev' })
