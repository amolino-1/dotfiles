local wezterm = require("wezterm")

local config = wezterm.config_builder()

--config.color_scheme = "Dracula"
config.color_scheme = "AuraDark-Custom"
config.font_size = 12
config.font = wezterm.font_with_fallback({
	"JetBrainsMonoNL Nerd Font",
	"FiraCode Nerd Font",
	"Hack Nerd Font",
}, { weight = "Bold", italic = false })

config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true
config.hide_mouse_cursor_when_typing = true
config.default_cursor_style = "SteadyBar"

config.default_prog = { "/usr/bin/bash" } -- required for starship prompt

config.enable_wayland = false

return config
