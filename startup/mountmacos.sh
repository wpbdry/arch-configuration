#
# ~/startup/mountmacos.sh
#

#!/bin/bash

# Settings
PARTUUID='39ff1bc9-2aa6-42aa-8596-a3323a50f1be'
MOUNTPOINT='/MacOS'

# Mount partition
echo 'Mounting MacOS partition...'
PARTNAME=$(findfs UUID=$PARTUUID)
sudo apfs-fuse -o allow_other $PARTNAME $MOUNTPOINT

# Check success
if [ $? -eq 0 ]
then
	echo $PARTNAME 'successfully mounted as read-only at' $MOUNTPOINT
fi
