# Installation
### Install dependencies
```
yay -S neovim kitty hyprland xdg-desktop-portal-hyprland waybar wofi dunst wlogout
```
### Copy configs
```
git clone https://github.com/da-batt/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles checkout -f
dotfiles config --local status.showUntrackedFiles no
```
