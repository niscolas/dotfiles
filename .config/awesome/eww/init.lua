local awful = require("awful")

local function on_tag_changed()
    local cache_dir = os.getenv("XDG_CACHE_HOME")
        or (os.getenv("HOME") .. "/.cache")
    local log_file_path = cache_dir .. "/awesome_eww_workspaces.log"
    local log_file = io.open(log_file_path, "a")

    if not log_file then
        return
    end

    local empty_icon = ""

    local log = "(box "
        .. ':class "works" '
        .. ':orientation "h" '
        .. ":spacing 5 "
        .. ':space-evenly "false" '

    local tags = awful.screen.focused().tags
    for _, t in ipairs(tags) do
        log = log
            .. "(button "
            .. ":onclick "
            .. '"notify-send '
            .. t.name
            .. '" "'
            .. empty_icon
            .. '" ) '
    end

    log = log .. ")\n"

    log_file:write(log)
    log_file:close()
end

tag.connect_signal("property::selected", function()
    on_tag_changed()
end)
