#
# ~/bin/helper_scripts/set_brightness.sh
#

# This script is a helper script for the brightness and backlight scripts in ~/bin.
# This file should be sourced, meaning it has access to non environment variables.
# This file expects the variables symlink and setting_name to exist.

# Get real path of file which controls screen brightness
dir=$(readlink -f $symlink)

# Check max brightness
max_brightness=$(cat $dir/max_brightness)

# In no params passed from user, print current brightness / max brightness
if [ "$#" -eq 0 ]
then
	current_brightness=$(cat $dir/brightness)
	echo 'Current' $setting_name':' $current_brightness/$max_brightness'.'

# If one user param passed, set brightness, after checking that it's less than max
elif [ "$#" -eq 1 ]
then
	# Check for 'max'
	if [ $1 == 'max' ]
	then
		echo $max_brightness >> $dir/brightness
	elif [ $1 -le $max_brightness ]
	then
		echo $1 >> $dir/brightness
	else
		echo 'Please enter a number lower than or equal to' $max_brightness
	fi

# If less than 2 or more than 3 params passed, print usage message
else
	echo 'Usage:'
	echo 'Find out current '$setting_name': `'$setting_name'`'
	echo 'Set new '$setting_name': `'$setting_name' <brightness>`'
fi
