local wezterm = require("wezterm")
local action = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("IntelOne Mono", { weight = "Medium" })
config.font_size = 11
config.window_background_opacity = 0.85

config.show_new_tab_button_in_tab_bar = false
config.tab_and_split_indices_are_zero_based = false
config.tab_max_width = 48
config.use_fancy_tab_bar = false
config.adjust_window_size_when_changing_font_size = false

local color_scheme_name = "GruvboxDark"
local color_scheme = wezterm.color.get_builtin_schemes()[color_scheme_name]
config.color_scheme = color_scheme_name
config.colors = {
	tab_bar = {
		background = color_scheme.background,
	},
}

config.keys = {
	{ key = "{", mods = "CTRL|SHIFT", action = action.MoveTabRelative(-1) },
	{ key = "}", mods = "CTRL|SHIFT", action = action.MoveTabRelative(1) },
}

--
--ansi = [
-- '#1e1e1e',
--     '#be0f17',
--     '#868715',
--     '#cc881a',
--     '#377375',
--     '#a04b73',
--     '#578e57',
--     '#978771',
-- ]
-- background = '#1e1e1e'
-- brights = [
--     '#7f7061',
--     '#f73028',
--     '#aab01e',
--     '#f7b125', '#719586',
--     '#c77089',
--     '#7db669',
--     '#e6d4a3',
-- ]
-- cursor_bg = '#e6d4a3'
-- cursor_border = '#e6d4a3'
-- cursor_fg = '#1e1e1e'
-- foreground = '#e6d4a3'
-- selection_bg = '#e6d4a3'
-- selection_fg = '#534a42'
--

require("tab_bar").setup(color_scheme)

local accent_color = color_scheme.brights[6]
local secondary_color = color_scheme.background

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(wezterm.format({
		{ Background = { Color = secondary_color } },
		{ Foreground = { Color = accent_color } },
		{ Text = wezterm.nerdfonts.ple_left_half_circle_thick },

		{ Background = { Color = accent_color } },
		{ Foreground = { Color = secondary_color } },
		{ Attribute = { Intensity = "Bold" } },
		{ Text = wezterm.nerdfonts.dev_terminal },

		{ Background = { Color = secondary_color } },
		{ Foreground = { Color = accent_color } },
		{ Text = wezterm.nerdfonts.ple_right_half_circle_thick },

		{ Background = { Color = secondary_color } },
		{ Foreground = { Color = accent_color } },
		{ Text = " " .. basename(pane:get_foreground_process_name()) .. " " },
	}))
end)

return config
