local wezterm = require('wezterm')
local color = require('style.color')
local icon = require('asset.icon')
local get_os_name = require('util.get_os_name')
local alpha = require('util.alpha')
local split = require('util.split')

local function set_process_name(value)
	return string.gsub(value, '(.*[/\\])(.*)', '%2'):gsub('%.exe$', '')
end

local function set_title(process_name, directory)
	local title_icon = ''

	if process_name == 'cmd' then
		title_icon = icon.evil .. ' ' .. process_name
	elseif process_name == 'wsl' or process_name == 'wslhost' then
		title_icon = icon.wsl_icon .. ' wsl'
	elseif process_name == 'nvim' then
		title_icon = icon.vim_icon .. ' neovim'
	elseif process_name == 'python' or process_name == 'hiss' then
		title_icon = icon.python_icon .. ' ' .. process_name
	elseif process_name == 'node' then
		title_icon = icon.node_icon .. ' ' .. process_name
	end

	return ' ' .. title_icon .. ' - ' .. directory .. ' '
end

local function get_current_working_dir(tab)
	local HOME_DIR
	local directory_icon
	local os_name = get_os_name()
	local current_directory = tab.active_pane.current_working_dir

	current_directory = string.format('%s', string.gsub(current_directory, '(.*[/\\])(.*)/', '%2'))

	if os_name == 'Windows' then
		HOME_DIR = os.getenv('HOMEPATH')
		if HOME_DIR then
			HOME_DIR = HOME_DIR:gsub('%\\', '/')
			HOME_DIR = split(HOME_DIR, '/')
			HOME_DIR = HOME_DIR[#HOME_DIR]
		end
	else
		HOME_DIR = string.format('file://%s', os.getenv('HOME'))
	end

	if current_directory == HOME_DIR then
		directory_icon = icon.home
		current_directory = ''
	elseif current_directory == 'Documents' then
		directory_icon = icon.document
	elseif current_directory == 'Downloads' then
		directory_icon = icon.download
	elseif current_directory == 'Music' then
		directory_icon = icon.music
	elseif current_directory == 'Pictures' then
		directory_icon = icon.picture
	elseif current_directory == 'Videos' then
		directory_icon = icon.video
	elseif current_directory == 'project' then
		directory_icon = icon.project
	elseif current_directory == '.config' then
		directory_icon = icon.config
	else
		directory_icon = icon.folder
	end

	return directory_icon .. ' ~/' .. current_directory
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
	local background = color.primary.primary_900
	local foreground = alpha(color.background.background_900, 0.9)

	local process_name = set_process_name(tab.active_pane.foreground_process_name)
	local working_directory = get_current_working_dir(tab)
	local title = set_title(process_name, working_directory)

	if tab.is_active then
		background = color.primary.primary_600
		foreground = alpha(color.background.background_900, 0.9)
	elseif hover then
		background = color.primary.primary_700
		foreground = alpha(color.background.background_900, 0.9)
	end

	return {
		{ Attribute = { Italic = false } },
		{ Attribute = { Intensity = 'Bold' } },
		{ Background = { Color = alpha(color.background.background_900, 0.9) } },
		{ Foreground = { Color = background } },
		{ Text = icon.semi_circle_left },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = alpha(color.background.background_900, 0.9) } },
		{ Foreground = { Color = background } },
		{ Text = icon.semi_circle_right },
	}
end)
