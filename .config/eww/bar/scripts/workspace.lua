local awful = require("awful")
local naughty = require("naughty")
local tags = awful.screen.focused().tags
for _, tag in ipairs(tags) do
	-- Access tag properties
	print("Tag name:", tag.name)
	print("Tag layout:", tag.layout.name)
	print("Tag selected:", tag.selected)
end
-- output = ""
--
-- local function on_tag_changed(tag)
-- 	naughty.notify({ title = "test", message = "test" })
-- end
--
-- for _, t in ipairs(awful.screen.focused().tags) do
-- 	tag.connect_signal("property::selected", function()
-- 		on_tag_changed(t)
-- 	end)
-- end
--
-- while true do
-- 	if output ~= nil and output ~= "" then
--         naughty(output)
-- 	else
-- 		os.execute("sleep 0.1")
-- 	end
-- end
