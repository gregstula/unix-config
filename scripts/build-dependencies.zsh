#!/usr/bin/env zsh

 cd ..
 git submodule update --init --remote
 git submodule update --init --recursive
 cd vim.config/vim/bundle/YouCompleteMe

 # Build YouCompleteMe
 if hash clang 2>/dev/null && hash rustc 2>/dev/null && hash go 2>/dev/null && hash mono 2>/dev/null && hash python 2>/dev/null && hash npm 2>/dev/null; then
 CXX=clang++ CC=clang ./install.py --all
 elif hash clang 2>/dev/null; then
 	echo "Missing some dependencies for YouCompleteMe, installing with clang-completer only"
 	./install.py --clang-completer
 else
 	echo "Missing clang stack... YouCompleteMe must be built manually after installing atleast clang."
 	echo "Skipping..."
 fi
