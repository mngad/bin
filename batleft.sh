PLAYIN=$(echo -n 'bat: '; cat /sys/devices/platform/smapi/BAT0/remaining_percent | tr '\n' ' '; echo '%')
notify-send -u critical -t 3000 "$PLAYIN"
