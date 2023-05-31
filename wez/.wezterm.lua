local wezterm = require 'wezterm'
local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end

-- Config --
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.color_scheme = 'OneHalfDark'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 16.0
config.enable_tab_bar = false

return config
