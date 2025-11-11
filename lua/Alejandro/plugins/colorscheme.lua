return {
	-- NOTE: Kanso (includes zen, ink, mist, pearl variants)
	-- {
	-- 	"webhooked/kanso.nvim",
	-- 	name = "kanso",
	-- 	-- priority = 1000,
	-- 	config = function()
	-- 		require("kanso").setup({
	-- 			bold = true, -- enable bold fonts
	-- 			italics = true, -- enable italics
	-- 			compile = false, -- enable compiling the colorscheme
	-- 			undercurl = true, -- enable undercurls
	-- 			commentStyle = { italic = true },
	-- 			functionStyle = {},
	-- 			keywordStyle = { italic = true },
	-- 			statementStyle = {},
	-- 			typeStyle = {},
	-- 			transparent = false, -- do not set background color
	-- 			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	-- 			terminalColors = true, -- define vim.g.terminal_color_{0,17}
	-- 			colors = {
	-- 				-- add/modify theme and palette colors
	-- 				palette = {},
	-- 				theme = {
	-- 					zen = {},
	-- 					pearl = {},
	-- 					ink = {},
	-- 					all = {},
	-- 				},
	-- 			},
	-- 			overrides = function(colors)
	-- 				-- add/modify highlights
	-- 				return {}
	-- 			end,
	-- 			background = {
	-- 				-- map the value of 'background' option to a theme
	-- 				dark = "zen", -- try "zen", "ink", "mist" or "pearl"
	-- 				light = "pearl", -- try "zen", "ink", "mist" or "pearl"
	-- 			},
	-- 			foreground = "default", -- "default" or "saturated"
	-- 		})
	-- 		-- Uncomment one of these to set as default:
	-- 		-- vim.cmd("colorscheme kanso-zen")
	-- 		-- vim.cmd("colorscheme kanso-ink")
	-- 		-- vim.cmd("colorscheme kanso-mist")
	-- 		-- vim.cmd("colorscheme kanso-pearl")
	-- 	end,
	-- },
	-- -- NOTE : tokyonight
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	name = "folkeTokyonight",
	-- 	-- priority = 1000,
	-- 	config = function()
	-- 		local transparent = false
	-- 		local bg = "#011628"
	-- 		local bg_dark = "#011423"
	-- 		local bg_highlight = "#143652"
	-- 		local bg_search = "#0A64AC"
	-- 		local bg_visual = "#275378"
	-- 		local fg = "#CBE0F0"
	-- 		local fg_dark = "#B4D0E9"
	-- 		local fg_gutter = "#627E97"
	-- 		local border = "#547998"
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			transparent = true,
	-- 			styles = {
	-- 				comments = { italic = false },
	-- 				keywords = { italic = false },
	-- 				sidebars = transparent and "transparent" or "dark",
	-- 				floats = transparent and "transparent" or "dark",
	-- 			},
	-- 			on_colors = function(colors)
	-- 				colors.bg = transparent and colors.none or bg
	-- 				colors.bg_dark = transparent and colors.none or bg_dark
	-- 				colors.bg_float = transparent and colors.none or bg_dark
	-- 				colors.bg_highlight = bg_highlight
	-- 				colors.bg_popup = bg_dark
	-- 				colors.bg_search = bg_search
	-- 				colors.bg_sidebar = transparent and colors.none or bg_dark
	-- 				colors.bg_statusline = transparent and colors.none or bg_dark
	-- 				colors.bg_visual = bg_visual
	-- 				colors.border = border
	-- 				colors.fg = fg
	-- 				colors.fg_dark = fg_dark
	-- 				colors.fg_float = fg
	-- 				colors.fg_gutter = fg_gutter
	-- 				colors.fg_sidebar = fg_dark
	-- 			end,
	-- 		})
	-- 	end,
	-- },
	-- -- NOTE: Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false,
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = true,
				dim_inactive = {
					enabled = true,
					shade = "dark",
					percentage = 0.15,
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					fidget = true,
				},
			})
			-- HACK: set this on the color you want to be persistent
			-- when quit and reopening nvim
			-- vim.cmd("colorscheme catppuccin")
		end,
	},
}
