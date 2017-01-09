#!/usr/local/bin/zsh

# MicrosoftFontInstaller.zsh
# The MIT License (MIT) [https://opensource.org/licenses/MIT]
# Copyright (c) 2016 Gregory D. Stula
#  
#  Created by Gregory D. Stula on 1/4/16.
#  

echo "Attempting to grab Microsoft fonts..."

if [ ! -f /usr/local/bin/cabextract || -f /usr/local/bin/mkfontsdir]; then
    echo "Dependencies missing! Please run \`\$PACKAGE_MANAGER install cabextract mkfontsdir curl\` and try again."
    exit
fi

set -e
set -x
mkdir temp
cd temp
curl -O http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/PowerPointViewer.exe
cabextract -L -F ppviewer.cab PowerPointViewer.exe
cabextract ppviewer.cab

if [ ! -d ~/fonts ]; then
    mkdir ~/.fonts
fi

mv *.TTF ~/.fonts/
cd ~/.fonts
mkfontsdir
xset fp+ ~/.fonts
xset fp rehash

echo "Successfully installed Microsoft Fonts"
