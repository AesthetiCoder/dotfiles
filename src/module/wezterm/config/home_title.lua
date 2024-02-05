local wezterm = require("wezterm")

local function strip_home_name(text)
	local clean_text = text:gsub("/home/", "~")
	return clean_text
end

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
	local clean_title = strip_home_name(tab.active_pane.title)
	return clean_title
end)
