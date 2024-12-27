local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local mylauncher = require("main.launcher")
local vars = require("main.user_variable")
local modkey = vars.modkey

-- textclock

local traywidgets = {}

function traywidgets.myvolume(s)
	myvolume = wibox.widget({
		text = "ligma",
		screen = s, -- Specify the screen
		widget = wibox.widget.textclock,
	})

	awesome.connect_signal("laptop::volume", function(toggle, volume)
		myvolume.text = toggle .. "-" .. volume
	end)
	return myvolume
end

function traywidgets.mytextclock(s)
	mytextclock = wibox.widget({
		screen = s, -- Specify the screen
		widget = wibox.widget.textclock(),
	})
	return mytextclock
end

function traywidgets.mysystray(s)
	mysystray = wibox.widget({
		screen = s, -- Specify the screen
		widget = wibox.widget.systray(),
	})
	return mysystray
end

function traywidgets.mykbdlayout(s)
	mykbdlayout = wibox.widget({
		screen = s, -- Specify the screen
		widget = awful.widget.keyboardlayout(),
	})
	return mykbdlayout
end

return traywidgets
