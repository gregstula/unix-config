#!/bin/env zsh
# setup-environment
# The MIT License (MIT) [https://opensource.org/licenses/MIT]
# Copyright (c) 2016 Gregory D. Stula
#
#  Created in Ruby by Gregory D. Stula on 1/4/16.
#  Rewritten in zsh by Gregory D. Stula on 7/21/24.

# Enable pearl matching operator
set -o rematchpcre

topleveldir=$(git rev-parse --show-toplevel 2>/dev/null)

filenames=('zshrc' 'zsh' 'vimrc' 'vim')

msg=()

for file in $filenames; do
    # to make zsh.config and vim.config, remove rc
    [[ ${file} =~ '(zsh|vim)' ]]
    config=${match[1]}.config

    rc=${HOME}/.${file}
    src=${topleveldir}/${config}/${file}

    rm -rf ${rc}
    msg+="%F{red}Removed ${rc}"
    ln -s ${src} ${rc}
    msg+="%F{white}|  %F{green}Created new symlink from ${src} to ${rc}"
done

if [[ ! -d "${HOME}/.config" ]]; then
    mkdir -p "${HOME}/.config"
fi

filenames=('nvim')
for file in $filenames; do
    rc=${HOME}/.config/${file}
    src=${topleveldir}/${file}.config/${file}

    rm -rf ${rc}
    msg+="%F{red}Removed ${rc}"

    ln -s ${src} ${rc}
    msg+="%F{white}|  %F{green}Created new symlink from ${src} to ${rc}"
done

print -a -C 2 -P ${msg}

