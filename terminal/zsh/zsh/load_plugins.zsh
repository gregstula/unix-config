# Copyright (C) 2025 Gregory Stula

# Root should just use what is installed by OS package manager
if [[ $(id -u) -eq 0 ]]; then
    system_plugins=($(ls /usr/share/zsh/plugins/*/*plugin*.zsh))
    for plug in $system_plugins; do
        source $plug
    done
    exit 0
fi

# Auto compile if script changed or first source
plugins=(
    "plugins/zsh-nvm/zsh-nvm.plugin.zsh"
    "plugins/fzf/fzf.zsh"
    "plugins/zsh-vi-mode/zsh-vi-mode.zsh"
    "plugins/zsh-completions/zsh-completions.plugin.zsh"
    "plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
)

for plug in $plugins; do
    autozcompile $plug
    source $plug
done


