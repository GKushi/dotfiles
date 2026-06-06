-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

hl.env("XCURSOR_SIZE", "18")
hl.env("HYPRCURSOR_SIZE", "18")

require("hyprland-configs/monitors")
require("hyprland-configs/autostart")
require("hyprland-configs/design")
require("hyprland-configs/input")
require("hyprland-configs/rules")
