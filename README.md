# .dotfiles

To use these configs as is, clone it to `~/.dotfiles`

Files are managed with `stow`, just `stow nvim` to symlink the nvim config.

## Mako Ubuntu

Mako clashes with apparmor and does not load from symlinks, so it has to be hardcoded.

Also has problems in general with apparmor file supplied in the distribution. This one works.

```
#include <tunables/global>

profile fr.emersion.Mako /usr/bin/mako {
  #include <abstractions/base>
  #include <abstractions/fonts>
  #include <abstractions/freedesktop.org>
  #include <abstractions/wayland>

  #include <abstractions/dbus-session-strict>
  dbus bind
       bus=session
       name=org.freedesktop.Notifications,
  dbus receive
       bus=session
       path=/fr/emersion/Mako
       interface=fr.emersion.Mako,

  /{run,dev}/shm/mako-* rw,
  owner @{HOME}/.config/mako/config r,

  # Site-specific additions and overrides. See local/README for details.
  #include if exists <local/fr.emersion.Mako>
  owner @{run}/user/[0-9]*/bus rw,
  dbus send
       bus=session
       path=/org/freedesktop/DBus
       interface=org.freedesktop.DBus
       member={Hello,RequestName}
       peer=(name=org.freedesktop.DBus),
  dbus (send)
       bus=session
       path=/org/freedesktop/Notifications
       interface=org.freedesktop.Notifications
       member=NotificationClosed,
  dbus (receive)
       bus=session
       path=/org/freedesktop/Notifications
       interface=org.freedesktop.Notifications
       member={Notify,NotificationClosed,GetServerInformation,GetCapabilities,CloseNotification},

}
```
