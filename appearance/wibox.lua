local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local mylauncher = require("main.launcher")
local vars = require("main.user_variable")
local modkey = vars.modkey

local appearance = {
	mytasklist = require("appearance.tasklist"),
	mytaglist = require("appearance.taglist"),
	mywallpaper = require("appearance.wallpaper"),
	mytraywidget = require("appearance.tray"),
}
mykeyboardlayout = awful.widget.keyboardlayout()
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", appearance.mywallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	appearance.mywallpaper(s)

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	---- Create a taglist widget
	--s.mytaglist = awful.widget.taglist({
	--	screen = s,
	--	filter = awful.widget.taglist.filter.all,
	--	buttons = taglist_buttons,
	--})
	-- Create a tasklist widget
	--	s.mytasklist = awful.widget.tasklist({
	--		screen = s,
	--		filter = awful.widget.tasklist.filter.currenttags,
	--		buttons = tasklist_buttons,
	--	})

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			mylauncher,
			appearance.mytaglist(s),
			s.mypromptbox,
		},
		appearance.mytasklist(s), -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			appearance.mytraywidget.myvolume(s),
			appearance.mytraywidget.mykbdlayout(s),
			appearance.mytraywidget.mysystray(s),
			appearance.mytraywidget.mytextclock(s),
			s.mylayoutbox,
		},
	})
end)
