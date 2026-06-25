#!/bin/bash
ln -sf ~/dotfiles/hypr ~/.config/
ln -sf ~/dotfiles/waybar ~/.config/
ln -sf ~/dotfiles/kitty ~/.config/
ln -sf ~/dotfiles/rofi ~/.config/
ln -sf ~/dotfiles/nvim ~/.config/
ln -sf ~/dotfiles/tmux ~/.config/
ln -sf ~/dotfiles/tmuxinator ~/.config/

# lazygit: symlink only config.yml (lazygit writes state.yml into its config
# dir, so we don't link the whole directory). Config path differs by OS.
if [[ "$OSTYPE" == darwin* ]]; then
  lazygit_dir="$HOME/Library/Application Support/lazygit"
else
  lazygit_dir="$HOME/.config/lazygit"
fi
mkdir -p "$lazygit_dir"
ln -sf ~/dotfiles/lazygit/config.yml "$lazygit_dir/config.yml"

echo "Dotfiles linked!"
