local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.backspace = 'indent,eol,start'

opt.hlsearch = false
opt.smartcase = true
opt.ignorecase = true
opt.inccommand = 'split'

opt.scrolloff = 8

-- More natural split opening.
opt.splitbelow = true
opt.splitright = true

opt.equalalways = true -- Multiple windows, when created, are equal in size

-- Show leader key
opt.showcmd = true

opt.list = true
opt.listchars = {
  tab = '»·',
  trail = '·',
  extends = '→',
  precedes = '←',
  nbsp = '·',
}
opt.fillchars = { vert = '│', fold = '›' }

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath('data') .. '/undodir'
opt.autowrite = true

opt.isfname:append('@-@')

opt.hidden = true -- Required for operations modifying multiple buffers like rename.

opt.mouse = 'a' -- enable mouse scrolling and selection

opt.cursorline = true
opt.signcolumn = 'yes'
opt.lazyredraw = true
opt.termguicolors = true


opt.cmdheight = 2 -- Better display for messages


opt.shortmess:append('c') -- don't give |ins-completion-menu| messages.

opt.updatetime = 50 -- Faster completion
opt.timeoutlen = 500 -- By default timeoutlen is 1000 ms

-- Some servers have issues with backup files, see #649
--opt.backup = false
--opt.writebackup = false

