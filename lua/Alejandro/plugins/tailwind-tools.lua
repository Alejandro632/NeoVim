return {
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		lazy = true, -- Will load as a dependency of nvim-colorizer
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPost",
		dependencies = {
			"roobert/tailwindcss-colorizer-cmp.nvim", -- Added: ensure it loads first
		},
		opts = {},
		config = function()
			local nvchadcolorizer = require("colorizer")
			local tailwindcolorizer = require("tailwindcss-colorizer-cmp")
			
			nvchadcolorizer.setup({
				user_default_options = {
					tailwind = true,
				},
				filetypes = { "html", "css", "javascript", "typescript", "jsx", "tsx", "vue", "svelte" },
			})
			
			tailwindcolorizer.setup({
				color_square_width = 2,
			})
		end,
	},
}
