local awful = require("awful")
local naughty = require("naughty")
local pl = require("pl.import_into")()

local function on_tag_changed()
    local cache_dir = os.getenv("XDG_CACHE_HOME")
        or (os.getenv("HOME") .. "/.cache")
    local log_file_path = cache_dir .. "/awesome_eww_workspaces.log"
    local log_file = io.open(log_file_path, "a")

    if not log_file then
        return
    end

    local not_focused_icon = ""
    local focused_icon = ""

    local log = "(box "
        .. ':class "works" '
        .. ':orientation "h" '
        .. ":spacing 5 "
        .. ':space-evenly "false" '

    local tags = awful.screen.focused().tags
    for _, t in ipairs(tags) do
        local workspace_icon = not_focused_icon
        local classes = "workspace "

        if #t:clients() > 0 then
            classes = classes .. "workspace-occupied "
        else
            classes = classes .. "workspace-unoccupied "
        end

        local is_focused = pl.tablex.find(
            awful.screen.focused().selected_tags,
            t
        ) ~= nil

        if is_focused then
            classes = classes .. "workspace-focused "
            workspace_icon = focused_icon
        end

        log = log
            .. "(button "
            .. string.format(":onclick 'notify-send %s' ", t.name)
            .. string.format(":class '%s' ", classes)
            .. string.format("'%s' ) ", workspace_icon)
    end

    log = log .. ")\n"

    log_file:write(log)
    log_file:close()
end

tag.connect_signal("property::selected", function()
    on_tag_changed()
end)
