return {
	"goolord/alpha-nvim",
	event = "VimEnter", -- Load after vim is ready
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		
		-- Set header (the cool logo!)
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ██╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗  ██║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔██╗ ██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╗██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚████║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝  ╚═══╝ ",
			"                                                     ",
		}
		
		-- Set menu buttons
		dashboard.section.buttons.val = {
			dashboard.button("a", "  New file", ":lua vim.ui.input({prompt='Filename: '}, function(name) if name then vim.cmd('e ' .. name) end end)<CR>"),
			dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}
		
		alpha.setup(dashboard.config)
		
		-- Show alpha when opening a directory
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local arg = vim.fn.argv(0)
				if vim.fn.argc() == 1 and vim.fn.isdirectory(arg) == 1 then
					-- Change to the directory first
					vim.cmd("cd " .. vim.fn.fnameescape(arg))
					-- Close the directory buffer
					vim.cmd("bdelete")
					-- Open alpha dashboard
					require("alpha").start()
				end
			end,
		})
	end,
}
