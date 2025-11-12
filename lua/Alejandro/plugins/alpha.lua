return {
	"goolord/alpha-nvim",
	lazy = false,
	priority = 1000,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		-- Set header
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
			dashboard.button("a", "  New file", ":enew<CR>"),
			dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}
		-- Setup alpha
		alpha.setup(dashboard.config)
		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		-- Show alpha when opening without a file or with a directory
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local buf = vim.api.nvim_get_current_buf()
				local buf_name = vim.api.nvim_buf_get_name(buf)
				local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = buf })

				if (buf_name == "" and buf_ft == "") or vim.fn.isdirectory(buf_name) == 1 then
					-- FIXED: Change to directory BEFORE deleting buffer
					if vim.fn.isdirectory(buf_name) == 1 then
						vim.cmd("cd " .. vim.fn.fnameescape(buf_name))
					end
					pcall(vim.api.nvim_buf_delete, buf, { force = true })
					alpha.start()
				end
			end,
		})
	end,
}
