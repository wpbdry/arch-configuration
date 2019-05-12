#
# ~/scripts/set-screen-brightness.sh
#

#!/bin/bash

# Get real path of file which controls screen brightness
SYMLINK='/sys/class/backlight/intel_backlight'
DIR=$(readlink -f $SYMLINK)

# Check max brightness
MAXBRIGHTNESS=$(cat $DIR/max_brightness)

# In no params passed, print current brightness / max brightness

# If one param passed, set brightness, after checking that it's less than max

# If more params passed, print usage message

