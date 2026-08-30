hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("foot"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("fuzzel"))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + M", hl.dsp.exit())
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd("hyprlock"))

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + CTRL + H", hl.dsp.window.resize(({ x = -40, y = 0, relative = true }), { repeating = true }))
hl.bind("SUPER + CTRL + J", hl.dsp.window.resize(({ x = 0, y = 40, relative = true }), { repeating = true }))
hl.bind("SUPER + CTRL + K", hl.dsp.window.resize(({ x = 0, y = -40, relative = true }), { repeating = true }))
hl.bind("SUPER + CTRL + L", hl.dsp.window.resize(({ x = 40, y = 0, relative = true }), { repeating = true }))

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true })

hl.monitor({ output = "DP-3", mode = "preferred", position = "0x0", scale = 1.25 })
hl.monitor({ output = "eDP-1", mode = "preferred", position = "2600x1152", scale = 1.5 })

hl.on("hyprland.start", function()
  hl.exec_cmd("fcitx5 -d")
end)
