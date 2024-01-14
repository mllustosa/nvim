vim.g.mapleader = " "

-- Use move command to move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep on the same spot when join lines
vim.keymap.set("n", "J", "mzJ`z")

-- `Ctrl + c` to escape insert mode. Useful on visual block mode.
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Past without yanking the selection
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Delete without yanking 
vim.keymap.set("n", "x", "\"_x")
vim.keymap.set("n", "X", "\"_X")
vim.keymap.set("n", "d", "\"_d")
vim.keymap.set("v", "d", "\"_d")
vim.keymap.set("n", "D", "\"_D")

-- Keep cursor centered when page up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Select all
vim.keymap.set("n", "<leader>sa", "ggVG")

-- Rezise nvim-tree
vim.keymap.set("n", "<leader>te", ":NvimTreeResize +20<CR>")
vim.keymap.set("n", "<leader>tc", ":NvimTreeResize -20<CR>")

-- Refresh syntax highlighting
vim.keymap.set("n", "<leader>tr", ":write | edit | TSBufEnable highlight<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
