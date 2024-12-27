local awful = require("awful")
local vars = require("main.user_variable")
local configpath = vars.configpath

-- Startup Program

--awful.spawn.with_shell("firefox", {})

-- Script load
awful.spawn.once(configpath .. "script/test.sh")
