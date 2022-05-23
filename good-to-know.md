# Make screen brigthness writable for Polybar

sudo chgrp video /sys/class/backlight/intel_backlight/brightness
sudo chmod g+w /sys/class/backlight/intel_backlight/brightness

# Check battery status

cat /sys/class/power_supply/BAT0/capacity

# Multimonitor setup with xrandr

Requires xorg-xrandr

xrandr --output eDP-1 --auto --output DP-2-3 --primary --right-of eDP-1 --auto --output DP-2-2 --right-of DP-2-3 --auto

# Change shell

chsh

# Install oh-my-zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Starship

1. curl -sS https://starship.rs/install.sh | sh
2. Add to end of .zshrc: eval "$(starship init zsh)"


# Laptop keyboard not working

## Check modules

1. Unload atkbd module:
	sudo modprobe -r atkbd
2. Wait a few seconds
3. Load atkbd and i8042 modules
	sudo modprobe atkbd
	sudo modprobe i8042

Does the keyboard work now?

## Load additional kernel modules

1. Edit /etc/mkinitpcio.conf
2. Add "atkbd" and/or "i8042" to "MODULES"
	2.3. Sometimes only one of the modules is needed and both at the same time do not work
3. Run sudo mkinitpcio -p "kernel"

Does the keyboard work now?


# Touchpad settings in xinput

## Find touchpad device

1. Install xinput 
	sudo pacman -S xorg-xinput
2. List devices
	xinput
3. Find device, for example>
	↳ 0X45 0X4C 0X41 0X4E 04F3:3092 Touchpad  	id=12	[slave  pointer  (2)]

## Enable tapping

1. List device properties
	xinput list-props 'id'
2. Find Tapping property. For example
	libinput Tapping Enabled (344):	0
3. Enable tapping property
	xinput set-prop 12 'libinput Tapping Enabled' 1

## Enable natural scrolling

2. Find natural scrlling property, i.e.:
    libinput Natural Scrolling Enabled (323):	0
3. Enable natural scrolling:
    xinput set-prop 12 323 1

# Change keyboard layout

Requires xorg-xinput

setxkblayout -layout de

# Install vim-plug

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

