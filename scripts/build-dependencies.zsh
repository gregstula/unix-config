#!/bin/env zsh

cd ..
git submodules update --init --remote
git submodules update --init --recursive
cd vim.config/vim/bundle/YouCompleteMe

# Build YouCompleteMe
if hash clang 2>/dev/null && hash rustc 2>/dev/null && hash go 2>/dev/null && hash mono 2>/dev/null && hash python 2>/dev/null && hash npm 2>/dev/null; then
	`./install.py --all`
elif hash clang 2>/dev/null; then
	echo "Missing some dependencies for YouCompleteMe, installing with clang-completer only"
	`./install.py --clang-completer`
else
	echo "Missing clang stack... YouCompleteMe must be built manually after installing atleast clang."
	echo "Skipping..."
fi

# Build zsh-git-status if haskell-stack is installed, otherwise it's not really necessary to function. I.E. we can silently fail here.
if hash stack 2>/dev/null; then
	cd ../../../../zsh.config/zsh/plugins/zsh-git-prompt
	`stack setup`
	`stack build && stack install`
fi

# Install eclim if eclipse and java are already installed
if hash java 2>/dev/null && hash curl 2>/dev/null && hash eclipse 2>/dev/null; then
	cd
	`curl -O https://github.com/ervandew/eclim/releases/download/2.6.0/eclim_2.6.0.jar`
	echo "Running eclim installer..."
	`java -jar eclim_2.6.0.jar`
	`rm -rf eclim_2.6.0.jar`
fi


