local awful = require("awful")
local beautiful = require("beautiful")
local vars = require("main.user_variable")
local terminal = vars.terminal
local editor_cmd = vars.editor_cmd
local hotkeys_popup = require("awful.hotkeys_popup")

local myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}
local mymainmenu = awful.menu({
	items = {
		{ "awesome", myawesomemenu, beautiful.awesome_icon },
		{ "open terminal", terminal },
	},
})

-- Create a launcher widget and a main menu

return mymainmenu
