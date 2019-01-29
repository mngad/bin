calc(){ awk "BEGIN { print $* }"; }
echo -n 'bat: '
cat /sys/devices/platform/smapi/BAT0/remaining_percent
echo -n 'hours left: '
TIMELEFT=$(cat /sys/devices/platform/smapi/BAT0/remaining_running_time_now)
HOUR=60
echo -n $(($TIMELEFT / $HOUR)) | cut -zd. -f 1
MINS=$(calc $TIMELEFT/$HOUR | cut -d. -f 2)
echo -n ':'
echo $(($MINS * 60)) | cut -c 1-2
echo -n 'date: '
date | cut -c 5-16;
echo -n 'Music: '
mpc | head -n 2 | tail -n 1 | cut -d ' ' -f 1 
mpc | head -n 1
