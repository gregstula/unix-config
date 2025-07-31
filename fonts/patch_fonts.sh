#!/bin/sh
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
