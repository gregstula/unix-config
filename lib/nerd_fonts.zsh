#!/bin/env zsh

tmp_clone="/tmp/consolas-nf"
fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d $tmp_clone ]]; then
    git clone https://github.com/ongyx/consolas-nf  /tmp/consolas-nf
fi

cd $tmp_clone
mkdir -p $fonts_dir
cp *.ttf  $fonts_dir
fc-cache
