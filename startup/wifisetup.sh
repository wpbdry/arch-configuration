#!/bin/bash

# # EXIT CODES
# 0: wifi connection successful
# 1: user typed 'exit'
# 2: user typed 'skip'
# 3: wifi file doesn't exist

# Welcome message
echo "Please type wifi name. Type 'skip' to skip this step."
# Get input
read WIFINAME

# Check for 'exit'
if [ $WIFINAME == 'exit' ]
then
	exit 1
fi

# Check for 'skip'
if [ $WIFINAME == 'skip' ]
then
	echo 'Skipped wifi setup.'
	exit 2
fi

# Check if file exists for this wifi
FILENAMESUFFIX='-wifi'
FILENAME=$WIFINAME$FILENAMESUFFIX
test -f /etc/netctl/$FILENAME
if [ $? -ne 0 ]
then
	echo 'No configuration file found for wifi network' $WIFINAME
	exit 3
fi

# Connect to wifi
netctl start $FILENAME
