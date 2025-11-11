return {
	"mbbill/undotree",
	cmd = "UndotreeToggle", -- Only load when command is run
	keys = {
		{
			"<leader>u",
			function()
				vim.cmd.UndotreeToggle()
				vim.cmd.UndotreeFocus()
			end,
			desc = "Toggle Undotree"
		}
	},
	config = function()
		-- Enable dynamic updates / live changes
		vim.g.undotree_ShortIndicators = 1          -- show changed text indicator
		vim.g.undotree_SetFocusWhenToggle = 1       -- focus on toggle
		vim.g.undotree_DiffAutoRefresh = 1          -- refresh diffs dynamically
		vim.g.undotree_WindowLayout = 2             -- vertical split (optional)
		vim.g.undotree_SplitWidth = 35              -- width of the tree
	end,
}
