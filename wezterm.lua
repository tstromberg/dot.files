local wezterm = require 'wezterm'
local config = wezterm.config_builder()
-- local appearance = require 'appearance'
-- local projects = require 'projects'

config.default_prog = { '/opt/homebrew/bin/fish', '-i'}

config.set_environment_variables = {
  PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
}

config.color_scheme = 'Tokyo Night'
config.font = wezterm.font('Source Code Pro for Powerline')
config.font_size = 13

-- Slightly transparent and blurred background
config.window_background_opacity = 0.93
config.macos_window_background_blur = 30
-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = 'RESIZE'
-- Sets the font for the window frame (tab bar)


return config
