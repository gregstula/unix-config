#!/bin/sh 

cp -R ./plasma-workspace/ $HOME/.config/

# Install nvidia-smi overclock service to lock min clocks to higher value
if command -v nvidia-smi >/dev/null 2>&1; then 
    sudo cp ./systemd/nvidia-lock-clocks.service /etc/systemd/system/
    echo "nvidia-lock-clocks.service file installed to /etc/systemd/system"
    echo "Please run 'systemctl enable nvidia-lock-clocks.service'"
else 
    echo "nvidia-smi not found! Systemd service not installed!"
fi

