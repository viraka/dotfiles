#!/bin/bash

# Waybar Custom Menu Script
# Save this as ~/.config/waybar/scripts/menu.sh
# Make it executable: chmod +x ~/.config/waybar/scripts/menu.sh

# Menu options - customize these to your needs
options=(
    "󰀻  Applications"
    "  Terminal"
    "  File Manager"
    "  Browser"
    "󰒓  Settings"
    "󰖩  Network Settings"
    "󰍹  Display Settings"
    "  Bluetooth"
    "  Audio Settings"
    "󰏗  System Monitor"
    "󰌆  Power Options"
    "  Lock Screen"
    "󰗼  Logout"
    "  Reboot"
    "  Shutdown"
)

# Display menu using wofi (or rofi)
choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu --prompt "Menu" --width 300 --height 400)

# Execute based on selection
case $choice in
    "󰀻  Applications")
        wofi --show drun
        ;;
    "  Terminal")
        kitty  # Change to your terminal: alacritty, foot, wezterm, etc.
        ;;
    "  File Manager")
        thunar  # Change to: nautilus, dolphin, nemo, pcmanfm, etc.
        ;;
    "  Browser")
        firefox  # Change to: chromium, brave, etc.
        ;;
    "󰒓  Settings")
        XDG_CURRENT_DESKTOP=GNOME gnome-control-center  # or: systemsettings5 for KDE
        ;;
    "󰖩  Network Settings")
        nm-connection-editor
        ;;
    "󰍹  Display Settings")
        wdisplays  # or: arandr for X11
        ;;
    "  Bluetooth")
        blueman-manager
        ;;
    "  Audio Settings")
        pavucontrol
        ;;
    "󰏗  System Monitor")
        kitty -e htop  # Change terminal if needed
        ;;
    "󰌆  Power Options")
        # Opens a submenu for power options
        power_choice=$(printf 'Lock\nLogout\nSuspend\nReboot\nShutdown' | wofi --dmenu --prompt "Power" --width 200)
        case $power_choice in
            Lock) hyprlock ;;  # or: swaylock
            Logout) hyprctl dispatch exit ;;  # or: loginctl terminate-user $USER
            Suspend) systemctl suspend ;;
            Reboot) systemctl reboot ;;
            Shutdown) systemctl poweroff ;;
        esac
        ;;
    "  Lock Screen")
        hyprlock  # or: swaylock
        ;;
    "󰗼  Logout")
        hyprctl dispatch exit  # or: loginctl terminate-user $USER
        ;;
    "  Reboot")
        systemctl reboot
        ;;
    "  Shutdown")
        systemctl poweroff
        ;;
esac