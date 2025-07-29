# Wayland workarounds 

# NOTE: For kde this should go to ~/.config/plasma-workspace/env/ 
# This will also add it to SystemSettings Autostart in Plasma

# https://wiki.archlinux.org/title/Wayland#Environment_variable
export ELECTRON_OZONE_PLATFORM_HINT=auto

# https://wiki.archlinux.org/title/Wayland#Qt
export QT_SCALE_FACTOR_ROUNDING_POLICY=RoundPreferFloor
