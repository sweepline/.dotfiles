# .dotfiles

To use these configs as is, clone it to `~/.dotfiles`

Files are managed with `stow`, just `stow nvim` to symlink the nvim config.

For `opencode`, use `stow --no-folding opencode` so `~/.config/opencode` stays a real directory and machine-local state like `service.json` (which contains a local service password) is not written into the repository.

For `pi`, also use `stow --no-folding pi` so `~/.pi/agent` stays a real directory and secrets/state like `auth.json` and `sessions/` are not written into the repository. Only `settings.json`, `models.json` and `mcp.json` are tracked.

## Other tidbits

Disable the power key on your HHKB by changing `/etc/systemd/logind.conf`
to `HandlePowerKey=ignore`.

Flickering or white screen on amdgpu? Try kernel param `amdgpu.sg_display=0`.

## Package list

```
yazi
bottom
bpython
fzf
git
mpv
neovim
noto-fonts-cjk
noto-fonts-emoji
noto-fonts-extra
otf-font-awesome
ripgrep
rofi-wayland
rustup
signal-desktop
stow
ttc-iosevka
ttc-iosevka-aile
ttc-iosevka-etoile
ttc-iosevka-slab
kitty
xdg-desktop-portal
xdg-user-dirs
yay
gruvbox-material-gtk-theme-git
gruvbox-material-icon-theme-git
sway
swaybg
swayidle
swayimg
swaylock
waybar
mako
ncspot
wf-recorder
wl-clipboard
```
