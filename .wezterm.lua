local wezterm = require("wezterm")
-- local sessionizer = require("lua.sessionizer")
local config = wezterm.config_builder()

-- Default shell
-- config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" }
config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoLogo" }

-- Appearance
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.colors = {
	background = "#000000",
	cursor_bg = "#9B96B5",
	cursor_fg = "#1a1a1e",
	cursor_border = "#9B96B5",
}

--Window padding
config.window_padding = {
	left = 15,
	right = 15,
	top = 20,
	bottom = 10,
}

-- config.window_padding = {
-- 	left = 0,
-- 	right = 0,
-- 	top = 0,
-- 	bottom = 0,
-- }
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

config.keys = {
	-- Split vertically (¼ width)
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 25 },
			top_level = false,
			command = nil,
		}),
	},

	-- Split horizontally (¼ height)
	{
		key = "i",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 25 },
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

	--  Maximize
	{
		key = "m",
		mods = "CTRL|SHIFT",
		action = wezterm.action.TogglePaneZoomState,
	},
}

-- Background image with darkening
config.window_background_image = "C:/Users/Owner/terminal5.jpg"
config.window_background_image_hsb = {
	brightness = 0.15, -- darken background image
	-- hue = 0.5, -- adjust hue
	saturation = 1.0, -- adjust saturation
}

return config
