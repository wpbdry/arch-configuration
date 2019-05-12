#
# ~/startup/startup.sh
#

#!/bin/bash

# Welcome message
echo 'Setting some things up...'

# Mount MacOS partition
~/startup/mountmacos.sh

# Connect to wifi
~/startup/wifisetup.sh
