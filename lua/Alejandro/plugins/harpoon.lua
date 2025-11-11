return {
	"thePrimeagen/harpoon",
	enabled = true,
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	-- Lazy load on these keys instead of at startup
	keys = {
		{ "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon add file" },
		{ "<leader>h", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
		{ "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Harpoon file 1" },
		{ "<C-j>", function() require("harpoon"):list():select(2) end, desc = "Harpoon file 2" },
		{ "<C-k>", function() require("harpoon"):list():select(3) end, desc = "Harpoon file 3" },
		{ "<C-l>", function() require("harpoon"):list():select(4) end, desc = "Harpoon file 4" },
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			global_settings = {
				save_on_toggle = true,
				save_on_change = true,
			},
		})
	end,
}
