vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.hidden = true -- Required for operations modifying multiple buffers like rename.

-- enable mouse scrolling and selection
vim.opt.mouse = 'a'

vim.opt.list = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.autowrite = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.lazyredraw = true
-- vim.opt.backspace = 2
vim.opt.hlsearch = true
vim.opt.inccommand = 'split'
vim.opt.termguicolors = true

-- Better display for messages
vim.opt.cmdheight = 2

-- don't give |ins-completion-menu| messages.
vim.opt.shortmess:append('c')

vim.opt.signcolumn = 'yes'

-- More natural split opening.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Show leader key
vim.opt.showcmd = true

-- Multiple windows, when created, are equal in size
vim.opt.equalalways = true

vim.opt.listchars = {
  tab = '»·',
  trail = '·',
  extends = '→',
  precedes = '←',
  nbsp = '·',
}
vim.opt.fillchars = { vert = '│', fold = '›' }

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'

vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- By default timeoutlen is 1000 ms

-- Some servers have issues with backup files, see #649
--vim.opt.backup = false
--vim.opt.writebackup = false

