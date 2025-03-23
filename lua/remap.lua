-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use move command to move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep on the same spot when join lines
vim.keymap.set("n", "J", "mzJ`z")

-- `Ctrl + c` to escape insert mode. Useful on visual block mode.
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Paste without yanking the selection
vim.keymap.set("x", "<leader>p", '"_dP')

-- Keep cursor centered when page up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Yank but don't copy the selection
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank but don't copy the selection" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank but don't copy the selection" })

-- Refresh syntax highlighting
vim.keymap.set("n", "<leader>tr", ":write | edit | TSBufEnable highlight<CR>", { desc = "Refresh syntax highlighting" })

-- Restart LSP
vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "Restart LSP" })

-- Unbind the command-line window history
vim.keymap.set("n", "q:", "<Nop>", { noremap = true, silent = true })

-- Kill current buffer
vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Kill the current buffer" })

-- Kill all buffers except the current one
vim.keymap.set("n", "<leader>Q", ":%bd|e#|bd#<CR>", { desc = "Kill all buffers except the current one" })

-- Toggle git blame
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", {})

-- Find and replace
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Delete without yanking
-- vim.keymap.set("n", "x", "\"_x")
-- vim.keymap.set("n", "X", "\"_X")
-- vim.keymap.set("n", "d", "\"_d")
-- vim.keymap.set("v", "d", "\"_d")
-- vim.keymap.set("n", "D", "\"_D")

-- Keep selected text when yanking
-- vim.keymap.set("v", "y", "ygv")
