return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		lang = "python3", -- Change to your preferred language

		plugins = {
			non_standalone = true,
		},
	},
	keys = {
		{ "<leader>lm", "<cmd>Leet<cr>", desc = "Leetcode menu" },
		{ "<leader>ll", "<cmd>Leet list<cr>", desc = "List problems" },
		{ "<leader>lr", "<cmd>Leet run<cr>", desc = "Run code" },
		{ "<leader>ls", "<cmd>Leet submit<cr>", desc = "Submit solution" },
	},
}
