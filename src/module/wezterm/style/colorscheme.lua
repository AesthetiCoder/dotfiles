local color = require('style.color')
local alpha = require('util.alpha')

local colorscheme = {
	foreground = color.gray.gray_400,
	background = color.background.background_900,
	cursor_border = color.gray.gray_400,
	cursor_bg = color.gray.gray_400,
	cursor_fg = 'black',
	selection_fg = color.gray.gray_400,
	selection_bg = alpha(color.information.information_700, 0.55),
	scrollbar_thumb = color.gray.gray_900,
	split = color.background.background_500,
	tab_bar = {
		inactive_tab_edge = alpha(color.background.background_900, 0.9),
	},

	ansi = {
		'#0C0C0C', -- black
		'#C50F1F', -- red
		'#13A10E', -- green
		'#C19C00', -- yellow
		'#0037DA', -- blue
		'#881798', -- magenta/purple
		'#3A96DD', -- cyan
		'#CCCCCC', -- white
	},
	brights = {
		'#767676', -- black
		'#E74856', -- red
		'#16C60C', -- green
		'#F9F1A5', -- yellow
		'#3B78FF', -- blue
		'#B4009E', -- magenta/purple
		'#61D6D6', -- cyan
		'#F2F2F2', -- white
	},
}

return colorscheme
