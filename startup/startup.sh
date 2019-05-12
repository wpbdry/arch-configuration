#
# ~/startup/startup.sh
#

#!/bin/bash

# Mount MacOS partition
~/startup/mountmacos.sh

# Welcome message
echo "Welcome to setup. Type 'exit' to not do this now."


# Connect to wifi

# In case user mistypes
wifiexitcode="3"
while [ $wifiexitcode -eq 3 ]
do
	~/startup/wifisetup.sh
	wifiexitcode=$?
done

# If user typed 'exit'
if [ $wifiexitcode -eq 1 ]
then
	echo 'Thank you!'
	exit 0
fi

# Start SSH agent

~/startup/sshsetup.sh
