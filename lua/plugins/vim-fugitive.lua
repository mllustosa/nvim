return {
	"tpope/vim-fugitive",
	dependencies = { "tpope/vim-rhubarb" },
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })
		vim.keymap.set("n", "<leader>go", ":.GBrowse<CR>", { desc = "[G]it [O]Open" })
		vim.keymap.set("v", "<leader>go", ":GBrowse<CR>", { desc = "[G]it [O]Open" })
	end,
}
