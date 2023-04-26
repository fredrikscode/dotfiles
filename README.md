Don't forget to set permissions (755) on $HOME/.config/polybar/launch.sh since stow's default permissions are borked for this use case.
### Usage
1. Clone to home directory
2. Use stow to link configs (stow alacritty/polybar/picom)
3. Set correct permissions on scripts (ex: polybar's launch.sh) since stow's default permissions are restricted on files.
4. Win.