#
# ~/.profile
#

# This is the main file for all general shell personalizations.
# Any configurations that should persist regardless of shell type (bash, zsh, etc) should go in this file.
# Shell specific configurations should go in the respective rc file.
# Additionally, the line `. ~/.profile` should be run by every shell

# My startup scripts
~/bin/startup

# My aliases
. ~/.aliases

# My scripts
PATH=$PATH:~/bin

# PROMPT_COMMAND: Keep my own log of all shell commands
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/shell_logs/shell_history_$(date "+%Y-%m-%d").log; fi'
