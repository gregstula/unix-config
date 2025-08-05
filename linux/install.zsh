#!/bin/env zsh 

cp -R ./plasma-workspace/ $HOME/.config/
print -P "%F{green}󱜚 !! Installed plasma-workspace scripts to $HOME/.config/plasma-workspace !!󱜚 %f"

# Install nvidia-smi overclock service to lock min clocks to higher value
if (($+commands[nvidia-smi])); then 
    if [ "$(id -u)" -ne 0 ]; then
        print -P "%F{red}󱚞 !! Tried to install nvidia-smi service but need sudo !!󱚞 %f" 
        exit 1
    fi
    cp ./systemd/nvidia-lock-clocks.service /etc/systemd/system/
    print -P "%F{green}󱜚 !! nvidia-lock-clocks.service file installed to /etc/systemd/system !!󱜚 %f"
    print -P "%F{cyan}󱚤  ~ Please run 'systemctl enable nvidia-lock-clocks.service ~ 󱚤 "
else 
    print -P "%F{yellow}󱚠  Nvidia-smi not found! Systemd service not installed! 󱚠 %f"
fi

