return {
	"ThePrimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[A]dd file to harpoon" })
		vim.keymap.set("n", "<leader><leader>", ui.toggle_quick_menu, { desc = "Toggle harpoon" })

		vim.keymap.set("n", "<C-H>", function()
			ui.nav_file(1)
		end, { desc = "Navigate to Harpoon file (1)" })

		vim.keymap.set("n", "<C-J>", function()
			ui.nav_file(2)
		end, { desc = "Navigate to Harpoon file (2)" })

		vim.keymap.set("n", "<C-K>", function()
			ui.nav_file(3)
		end, { desc = "Navigate to Harpoon file (3)" })

		vim.keymap.set("n", "<C-L>", function()
			ui.nav_file(4)
		end, { desc = "Navigate to Harpoon file (4)" })
	end,
}
