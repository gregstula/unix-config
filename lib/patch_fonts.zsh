#!/bin/env zsh
# Require FontForge
if (($+commands[pacman])); then
    sudo pacman -S fontforge --noconfirm
fi

# Patches the fonts using the files on windows
tmp=$(mktemp -d)
cp /mnt/C/Windows/Fonts/consola*.ttf $tmp
for file in $tmp/*.ttf; do
    echo $file
    # Complete patch Regular
    ./FontPatcher/font-patcher -c --outputdir . $file
    #Complete patch mono
    ./FontPatcher/font-patcher -cs --outputdir . $file
done

echo "Fonts patched."
echo "Press any key to proceed with install..."
read -k1 -s
echo

fontsdir="${HOME}/.local/share/fonts"
mkdir -p $fontsdir
mv *.ttf $fontsdir
fc-cache
echo "Fonts installed"
