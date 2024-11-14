#!/bin/sh
fuser -sk -SIGINT "$0"
test "$1" = off && exit 0
[ "${FLOCKER}" != "$0" ] && exec env FLOCKER="$0" flock -enx "$0" "$0" "$@" || :
exec wl-screenrec -f ~/Videos/recording_$(date +%F_%H-%M-%S).mp4 -g "$(slurp)"
