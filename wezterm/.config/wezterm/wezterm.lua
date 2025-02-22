-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font = wezterm.font "Iosevka Fixed Slab"
config.font_size = 14
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.color_scheme = 'Gruvbox Material (Gogh)'
config.enable_tab_bar = false
--config.disable_default_key_bindings = true

-- and finally, return the configuration to wezterm
return config
