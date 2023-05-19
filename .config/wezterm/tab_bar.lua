local M = {}

M.setup = function(color_scheme)
	local wezterm = require("wezterm")

	local left_half_circle = wezterm.nerdfonts.ple_left_half_circle_thick
	local right_half_circle = wezterm.nerdfonts.ple_right_half_circle_thick
	local left_half_circle_thin = wezterm.nerdfonts.ple_left_half_circle_thin
	local right_half_circle_thin = wezterm.nerdfonts.ple_right_half_circle_thin
	local divider_spacing = 2

	-- This function returns the suggested title for a tab.
	-- It prefers the title that was set via `tab:set_title()`
	-- or `wezterm cli set-tab-title`, but falls back to the
	-- title of the active pane in that tab.
	function tab_title(tab_info)
		local title = tab_info.tab_title
		if title and #title > 0 then
			return title
		end

		local current_working_dir = tab_info.active_pane.current_working_dir
		local home_dir = os.getenv("HOME")
		title = current_working_dir
		title = string.gsub(title, "file://", "")
		title = string.sub(title, string.find(title, "/"), string.len(title))

		if home_dir then
			title = string.gsub(title, home_dir, "~")
		end

		return title
	end

	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local edge_background = color_scheme.background
		local background = color_scheme.background
		local foreground = color_scheme.foreground

		local edge_foreground = background

		local title = tab_title(tab)

		-- ensure that the titles fit in the available space,
		-- and that we have room for the edges.
		title = wezterm.truncate_right(title, max_width - 8)

		local index_bg = tab.is_active and color_scheme.brights[4] or color_scheme.brights[5]

		return {
			{ Attribute = { Intensity = "Bold" } },
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = index_bg } },
			{ Text = left_half_circle },
			{ Attribute = { Intensity = "Bold" } },
			{ Background = { Color = index_bg } },
			{ Foreground = { Color = background } },
			{ Text = tostring(tab.tab_index + 1) },
			{ Background = { Color = background } },
			{ Foreground = { Color = index_bg } },
			{ Text = right_half_circle },
			{ Attribute = { Intensity = "Bold" } },
			{ Background = { Color = background } },
			{ Foreground = { Color = index_bg } },
			{ Text = " " .. title },
			{ Background = { Color = index_bg } },
			{ Foreground = { Color = edge_background } },
			{ Text = right_half_circle },
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = index_bg } },
			{ Text = right_half_circle .. "  " },
		}
	end)
end

return M
