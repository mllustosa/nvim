-- Show line numbers
vim.opt.nu = true
vim.opt.encoding = "utf-8"

-- Show relative line numbers
vim.opt.relativenumber = true

-- Indentation with spaces instead of tabs
-- Also, using 2 spaces instead of 4
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Enable 24 bits colors
vim.opt.termguicolors = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.g.colorizer_auto_filetype = "css,html"
