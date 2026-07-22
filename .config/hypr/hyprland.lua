-- matugen hook
require("subconfigurations.colors")

--###############
--## MONITORS ###
--###############

-- monitor = desc:Samsung Display Corp. 0x4188, preferred, auto, 1.2
hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "0x0",
    scale = "1.1222",
--     bitdepth = 10,
--     cm = "auto",
--     sdr_min_luminance = 0,
--     sdr_max_luminance = 400,
--     min_luminance = 0,
--     max_luminance = 400,
--     sdrbrightness = 1,
--     sdrsaturation = 1,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "auto-right",
    scale = "1",
--     mirror = "eDP-1",
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto-right",
    scale = "1",
})

-- workspaces

-- main laptop monitor
for i = 1, 4 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "eDP-1",
        default = (i == 1)
    })
end

--############################
--## ENVIRONMENT VARIABLES ###
--############################

-- XWayland

hl.env("MOZ_ENABLE_WAYLAND", "1")

hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true,
})

hl.layer_rule({
    match = { namespace = "kitty" },
    blur = true,
})

hl.layer_rule({
    match = { namespace = "^swaync-(notification-window|control-center)$" },
    blur = true,
    ignore_alpha = 0.5,
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "fuzzel"
local browser = "firefox"

local home = os.getenv("HOME")

hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"))
hl.bind("SUPER + SHIFT + backslash", hl.dsp.exec_cmd("hyprshutdown"))
hl.bind("SUPER + backslash", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("SUPER + M", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }))

hl.bind("SUPER + K", hl.dsp.layout("swapsplit"))
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))
hl.bind("ALT + Tab", hl.dsp.window.cycle_next(), { repeating = true })
hl.bind("ALT + Tab", hl.dsp.window.bring_to_top(), { repeating = true })


hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + CTRL + RETURN", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))
hl.bind("SUPER + CTRL+ W", hl.dsp.exec_cmd("waypaper"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind("PRINT", hl.dsp.exec_cmd("grimblast --freeze copysave area ".. home .. "/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S').png"))

hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind("SUPER + ALT + left", hl.dsp.window.swap({direction = "left"}))
hl.bind("SUPER + ALT + right", hl.dsp.window.swap({direction = "right"}))
hl.bind("SUPER + ALT + up", hl.dsp.window.swap({direction = "up"}))
hl.bind("SUPER + ALT + down", hl.dsp.window.swap({direction = "down"}))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

hl.bind("SUPER + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- scaling binds, wish i didnt have to do this

-- Scale to 1
hl.bind("SUPER + bracketright", function()
hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto",
    scale = 1
})
end)

-- Scale to 1.12 (For whatever key you want to use to go back, e.g., bracketleft)
hl.bind("SUPER + bracketleft", function()
hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto",
    scale = 1.1222
})
end)
-- ##############################
-- ### WINDOWS AND WORKSPACES ###
-- ##############################


hl.window_rule({
    name = "kitty",
    match = {
        class = "^(waybar_update)$",
    },
    float = true,
    center = true,
    size = "1000 800",
})

hl.window_rule({
    name = "pip",
    match = {
        title = "^(Picture-in-Picture)$",
    },
    float = true,
    pin = true,
    move = "70% 4%",
})

hl.window_rule({
    name = "steam-popups",
    match = {
        class = "^(steam)$",
               title = "negative:^Steam$",
    },
    float = true,
})

hl.window_rule({
    name = "musicbee",
    match = {
        class = "^(musicbee.exe)$",
               title = "negative:.*MusicBee.*",
    },
    float = true,
})

hl.window_rule({
    name = "game-suppressions",
    match = {
        class = "^(cs2|cstrike_linux64)$",
    },
    suppress_event = "maximize fullscreen",
})

-- Pavucontrol
hl.window_rule({
    name = "pavucontrol",
    match = {
        class = "(.*org.pulseaudio.pavucontrol.*)",
    },
    float = true,
    center = true,
    pin = true,
    size = "700 600",
})

-- Waypaper
hl.window_rule({
    name = "waypaper",
    match = {
        class = "(.*waypaper.*)",
    },
    float = true,
    center = true,
    pin = true,
    size = "900 700",
})

-- Float and center file pickers
hl.window_rule({
    name = "windowrule-1",
    match = {
        class = "xdg-desktop-portal-gtk",
    },
    float = true,
    center = true,
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
    render = {
        direct_scanout = 1,
        cm_enabled = true,
        cm_auto_hdr = 1,
--         cm_sdr_eotf = "gamma22",
    },
    --####################
    --## LOOK AND FEEL ###
    --####################
    -- Refer to https://wiki.hypr.land/Configuring/Variables/
    -- https://wiki.hypr.land/Configuring/Variables/#general
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 1,
        col = {
            active_border = primary,
            inactive_border = surface,
        },
        layout = "dwindle",
        resize_on_border = true,
        allow_tearing = true,
    },
    -- https://wiki.hypr.land/Configuring/Variables/#decoration
    decoration = {
        rounding = 0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1.0,
        blur = {
            enabled = true,
            size = 4,
            passes = 2,
            new_optimizations = true,
            ignore_opacity = true,
            xray = true,
        },
        shadow = {
            enabled = false,
        },
    },
    -- https://wiki.hypr.land/Configuring/Variables/#animations
    animations = {
        enabled = yes,
    },
    -- See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
    dwindle = {
        preserve_split = true,
        smart_resizing = true,
    },
    master = {
        new_status = "master",
    },
    -- Extra binds for laptop
    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles = true,
        pass_mouse_when_bound = false,
    },
    -- https://wiki.hypr.land/Configuring/Variables/#misc
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
    --############
    --## INPUT ###
    --############
    -- https://wiki.hypr.land/Configuring/Variables/#input
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 2,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
    cursor = {
        hide_on_key_press = true,
        no_hardware_cursors = false,
    },
})
--##################
--## ANIMS ##
--##################

hl.curve("spring", { type = "spring", mass = 1, stiffness = 500, dampening = 40 })
hl.curve("exit_spring", { type = "spring", mass = 1, stiffness = 900, dampening = 55 })
hl.curve("instant_spring", { type = "spring", mass = 1, stiffness = 1600, dampening = 80 })

hl.animation({ leaf = "windows", enabled = true, speed = 3, spring = "spring", style = "popin 85%" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.5, spring = "spring", style = "slide" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 2.5, spring = "exit_spring" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2.5, spring = "exit_spring" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 2, spring = "instant_spring" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, spring = "instant_spring" })


hl.on("hyprland.start", function ()
    hl.exec_cmd("waypaper --restore")
    hl.exec_cmd("waybar")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("sway-audio-idle-inhibit")
end)




