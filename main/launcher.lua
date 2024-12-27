local awful = require("awful")
local beautiful = require("beautiful")
local mymainmenu = require("main.menu")

-- launcher
local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

return mylauncher
