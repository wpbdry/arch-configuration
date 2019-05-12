#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# My aliases
alias lsblk='lsblk -o NAME,FSUSED,SIZE,FSTYPE,PATH,MOUNTPOINT,UUID'
alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'
alias suspend='systemctl suspend'
alias hibernate='systemctl hibernate'

# Mount Apple disk
#sudo apfs-fuse -o allow_other /dev/sda2 /MacOS

# My scripts
~/startup/startup.sh
