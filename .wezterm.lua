local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()
-- Default shell
-- config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" }
config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }
-- Appearance
-- local opacity = 0.95
config.font = wezterm.font("JetBrainsMono NF")
config.font_size = 14
config.color_scheme = "catppuccin-mocha"
-- config.window_background_opacity = opacity
config.colors = {
  background = "#000000",
  cursor_bg = "#9B96B5",
  cursor_fg = "#1a1a1e",
  cursor_border = "#9B96B5",
}
-- Always start full screen on launch
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window()
  if gui_window then
    gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
  end
end)
-- Window padding
config.window_padding = {
  left = 10,
  right = 10,
  top = 15,
  bottom = 0,
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
-- Key mappings
config.keys = {
  -- Pass Ctrl+Space through to the terminal (for Neovim)
  {
    key = "Space",
    mods = "CTRL",
    action = wezterm.action.SendKey({ key = "Space", mods = "CTRL" }),
  },
  -- Split vertically (50% width)
  {
    key = "o",
    mods = "ALT|CTRL",
    action = wezterm.action.SplitHorizontal({
      domain = "CurrentPaneDomain",
    }),
  },
  -- Split horizontally (50% height)
  {
    key = "i",
    mods = "ALT|CTRL",
    action = wezterm.action.SplitVertical({
      domain = "CurrentPaneDomain",
    }),
  },
  -- Pane navigation
  { key = "h", mods = "ALT|CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
  {
    key = "l",
    mods = "ALT|CTRL",
    action = wezterm.action.ActivatePaneDirection("Right", { create_pane_if_needed = true }),
  },
  { key = "k", mods = "ALT|CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "j", mods = "ALT|CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
  -- Close current pane
  { key = "p", mods = "ALT|CTRL", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
  -- Maximize / Restore current pane
  { key = "m", mods = "ALT|CTRL", action = wezterm.action.TogglePaneZoomState },
}
--Background image with darkening
config.window_background_image = "C:/Users/wualk/terminal1.jpg"
config.window_background_image_hsb = {
  brightness = 1.0,
  hue = 0.5,
  saturation = 1.0,
}
return config
