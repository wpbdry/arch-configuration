#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# My aliases
alias lsblk='lsblk -o NAME,FSUSED,SIZE,FSTYPE,PATH,MOUNTPOINT,UUID'

# My scripts
~/startup/startup.sh
