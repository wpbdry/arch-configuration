#
# ~/scripts/set-keyboard-backlight.sh
#

#!/bin/bash

# Get real path of file which controls screen brightness
symlink='/sys/class/leds/smc::kbd_backlight'
dir=$(readlink -f $symlink)

# Check max brightness
max_brightness=$(cat $dir/max_brightness)

# In no params passed, print current brightness / max brightness
if [ "$#" -eq 0 ]
then
	current_brightness=$(cat $dir/brightness)
	echo 'Current backlight' $current_brightness/$max_brightness

# If one param passed, set brightness, after checking that it's less than max
elif [ "$#" -eq 1 ]
then
	if [ $1 -le $max_brightness ]
	then
		echo $1 >> $dir/brightness
	else
		echo 'Please enter a number lower than or equal to' $max_brightness
	fi

# If more params passed, print usage message
else
	echo 'Usage:'
	echo 'Find out current backlight: `~/scripts/set-keyboard-backlight`'
	echo 'Set new backlight: `~/scripts/set-keyboard-backlight <backlight>`'
fi
