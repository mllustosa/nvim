return {
	"ThePrimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		local map = function(keys, index)
			vim.keymap.set("n", keys, function()
				ui.nav_file(index)
			end, { desc = "Navigate to Harpoon file (" .. index .. ")" })
		end

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[A]dd file to harpoon" })
		vim.keymap.set("n", "<leader><leader>", ui.toggle_quick_menu, { desc = "Toggle harpoon" })

		map("<C-H>", 1)
		map("<C-J>", 2)
		map("<C-K>", 3)
		map("<C-L>", 4)
	end,
}
