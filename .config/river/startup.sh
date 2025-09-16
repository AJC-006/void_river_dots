#bg
swaybg -i ~/walls/wall3.png -m fill  &

brightnessctl set 23% &

# exec . ~/.profile &

sleep 1
waybar > /tmp/waybar.log 2>&1 &

exec ~/.config/river/spawn.sh &

sleep 1
mako &



exec wl-paste --type text --watch sh -c 'cliphist store && pkill -RTMIN+9 waybar' &
exec wl-paste --type image --watch sh -c 'cliphist store && pkill -RTMIN+9 waybar' &


batsignal -b -w 15 -c 10 -d 5 -f 90 -p -e -D "loginctl suspend" -m 30 &

swayidle -w \
	timeout 500 "waylock -fork-on-lock -init-color 0x24273a -input-color 0x6e738d -fail-color 0xed8796 -ignore-empty-password" \
	timeout 700 "loginctl suspend" \
	before-sleep "waylock -fork-on-lock -init-color 0x24273a -input-color 0x6e738d -fail-color 0xed8796 -ignore-empty-password" &




wlr-randr --output eDP-1 --pos 1366,0 --output HDMI-A-1 --pos 0,0

for_window app_id="steam" inhibit_idle fullscreen



# wideriver --layout left --stack even --count 1 --ratio 0.45 --inner-gaps 10 --outer-gaps 10 &


# exec dbus-update-activation-environment DISPLAY  WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=River
