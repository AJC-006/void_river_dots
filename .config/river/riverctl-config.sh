riverctl mod Mod4

riverctl map normal Super Return spawn foot
riverctl map normal Mod4 Return spawn foot
riverctl map normal Alt+Control T spawn foot
riverctl map normal Super D spawn 'wofi --show drun'
riverctl map normal Super f spawn firefox
riverctl map normal Super c spawn code-oss
riverctl map normal Super T spawn 'thunar /home/void_alan/'
riverctl map normal Super F4 spawn "foot -e dbus-send --system --dest=org.freedesktop.login1 --print-reply /org/freedesktop/login1 "org.freedesktop.login1.Manager.PowerOff" boolean:true"
riverctl map normal Super F5 spawn "foot -e sudo poweroff"
riverctl map normal Super+Shift F4 spawn "foot -e sudo reboot"
riverctl map normal Super L spawn "loginctl suspend"


# Clipboard history: Show and copy selected item
riverctl map normal Super V spawn 'sh -c "cliphist list | wofi --show dmenu | cliphist decode | wl-copy"'

# Delete selected clipboard item
riverctl map normal Super X spawn 'sh -c "cliphist list | wofi --show dmenu | cliphist delete"'

# Wipe clipboard history
riverctl map normal Super+Shift X spawn 'cliphist wipe'

# Print Screen: Full screenshot saved + copied to clipboard
riverctl map normal None Print spawn 'grim ~/Pictures/screenshot-$(date +%Y%m%d_%H%M%S).png && grim - | wl-copy && notify-send "Screenshot" "Saved and copied to clipboard"'

# Super + Print: Toggle screen recording
riverctl map normal Super Print spawn 'pkill -SIGINT wf-recorder && notify-send "Recording" "Recording stopped" || (wf-recorder -f ~/Videos/recording-$(date +%Y%m%d_%H%M%S).mp4 & notify-send "Recording" "Recording started")'

riverctl map normal Super+V spawn "clipman pick --tool=wofi --max-items=30 --histpath='~/.local/share/clipman.json'"

riverctl map normal Super+Shift E exit
riverctl map normal Super F11 toggle-fullscreen
riverctl map normal Super Q close



riverctl map-pointer normal Super BTN_LEFT move-view
riverctl map-pointer normal Super BTN_RIGHT resize-view
riverctl map-pointer normal Super BTN_MIDDLE toggle-float

riverctl map normal Super Left  snap left
riverctl map normal Super Right snap right
riverctl map normal Super Up    snap up
riverctl map normal Super Down  snap down

riverctl set-cursor-theme Adwaita 24

riverctl map normal Super Tab focus-previous-tags

# Set background and border color
riverctl background-color 0x24273a
riverctl border-color-focused 0xa6da95
riverctl border-color-unfocused 0xb7bdf8
riverctl border-color-urgent 0xed8796
riverctl border-width 3


# Move focused window to the HDMI-A-1 output
riverctl map normal Super+Shift comma send-to-output HDMI-A-1

# Move focused window to the eDP-1 output
riverctl map normal Super+Shift period send-to-output eDP-1

riverctl set-repeat 50 300


riverctl rule-add -app-id "bar" csd

riverctl rule-add ssd

# Hide cursor after 10 seconds of inactivity
riverctl hide-cursor timeout 10000

# Window focus follows cursor
riverctl focus-follows-cursor normal




for mode in normal locked
do
    # Control pulse audio volume
    riverctl map $mode None XF86AudioRaiseVolume  spawn 'pactl set-sink-volume @DEFAULT_SINK@ +5%'
    riverctl map $mode None XF86AudioLowerVolume  spawn 'pactl set-sink-volume @DEFAULT_SINK@ -5%'
    riverctl map $mode None XF86AudioMute spawn 'pactl set-sink-mute @DEFAULT_SINK@ toggle'

    # Control MPRIS aware media players
    riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
    riverctl map $mode None XF86AudioPlay  spawn 'playerctl play-pause'
    riverctl map $mode None XF86AudioPrev  spawn 'playerctl previous'
    riverctl map $mode None XF86AudioNext  spawn 'playerctl next'

done

# riverctl default-layout wideriver

for i in $(seq 1 9); do
	
    tags=$((1 << (i-1) ))

	# Super+[1-9] to focus tag [0-8]
	riverctl map normal Super "$i" set-focused-tags $tags

	# Super+Shift+[1-9] to tag focused view with tag [0-8]
	riverctl map normal Super+Shift "$i" set-view-tags $tags

done