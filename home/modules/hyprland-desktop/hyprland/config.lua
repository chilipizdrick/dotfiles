local left = "H"
local down = "J"
local up = "K"
local right = "L"
local hijacker_enabled = false

-- Monitors
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- General Configuration
hl.config({
  general = {
    border_size = 2,
    gaps_in = { top = 10, bottom = 0, left = 10, right = 0 },
    gaps_out = 10,
    ["col.active_border"] = "rgba(ffffff88)",
    ["col.inactive_border"] = "rgba(55555555)",
    resize_on_border = false,
    layout = "dwindle",
  },

  dwindle = {
    preserve_split = true,
    special_scale_factor = 0.8,
  },

  master = {
    new_on_top = 1,
    mfact = 0.5,
  },

  decoration = {
    rounding = 15,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    fullscreen_opacity = 1.0,
    dim_inactive = false,
    dim_strength = 0.1,

    shadow = {
      enabled = true,
      range = 14,
      render_power = 3,
      color = "rgba(00000045)",
    },

    blur = {
      enabled = true,
      size = 4,
      passes = 4,
      vibrancy = 0.1696,
      new_optimizations = true,
      ignore_opacity = true,
      xray = false,
    },
  },

  input = {
    kb_layout = "us,ru",
    kb_variant = "",
    kb_model = "",
    kb_options = "grp:alt_shift_toggle",
    kb_rules = "",
    repeat_rate = 50,
    repeat_delay = 300,
    numlock_by_default = true,
    left_handed = false,
    follow_mouse = 1,
    float_switch_override_focus = 1,

    touchpad = {
      scroll_factor = 0.5,
      disable_while_typing = true,
      natural_scroll = true,
      clickfinger_behavior = false,
      middle_button_emulation = true,
      tap_to_click = true,
      drag_lock = 0,
    },
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    mouse_move_enables_dpms = true,
    animate_manual_resizes = true,
    animate_mouse_windowdragging = true,
    key_press_enables_dpms = true,
    vrr = 1,
    initial_workspace_tracking = 1,
    font_family = "monospace",
    enable_anr_dialog = false,
  },

  xwayland = {
    force_zero_scaling = true,
  },

  ecosystem = {
    no_update_news = true,
    no_donation_nag = true,
  },

  binds = {
    workspace_back_and_forth = false,
    allow_workspace_cycles = true,
    pass_mouse_when_bound = false,
  },
})

-- Animations
hl.curve("easeOutCubic", { type = "bezier", points = { { 0.215, 0.61 }, { 0.355, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 2, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadePopups", enabled = false })
hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "easeOutCubic" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 2, bezier = "easeOutCubic", style = "slide top" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "easeOutCubic", style = "slide bottom" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "easeOutCubic", style = "slide" })

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})

-- Window Rules
-- hl.window_rule({ match = { fullscreen = true }, idle_inhibit = "fullscreen" })
hl.window_rule({ match = { workspace = "w[t1]", float = false }, border_size = 0 })
hl.window_rule({ match = { title = "^(Wroomer)$" }, animation = "popin" })
hl.window_rule({ match = { class = "^(factorio)$" }, render_unfocused = true })

local special_windows_regex = "^(\\.blueman-manager-wrapped|xdg-desktop-portal-gtk|org\\.pulseaudio\\.pavucontrol)$"
hl.window_rule({
  match = { class = special_windows_regex },
  float = true,
  center = true,
  size = { "monitor_w * 0.5", "monitor_h * 0.7" },
})

hl.window_rule({
  match = { title = "Select what to share" },
  float = true,
  center = true,
  size = { "monitor_w * 0.5", "monitor_h * 0.7" },
})

local file_dialogs_regex = "^(Open File|Open|Save|Save As|Export|Import|Choose File|Rename)$"
hl.window_rule({
  match = { title = file_dialogs_regex },
  float = true,
  center = true,
  size = { "monitor_w * 0.5", "monitor_h * 0.7" },
})

-- Startup
hl.on("hyprland.start", function()
  hl.exec_cmd("noctalia")
  hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 20")
end)

-- Gestures
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 4, direction = "down", action = "close" })

-- Binds
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + W", hl.dsp.window.kill())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind("SUPER + " .. left, hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + " .. right, hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + " .. up, hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + " .. down, hl.dsp.focus({ direction = "d" }))

hl.bind("SUPER + SHIFT + " .. left, hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + " .. right, hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + " .. up, hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + " .. down, hl.dsp.window.move({ direction = "d" }))

for i = 1, 9 do
  hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
  hl.bind("SUPER + CTRL + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind("SUPER + CTRL + 0", hl.dsp.window.move({ workspace = 10, follow = false }))

hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + SHIFT + TAB", hl.dsp.focus({ workspace = "m-1" }))

hl.bind("SUPER + SHIFT + U", hl.dsp.window.move({ workspace = "special" }))
hl.bind("SUPER + U", hl.dsp.workspace.toggle_special())

hl.bind("SUPER + CTRL + W", hl.dsp.exec_cmd("wroomer -cf"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("satty-screenshot"))

hl.bind("ALT + SPACE", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + B", hl.dsp.exec_cmd('xdg-open "http://"'))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("Telegram"))

hl.bind("SUPER + ALT + T", function()
  local border_size = hl.get_config("general.border_size")

  if border_size ~= 0 then
    hl.config({
      general = {
        border_size = 0,
        gaps_in = 0,
        gaps_out = 0,
      },
      decoration = {
        rounding = 0,
      },
    })
  else
    hl.dispatch(hl.dsp.exec_cmd("hyprctl reload"))
  end
end)

hl.bind("SUPER + S", hl.dsp.exec_cmd("spotify --enable-features=UseOzonePlatform --ozone-platform=wayland"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("discord"))
hl.bind("SUPER + CTRL + C", hl.dsp.exec_cmd("pw-connect 'spotify' 'WEBRTC VoiceEngine'"))
hl.bind("SUPER + ALT + L", hl.dsp.exec_cmd("noctalia msg session lock"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("noctalia msg caffeine-toggle"))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("noctalia msg notification-dnd-toggle"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center notifications"))
hl.bind("SUPER + ALT + C", hl.dsp.exec_cmd("hyprpicker | wl-copy"))
hl.bind("SUPER + CTRL + B", hl.dsp.exec_cmd("noctalia msg bar-toggle default"))
hl.bind("CTRL + SHIFT + D", hl.dsp.pass({ window = "class:^(discord)$" }))
hl.bind("F9", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))
hl.bind("F10", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))

hl.bind("SUPER + ALT + H", function()
  hijacker_enabled = not hijacker_enabled
  local msg = hijacker_enabled and "Enabled" or "Disabled"
  hl.exec_cmd("noctalia msg notification-show 'Hijacker' '" .. msg .. "'")
end)

hl.bind("SUPER + ALT + 0", hl.dsp.exec_cmd("pkill hijacker2"))
for i = 1, 9 do
  hl.bind("SUPER + ALT + " .. i, function()
    if hijacker_enabled then
      hl.exec_cmd("clever-hijacker ee_sie_rnnoise ~/Music/hijacker-presets/" .. i .. ".mp3")
    end
  end)
end

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("noctalia msg media toggle"), { locked = true })
hl.bind("SUPER + C", hl.dsp.exec_cmd("noctalia msg media next"), { locked = true })
hl.bind("SUPER + X", hl.dsp.exec_cmd("noctalia msg media previous"), { locked = true })
hl.bind("SUPER + CTRL + " .. left, hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + " .. right, hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + " .. up, hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + " .. down, hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("noctalia msg volume-up 5"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("noctalia msg volume-down 5"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("noctalia msg volume-mute"), { repeating = true, locked = true })

hl.bind("SUPER + M", hl.dsp.exec_cmd("noctalia msg mic-mute"), { repeating = true, locked = true })

hl.bind(
  "XF86MonBrightnessDown",
  hl.dsp.exec_cmd("noctalia msg brightness-down all 5"),
  { repeating = true, locked = true }
)
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("noctalia msg brightness-set all 0"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("noctalia msg brightness-up all 5"), { repeating = true, locked = true })
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("noctalia msg brightness-set all 100"), { locked = true })
