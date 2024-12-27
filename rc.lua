-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
require("main.error")
-- }}}

-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
local vars = require("main.user_variable")
local configpath = vars.configpath

gears.debug.dump(configpath)
beautiful.init(configpath .. "awesome/theme.lua")

-- USER VARIABLE
-- {{{
local vars = require("main.user_variable")
local terminal = vars.terminal
local editor = vars.editor
local editor_cmd = vars.editor_cmd
local modkey = vars.modkey

-- }}}

-- layouts
-- Table of layouts to cover with awful.layout.inc, order matters.
-- {{{
local mylayout = require("main.layout")
awful.layout.layouts = mylayout
-- }}}

-- {{{ Menu

-- Context Menu
-- {{{
local mymainmenu = require("main.menu")
-- }}}

-- Launcher
-- {{{
local mylauncher = require("main.launcher")
-- }}}

-- Menubar configuration
-- {{{
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Tag
--{{{
require("main.tag")
--}}}

-- {{{ Wibar
require("appearance.wibox")
-- }}}

-- {{{ Mouse bindings

local globalbuttons = require("keys.globalbuttons")
root.buttons(globalbuttons)

-- }}}

-- Key bindings
-- {{{
local globalkeys = require("keys.globalkeys")
root.keys(globalkeys)
local clientkeys = require("keys.clientkeys")
local clientbuttons = require("keys.clientbuttons")

-- }}}

-- {{{ Rules

local myrules = require("main.rules")
awful.rules.rules = myrules
-- }}}

-- {{{ Signals
require("main.signal")

-- }}}

-- Autostart
-- {{{
require("module.autostart")
--- }}}
---
