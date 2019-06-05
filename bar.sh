while true; do
	BAT=$(cat /sys/devices/platform/smapi/BAT0/remaining_percent)
	BACK=$(xbacklight | cut -c1-2)
	xsetroot -name " BR: $BACK | BAT: $BAT% | $(date) "
	sleep 2
done
