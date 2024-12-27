local gears = require("gears")
local terminal = "xterm"
local editor = os.getenv("EDITOR") or "nano"
local editor_cmd = terminal .. " -e " .. editor
local modkey = "Mod4"

local M = {
	configpath = gears.filesystem.get_xdg_config_home(),
	homepath = os.getenv("HOME"),
	terminal = terminal,
	editor = editor,
	editor_cmd = editor_cmd,
	modkey = modkey,
}

return M
