#
# ~/startup/mountmacos.sh
#

#!/bin/bash

# Settings
partition_id='39ff1bc9-2aa6-42aa-8596-a3323a50f1be'
mountpoint='/MacOS'

# Mount partition
echo 'Mounting MacOS partition...'
partition_name=$(findfs UUID=$partition_id)
sudo apfs-fuse -o allow_other $partition_name $mountpoint

# Check success
if [ $? -eq 0 ]
then
	echo $partition_name 'successfully mounted as read-only at' $mountpoint
fi
