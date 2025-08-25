#!/bin/env zsh
# setup-environment
#
# Created in Ruby by Gregory D. Stula on 1/4/16.
# Rewritten in zsh by Gregory D. Stula on 7/21/24.
#
# Copyright (c) 2016-2025 Gregory D. Stula
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>
#

XDG_CONFIG_HOME="${HOME}/.config"
# Neovim and many other moder programs use the XDG BASE DIRECTORY standard
# eg ~/.config, ~/.local, ~/.cache, etc.
# Uncomment to use as needed
# https://specifications.freedesktop.org/basedir-spec/latest/#basics
#XDG_LOCAL_HOME="${HOME}/.local"
#XDG_CACHE_HOME="${HOME}/.cache"
XDG_DATA_HOME="${HOME}/.local/share"
#XDG_STATE_HOME="${HOME}/.local/state"
#XDG_BIN_HOME="${HOME}/.local/bin"

# Enable pearl matching operator
set -o rematchpcre

# find out where repo is
topleveldir="$(git rev-parse --show-toplevel 2>/dev/null)"
dotfiles="${topleveldir}"/terminal
msg=()

mkdir -p ${XDG_CONFIG_HOME}
mkdir -p ${XDG_DATA_HOME}

function remove_old {
    local symlink=$1
    rm -rf ${symlink}
    msg+="%F{red}Removed ${symlink}%f"
}

function link_new {
    local original="$1"
    local symlink="$2"
    ln -s ${original} ${symlink}
    msg+="%F{white}|%f  %F{green}Created new symlink from ${original} to ${symlink}%f"
}

# This handles zsh and vim
# NOTE: zsh and vim are currently set up to use dotfiles in home
# Which is jus the older (better) way of doing things
# Array of config files
filenames=('zshrc' 'zsh' 'vimrc' 'vim')
for file in $filenames; do
    # Get name of config dir
    [[ ${file} =~ (zsh|vim) ]]
    config="${match[1]}"

    # install target
    target="${HOME}/.${file}" #prefix dot
    # source
    src="${dotfiles}/${config}/${file}"

    remove_old ${target}
    link_new ${src} ${target}
done

remove_old ${HOME}/.zshenv
link_new ${dotfiles}/zsh/zshenv ${HOME}/.zshenv

remove_old ${XDG_CONFIG_HOME}/nvim
link_new ${topleveldir}/terminal/nvim ${XDG_CONFIG_HOME}/nvim

remove_old ${XDG_CONFIG_HOME}/ghostty
link_new ${dotfiles}/ghostty  ${XDG_CONFIG_HOME}/ghostty

# Konsole themes
remove_old ${XDG_DATA_HOME}/konsole
link_new ${dotfiles}/konsole ${XDG_DATA_HOME}/konsole

# Print message
# -a print arguments with the column incrementing first. Only useful with the -c and -C options.
# -C Print the arguments in cols columns. Unless -a is also given, arguments are printed with the row incrementing first.
# Perform prompt expansion (see Prompt Expansion) e.g zsh colors: %F{red}I'm Red%f
print -a -C 2 -P ${msg}

./terminal/zsh/zsh/install_plugins.zsh
print -P "%F{cyan} Submoduling installed %f"

if [[ $UID -ne 0 ]]; then
    # Get nerdfonts if missing
    mkdir -p "${HOME}/.local/share/fonts"
    # (N) is a glob qualifier that makes pattern expand to nothing
    # (rather than remail a literal string) when no matches are found
    files=(${HOME}/.local/share/fonts/*NerdFont*.ttf(N))

    # Check length of array if empty, then we need nerdfonts
    if [[ ${#files[@]} -eq 0 ]]; then
        echo "Grabbing basic nerd font"
        ./fonts/fast_nerd_fonts.sh
    else
        echo "All good!"
    fi
fi

