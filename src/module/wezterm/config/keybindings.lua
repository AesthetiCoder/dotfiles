local wezterm = require('wezterm')

return {
	{ key = 'LeftArrow', mods = 'ALT', action = wezterm.action.ActivateTabRelative(-1) },
	{ key = 'RightArrow', mods = 'ALT', action = wezterm.action.ActivateTabRelative(1) },

	{ key = '1', mods = 'ALT', action = wezterm.action.ActivateTab(0) },
	{ key = '2', mods = 'ALT', action = wezterm.action.ActivateTab(1) },
	{ key = '3', mods = 'ALT', action = wezterm.action.ActivateTab(2) },
	{ key = '4', mods = 'ALT', action = wezterm.action.ActivateTab(3) },
	{ key = '5', mods = 'ALT', action = wezterm.action.ActivateTab(4) },

	{
		key = [[\]],
		mods = 'CTRL|ALT',
		action = wezterm.action({
			SplitHorizontal = { domain = 'CurrentPaneDomain' },
		}),
	},
	{
		key = [[\]],
		mods = 'CTRL',
		action = wezterm.action({
			SplitVertical = { domain = 'CurrentPaneDomain' },
		}),
	},

	{ key = 'h', mods = 'CTRL|ALT', action = wezterm.action.ActivatePaneDirection('Left') },
	{ key = 'j', mods = 'CTRL|ALT', action = wezterm.action.ActivatePaneDirection('Down') },
	{ key = 'k', mods = 'CTRL|ALT', action = wezterm.action.ActivatePaneDirection('Up') },
	{ key = 'l', mods = 'CTRL|ALT', action = wezterm.action.ActivatePaneDirection('Right') },

	{
		key = 'h',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action({ AdjustPaneSize = { 'Left', 1 } }),
	},
	{
		key = 'l',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action({ AdjustPaneSize = { 'Right', 1 } }),
	},
	{ key = 'k', mods = 'CTRL|SHIFT|ALT', action = wezterm.action({ AdjustPaneSize = { 'Up', 1 } }) },
	{
		key = 'j',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action({ AdjustPaneSize = { 'Down', 1 } }),
	},
	{ key = 'Enter', mods = 'ALT', action = 'ToggleFullScreen' },

	{ key = 'x', mods = 'CTRL', action = 'ActivateCopyMode' },
	{ key = 'v', mods = 'CTRL', action = wezterm.action({ PasteFrom = 'Clipboard' }) },
	{
		key = 'c',
		mods = 'CTRL|ALT',
		action = wezterm.action({ CopyTo = 'ClipboardAndPrimarySelection' }),
	},

	{ key = 'n', mods = 'CTRL', action = wezterm.action({ SpawnTab = 'CurrentPaneDomain' }) },

	{ key = 'w', mods = 'CTRL', action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
	{ key = 'q', mods = 'CTRL', action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
}
