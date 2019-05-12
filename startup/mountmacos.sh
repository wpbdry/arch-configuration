#
# ~/startup/mountmacos.sh
#

#!/bin/bash

echo 'Mounting MacOS partition...'
sudo apfs-fuse -o allow_other /dev/sda2 /MacOS
echo 'Done!'
