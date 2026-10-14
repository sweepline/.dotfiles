#!/usr/bin/env bash
# Toggle the OS color scheme, or watch it and emit waybar JSON state.
#   theme.sh        → toggle prefer-light ⇄ prefer-dark
#   theme.sh watch  → print state as waybar JSON and keep printing on every change
# The change propagates through xdg-desktop-portal, so kitty's
# *-theme.auto.conf files switch automatically.

schema=org.gnome.desktop.interface
key=color-scheme

show() {
    case "$(gsettings get "$schema" "$key")" in
        *dark*) printf '{"text":"\U000f186","class":"dark","tooltip":"Dark theme — click for light"}\n' ;;
        *)      printf '{"text":"\U000f185","class":"light","tooltip":"Light theme — click for dark"}\n' ;;
    esac
}

if [[ "${1:-}" == watch ]]; then
    show
    exec gsettings monitor "$schema" "$key" | while read -r _; do show; done
fi

if [[ "$(gsettings get "$schema" "$key")" == *dark* ]]; then
    gsettings set "$schema" "$key" prefer-light
else
    gsettings set "$schema" "$key" prefer-dark
fi
