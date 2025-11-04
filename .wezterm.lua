local wezterm = require("wezterm")
-- local sessionizer = require("lua.sessionizer")
local config = wezterm.config_builder()

-- Default shell
config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" }

-- Appearance
local opacity = 0.2
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 15
config.color_scheme = "tokyonight"
config.window_background_opacity = opacity
config.colors = {
	background = "#000000",
	cursor_bg = "#9B96B5",
	cursor_fg = "#1a1a1e",
	cursor_border = "#9B96B5",
}

-- Window padding
config.window_padding = {
	left = 18,
	right = 15,
	top = 20,
	bottom = 5,
}

-- Performance / rendering
config.max_fps = 165
config.animation_fps = 165
config.front_end = "WebGpu"
config.prefer_egl = true

-- Tabs & window behavior
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.automatically_reload_config = true
config.audible_bell = "Disabled"
config.adjust_window_size_when_changing_font_size = false
config.harfbuzz_features = { "calt=0" }

-- -- Leader key (Ctrl+a)
-- config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
--
-- -- Key mappings
-- config.keys = {
--     {
--         key = "LeftArrow",
--         mods = "OPT",
--         action = wezterm.action({ SendString = "\x1bb" }),
--     },
--     {
--         key = "RightArrow",
--         mods = "OPT",
--         action = wezterm.action({ SendString = "\x1bf" }),
--     },
--     {
--         key = "v",
--         mods = "LEADER",
--         action = wezterm.action.SwitchToWorkspace {
--             name = "main-cs",
--             spawn = {
--                 cwd = "~/Desktop/main-cs",
--                 args = {
--                     "/opt/homebrew/bin/nvim",
--                     "~/Desktop/main-cs",
--                     "-c",
--                     'lua vim.api.nvim_set_current_dir("~/Desktop/main-cs")'
--                 },
--             },
--         },
--     },
-- }
--
config.keys = {
	-- Split vertically (¼ width)
	{
		key = "i",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 25 }, -- ✅ ¼ width
			top_level = false,
            command = nil,
		}),
	},

	-- Split horizontally (¼ height)
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 25 }, -- ✅ ¼ height
			top_level = false,
            command = nil,
		}),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},

	-- Close current pane
	{
		key = "p",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},

	-- ✅ Maximize / Restore current pane
	{
		key = "m",
		mods = "CTRL|SHIFT",
		action = wezterm.action.TogglePaneZoomState,
	},
}

-- Background image with darkening
config.window_background_image = "C:/Users/Owner/terminal1.jpg"
config.window_background_image_hsb = {
	brightness = 0.2, -- darken background image
	hue = 0.5, -- adjust hue
	saturation = 1.0, -- adjust saturation
}

return config
