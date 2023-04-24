#!/bin/sh

# bar
waybar &

# set wallpaper background
#hyprpaper &
swaybg -i $HOME/.config/hypr/assets/wallpaper.png &

# networks
wifi off &
bluetooth off &

# screen brightness
brightnessctl -d 'intel_backlight' set 20% &

# for share screen
#pipewire &
#wireplumber &
#/usr/lib/xdg-desktop-portal-gtk &
#/usr/lib/xdg-desktop-portal-hyprland &
#dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
