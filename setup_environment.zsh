#!/bin/env zsh
# setup-environment
# The MIT License (MIT) [https://opensource.org/licenses/MIT]
# Copyright (c) 2016 Gregory D. Stula
#
#  Created in Ruby by Gregory D. Stula on 1/4/16.
#  Rewritten in zsh by Gregory D. Stula on 7/21/24.

# Enable pearl matching operator
set -o rematchpcre

# find out where repo is
topleveldir=$(git rev-parse --show-toplevel 2>/dev/null)
msg=()
src=""
target=""

function remove_old {
    rm -rf ${target}
    msg+="%F{red}Removed ${target}"
}

function link_new {
    ln -s ${src} ${target}
    msg+="%F{white}|  %F{green}Created new symlink from ${src} to ${target}"
}

# This handles zsh and vim
# Array of config files
filenames=('zshrc' 'zsh' 'vimrc' 'vim')
for file in $filenames; do
    # Get name of config dir
    [[ ${file} =~ '(zsh|vim)' ]]
    config=${match[1]}

    # install target
    target=${HOME}/.${file}
    # source
    src=${topleveldir}/${config}/${file}

    remove_old
    link_new
done

# Neovim uses a base directory and xdg standard ~/.config
# https://specifications.freedesktop.org/basedir-spec/latest/#basics
XDG_CONFIG_HOME="${HOME}/.config"
mkdir -p ${XDG_CONFIG_HOME}

target=${XDG_CONFIG_HOME}/nvim
src=${topleveldir}/nvim

remove_old
link_new

# Konsole themes
target="${HOME}/.local/share/konsole"
src=${topleveldir}/konsole

remove_old
link_new

# Print message
print -a -C 2 -P ${msg}

