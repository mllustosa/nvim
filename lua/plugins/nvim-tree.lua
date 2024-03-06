return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- Set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			-- Default mappings
			api.config.mappings.default_on_attach(bufnr)
			vim.keymap.set("n", "<leader>e", api.tree.toggle, { desc = "Toggle [e]xplorer" })

			-- Rezise nvim-tree
			vim.keymap.set("n", "<leader>th", ":NvimTreeResize +20<CR>", { desc = "Increase size" })
			vim.keymap.set("n", "<leader>tl", ":NvimTreeResize -20<CR>", { desc = "Decrease size" })
		end

		-- Setup with some options
		require("nvim-tree").setup({
			sync_root_with_cwd = true,
			sort = {
				sorter = "case_sensitive",
			},
			update_focused_file = {
				enable = true,
				update_root = true,
				ignore_list = { "help" },
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			view = {
				width = 50,
				side = "right",
			},
			on_attach = on_attach,
			renderer = {
				group_empty = false,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			filters = {
				dotfiles = true,
				custom = {
					--  "\\v.*\\.d\\.ts$"
				},
			},
		})
	end,
}
