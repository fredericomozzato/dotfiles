-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Vs Code Dark+ (Gogh)"

config.window_background_opacity = 0.95

config.font_size = 16.0

-- and finally, return the configuration to wezterm
return config
