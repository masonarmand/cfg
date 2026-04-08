#!/bin/sh
set -eu

echo "creating vim colors directory..."
mkdir -p "$HOME/.vim/colors"

echo "creating xfce4-terminal colorschemes directory..."
mkdir -p "$HOME/.local/share/xfce4/terminal/colorschemes"

echo "copying vim colorscheme(s) to $HOME/.vim/colors/"
cp colors/* "$HOME/.vim/colors/"

echo "vopying xfce4-terminal theme to $HOME/.local/share/xfce4/terminal/colorschemes/"
cp plan9.theme "$HOME/.local/share/xfce4/terminal/colorschemes/"

echo "installing .vimrc to $HOME/.vimrc"
cp .vimrc "$HOME/.vimrc"

echo "done"
