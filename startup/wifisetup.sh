#
# ~/startup/wifisetup.sh
#

#!/bin/bash

# All wifi configuration files are named like *-wifi
# Wifi configuration files are in /etc/netctl

PARENTDIRECTORY='/etc/netctl/'
FILENAMESUFFIX='-wifi'


# In case user types invalid wifi name
NAMEISVALID=1
while [ $NAMEISVALID -ne 0 ]
do
	# Welcome message
	echo "Please type wifi name. Type 'skip' to skip this step."

	# Get input
	read WIFINAME
	WIFINAME=$(echo "$WIFINAME" | tr '[:upper:]' '[:lower:]')

	# Check for 'skip'
	if [ $WIFINAME == 'skip' ]
	then
		echo 'Skipped wifi setup.'
		exit 0
	fi

	# Check if file exists for this wifi
	FILENAME=$WIFINAME$FILENAMESUFFIX
	test -f $PARENTDIRECTORY$FILENAME
	NAMEISVALID=$?

	if [ $NAMEISVALID -ne 0 ]
	then
		echo 'No configuration file found for wifi network' $WIFINAME
	fi
done


# Connect to wifi

# Check if wifi is already active and do nothing
WIFISTATE=$(netctl is-active $FILENAME)
if [ $WIFISTATE == 'active' ]
then
	echo 'You are already connected to' $WIFINAME
	echo 'Doing nothing.'
	exit 0
fi

# In case other wifi network is active. To avoid errors
echo 'Disconnecting from other networks...'
sudo netctl stop-all

# Connect to wifi
echo 'Connecting to' $WIFINAME
sudo netctl start $FILENAME

if [ $? -eq 0 ]
then
	echo 'Successfully connected to' $WIFINAME
fi
