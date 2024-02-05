local wezterm = require('wezterm')
local colorscheme = require('style.colorscheme')
local color = require('style.color')
local keybindings = require('config.keybindings')
local alpha = require('util.alpha')
require('config.tab_title')
require('config.home_title')

local font_primary = 'CaskaydiaCove NF'

local function font(name, params)
	return wezterm.font(name, params)
end

return {
	font = font(font_primary),
	font_size = 12,
	colors = colorscheme,
	automatically_reload_config = true,
	window_background_opacity = 0.9,
	window_close_confirmation = 'NeverPrompt',

	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = true,
	tab_max_width = 32,
	show_tab_index_in_tab_bar = false,
	switch_to_last_active_tab_when_closing_tab = true,
	show_new_tab_button_in_tab_bar = false,
	disable_default_key_bindings = true,
	check_for_updates = true,
	keys = keybindings,

	window_padding = {
		left = 12,
		right = 12,
		top = 12,
		bottom = 12,
	},

	window_frame = {
		active_titlebar_bg = alpha(color.background.background_900, 0.9),
		inactive_titlebar_bg = alpha(color.background.background_900, 0.9),
		font = font(font_primary, { bold = true }),
		font_size = 10,
	},

	default_domain = 'WSL:Ubuntu',

	window_decorations = 'RESIZE',
	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.8,
	},
}
