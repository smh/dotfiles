vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.backspace = 'indent,eol,start'

vim.opt.hlsearch = false
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

vim.opt.scrolloff = 8

-- More natural split opening.
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.equalalways = true -- Multiple windows, when created, are equal in size

-- Show leader key
vim.opt.showcmd = true

vim.opt.list = true
vim.opt.listchars = {
  tab = '»·',
  trail = '·',
  extends = '→',
  precedes = '←',
  nbsp = '·',
}
vim.opt.fillchars = { vert = '│', fold = '›' }

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'
vim.opt.autowrite = true

vim.opt.isfname:append('@-@')

vim.opt.hidden = true -- Required for operations modifying multiple buffers like rename.

vim.opt.mouse = 'a' -- enable mouse scrolling and selection

vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.lazyredraw = true
vim.opt.termguicolors = true


vim.opt.cmdheight = 2 -- Better display for messages


vim.opt.shortmess:append('c') -- don't give |ins-completion-menu| messages.

vim.opt.updatetime = 50 -- Faster completion
vim.opt.timeoutlen = 500 -- By default timeoutlen is 1000 ms

-- Some servers have issues with backup files, see #649
--vim.opt.backup = false
--vim.opt.writebackup = false

