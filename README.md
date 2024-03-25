# Setup new machine
### Install packages
```
pacman -S neovim kitty hyprland xdg-desktop-portal-hyprland waybar wofi dunst
```
### Copy configs
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/da-batt/dotfiles.git $HOME/dotfiles-tmp
rm -r ~/dotfiles-tmp/
```
