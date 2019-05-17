# Arch configuration

This repository will contain all custom configuration files for my Arch Linux system.

## Hardware details

Apple MacBook Pro, 13-inch, Early 2015 \
Processor: 2.7 GHz Intel Core i5 \
Memory: 16 GB 1867 MHz DDR3 \
Intel Iris Graphics 6100 1536 MB
Native resolution: 2560x1600 at 227ppi

## Setup

```bash
cd ~
git init
git remote add origin https://wpbdry@github.com/wpbdry/arch-configuration
git pull
```

Some scripts, which need helper scripts and which need to be able to be run with sudo,
contain hard coded absolute paths.
If your username is not william, please change lines in
```
~/bin/brightness
~/bin/backlight
```

Some config files are not stored in the home directory.
These have been copied into ~/other_config_files/
You will need to copy each one individually into its correct location.
