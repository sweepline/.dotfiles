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

-- Dynamic color
-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Gruvbox Dark (Gogh)'
  else
    return 'Gruvbox (Gogh)'
  end
end


-- For example, changing the color scheme:
config.font = wezterm.font "Iosevka Fixed"
config.font_size = 12
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.color_scheme = scheme_for_appearance(get_appearance())
config.enable_tab_bar = false
--config.disable_default_key_bindings = true

-- and finally, return the configuration to wezterm
return config
