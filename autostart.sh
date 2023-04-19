#!/bin/sh
waybar &
hyprpaper &
wifi off &
bluetooth off &
brightnessctl -d 'intel_backlight' set 20% &
pipewire &
wireplumber &
/usr/lib/xdg-desktop-portal-gtk &
/usr/lib/xdg-desktop-portal-hyprland &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
