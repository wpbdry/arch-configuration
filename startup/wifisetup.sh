#
# ~/startup/wifisetup.sh
#

# All wifi configuration files are named like *-wifi
# Wifi configuration files are in /etc/netctl

parent_directory='/etc/netctl/'
filename_suffix='-wifi'


# In case user types invalid wifi name
name_is_valid=1
while [ $name_is_valid -ne 0 ]
do
	# Welcome message
	echo "Please type wifi name. Type 'skip' to skip this step."

	# Get input
	read wifi_name
	wifi_name=$(echo "$wifi_name" | tr '[:upper:]' '[:lower:]')

	# Check for 'skip'
	if [ $wifi_name == 'skip' ]
	then
		echo 'Skipped wifi setup.'
		exit 0
	fi

	# Check if file exists for this wifi
	filename=$wifi_name$filename_suffix
	test -f $parent_directory$filename
	name_is_valid=$?

	if [ $name_is_valid -ne 0 ]
	then
		echo 'No configuration file found for wifi network' $wifi_name
	fi
done


# Connect to wifi

# Check if wifi is already active and do nothing
wifi_state=$(netctl is-active $filename)
if [ $wifi_state == 'active' ]
then
	echo 'You are already connected to' $wifi_name
	echo 'Doing nothing.'
	exit 0
fi

# In case other wifi network is active. To avoid errors
echo 'Disconnecting from other networks...'
sudo netctl stop-all

# Connect to wifi
echo 'Connecting to' $wifi_name
sudo netctl start $filename

if [ $? -eq 0 ]
then
	echo 'Successfully connected to' $wifi_name
fi
