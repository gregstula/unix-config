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

# This handles zsh and vim
# Array of config files
filenames=('zshrc' 'zsh' 'vimrc' 'vim')

msg=()

for file in $filenames; do
    # Get name of config dir
    [[ ${file} =~ '(zsh|vim)' ]]
    config=${match[1]}

    # install target
    target=${HOME}/.${file}
    # source
    src=${topleveldir}/${config}/${file}

    # remove old zshrc and vimrc
    rm -rf ${target}
    msg+="%F{red}Removed ${target}"

    # symlink from repo
    ln -s ${src} ${target}
    msg+="%F{white}|  %F{green}Created new symlink from ${src} to ${target}"
done

if [[ ! -d "${HOME}/.config" ]]; then
    mkdir -p "${HOME}/.config"
fi

# Neovim uses a base directory and xdg standard ~/.config
# $XDG_CONFIG_HOME
# https://specifications.freedesktop.org/basedir-spec/latest/#basics
# Other xdg base directory configs could fit well here as well
base_dirs=('nvim')
for base_dir in $base_dirs; do
    target=${XDG_CONFIG_HOME}/${base_dir}
    src=${topleveldir}/${base_dir}

    # Remove old if any
    rm -rf ${target}
    msg+="%F{red}Removed ${target}"

    ln -s ${src} ${target}
    msg+="%F{white}|  %F{green}Created new symlink from ${src} to ${target}"
done

# Print message
print -a -C 2 -P ${msg}

