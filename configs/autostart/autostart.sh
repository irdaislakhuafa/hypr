#!/bin/sh

# bar
killall waybar
waybar 2> /tmp/waybar &

# set wallpaper background
#hyprpaper &
killall swaybg
swaybg -i $HOME/.config/hypr/assets/wallpaper.png &

# networks
# wifi off &
bluetooth off &

# screen brightness
brightnessctl -d 'intel_backlight' set 20% &

# for share screen
killall pipewire
pipewire 2> /tmp/pipewire &

killall wireplumber
wireplumber 2> /tmp/wireplumber &

killall xdg-desktop-portal-hyprland
/usr/lib/xdg-desktop-portal-hyprland 2> /tmp/xdg-desktop-portal-hyprland &

