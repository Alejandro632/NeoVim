return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	keys = {
		-- Buffer/File diagnostics
		{
			"<leader>D",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer diagnostics",
		},
		-- Quickfix list
		{
			"<leader>q",
			"<cmd>Trouble quickfix toggle<cr>",
			desc = "Quickfix list",
		},
		-- Navigation keybinds
		{
			"[t",
			function()
				require("trouble").prev({ skip_groups = true, jump = true })
			end,
			desc = "Previous trouble item",
		},
		{
			"]t",
			function()
				require("trouble").next({ skip_groups = true, jump = true })
			end,
			desc = "Next trouble item",
		},
	},
	opts = {
		focus = true,
		use_diagnostic_signs = true,
	},
}
