#!/bin/bash

# Allow option to skip
YESNO='placeholder'
while [ $YESNO != 'yes' ] && [ $YESNO != 'y' ] && [ $YESNO != 'no' ] && [ $YESNO != 'n' ] && [ $YESNO != 'skip' ]
do
	echo 'Would you like to start your SSH agent now? (y/n or skip)'
	read YESNO
done

# If user chose no or skipped
if [ $YESNO == 'no' ] || [ $YESNO == 'n' ] || [ $YESNO == 'skip' ]
then
	echo 'Skipping setting up SSH agent.'
	exit 0
fi

# Start agent
eval `ssh-agent`

# Add key
ssh-add
