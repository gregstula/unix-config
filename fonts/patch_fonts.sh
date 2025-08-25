#!/bin/env bash
trap 'echo "An error occurred. Exiting..."; exit 1;' ERR
# Require FontForge
if ! command -v fontforge >/dev/null 2>&1; then
    if command -v pacman >/dev/null 2>&1; then
        echo "FontForge is not installed. Installing..."
        sudo pacman -S fontforge --noconfirm
    else
        echo "FontForge is not installed. Please install it manually."
        exit 1
    fi
fi

#!/bin/sh
curl -L -H "User-Agent: Mozilla/5.0" -O https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip
unzip FontPatcher.zip -d FontPatcher

# Patches the fonts using the files on windows
tmp=$(mktemp -d)
cp /mnt/C/Windows/Fonts/consola*.ttf "$tmp"
for file in "${tmp}"/*.ttf; do
    echo "${file}"
    # Complete patch Regular
    ./FontPatcher/font-patcher -c --outputdir . "$file"
    #Complete patch mono
    ./FontPatcher/font-patcher -cs --outputdir . "$file"
done

rm -rf FontPatcher.zip
rm -rf FontPatcher

echo "Fonts patched."
read -r -n1 -s -p "Press any key to proceed with install..."
echo

fontsdir="${HOME}/.local/share/fonts"
mkdir -p "$fontsdir"
mv ./*.ttf "$fontsdir"
fc-cache
echo "Fonts installed"
