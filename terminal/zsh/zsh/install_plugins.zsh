# Copyright (C) 2025 Gregory Stula
if [[ $(id -u) -eq 0 ]]; then
    exit 0
fi

topleveldir="$(git rev-parse --show-toplevel 2>/dev/null)"
plugins_dir="${topleveldir}"/terminal/zsh/zsh/plugins

# fzf integration
# https://thevaluable.dev/fzf-shell-integration/
# <Ctrl-t> Fuzzy find all files and directories at .
# <Alt-c> Fuzzy find all directories at . and cd into the one you pick
# <Ctrl-r> Fuzzy fid through zsh history and output the selection
mkdir -p $plugins_dir/fzf
command -v fzf &>/dev/null && fzf --zsh >$plugins_dir/fzf/fzf.zsh

git submodule init
git submodule update

if [[ ! -f $plugins_dir/zsh-completions/src/_git ]]; then
    curl https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh -o $plugins_dir/zsh-completions/src/_git
fi
