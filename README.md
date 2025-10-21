# .dotfiles

To use these configs as is, clone it to `~/.dotfiles`

Files are managed with `stow`, just `stow nvim` to symlink the nvim config.

## Other tidbits

Disable the power key on your HHKB by changing `/etc/systemd/logind.conf`
to `HandlePowerKey=ignore`.

Flickering or white screen on amdgpu? Try kernel param `amdgpu.sg_display=0`.

## Package list

```
bpython
fscrypt
fzf
git
grimshot
mako
mpv
ncspot
neovim
noto-fonts-cjk
noto-fonts-emoji
noto-fonts-extra
otf-font-awesome
reflector
ripgrep
rofi-wayland
rustup
signal-desktop
youtube-music-bin
stow
sway
swaybg
swayidle
swayimg
swaylock
ttc-iosevka
ttc-iosevka-aile
ttc-iosevka-etoile
ttc-iosevka-slab
waybar
wezterm
wf-recorder
wl-clipboard
xdg-desktop-portal
xdg-user-dirs
xorg-xwayland
yay
gruvbox-material-gtk-theme-git
gruvbox-material-icon-theme-git
```
