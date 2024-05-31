-- Show line numbers
vim.opt.number = true
-- vim.opt.cmdheight = 0

-- Show relative line numbers
vim.opt.relativenumber = true

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 50

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Indentation with spaces instead of tabs
-- Also, using 2 spaces instead of 4
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Automatically wrap text
vim.opt.wrap = false

-- Set undofile
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>")

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Always show the sign column, otherwise it would shift the text each time it appears
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Add colored column indicating when line should break
vim.opt.colorcolumn = "100"

-- Auto colorize files, this helps rendering the text with the color of the hex code
vim.g.colorizer_auto_filetype = "css,html"

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
