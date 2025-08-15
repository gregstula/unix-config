#!/bin/env zsh

if [[ $(id -u) -eq 0 ]]; then
    print -P "F%{red} 󱚞 !! Do not run this script as sudo !! 󱚞 f%"
    exit 1
fi

function is_gigabyte() {
    local board_vendor_id=$(cat /sys/class/dmi/id/board_vendor)
    local split=($=board_vendor_id)
    [[ $split[1] == "Gigabyte" ]]
}

cp -R ./plasma-workspace/ $HOME/.config/
print -P "%F{green} 󱜚 !! Installed plasma-workspace scripts to $HOME/.config/plasma-workspace !! 󱜚 %f"

# Install nvidia-smi overclock service to lock min clocks to higher value
if command -v nvidia-smi &>/dev/null; then
    print -P "%F{green} 󱜚  Detected nvidia-smi  󱜚 %f"
    print -P "%F{cyan} 󱚤  ~ Asking for root: ~ 󱚤 %f"
    sudo cp ./systemd/nvidia-lock-clocks.service /etc/systemd/system/
    print -P "%F{green} 󱜚 !! nvidia-lock-clocks.service file installed to /etc/systemd/system !!󱜚 %f"
    print -P "%F{cyan} 󱚤  ~ Please run 'systemctl enable nvidia-lock-clocks.service ~ 󱚤 %f"
else
    print -P "%F{yellow} 󱚠 Nvidia-smi not found! Systemd service not installed! 󱚠 %f"
fi

if is_gigabyte; then
    print -P "%F{green} 󱜚  Detected Gigabyte Motherboard  󱜚 %f"
    print -P "%F{cyan} 󱚤  ~ Asking for root: ~ 󱚤 %f"
    sudo cp ./systemd/gigabyte-mb-resume-fix.service /etc/systemd/system/
    print -P "%F{green} 󱜚 !! gigabyte-mb-resume-fix.service file installed to /etc/systemd/system !!󱜚 %f"
    print -P "%F{cyan} 󱚤  ~ Please run 'systemctl enable gigabyte-mb-resume-fix.service ~ 󱚤 %f"
else
    print -P "%F{yellow} 󱚠 No Gigabyte motherboard found! Systemd service not installed! 󱚠 %f"
fi

exit 0
