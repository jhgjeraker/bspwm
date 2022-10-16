# -----------------------------------------------
# Environment Setup
#
# Add `programs` directory to path.
export BROWSER='firefox'
export EDITOR=/usr/bin/nvim
export PATH="$HOME/programs:$PATH"

export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export PATH="$HOME/.local/bin:$PATH"

# -----------------------------------------------
# Ibus Setup
#
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export XIM_PROGRAM=/usr/bin/ibus-daemon

# -----------------------------------------------
# Anki Setup
#
# Fix an issue where anki would not launch.
export QTWEBENGINE_CHROMIUM_FLAGS="--no-sandbox"

# -----------------------------------------------
# Development
#
export ARDUINO_DIRECTORIES_USER="$HOME/.config/arduino"

# -----------------------------------------------
# Input Devices
#

# Set xinput parameters for certain known devices.
# Thinkpad X1 Extreme Touchpad.
if xinput list | grep -q 'SynPS/2 Synaptics TouchPad'; then
    xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Accel Speed' 0.5
    xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Tapping Enabled' 1
    xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Natural Scrolling Enabled' 1
fi
# Thinkpad X1 Extreme Trackpoint.
if xinput list | grep -q 'TPPS/2 Elan TrackPoint'; then
    xinput --set-prop 'TPPS/2 Elan TrackPoint' 'libinput Accel Speed' 0.5
    xinput --set-prop 'TPPS/2 Elan TrackPoint' 'libinput Accel Profile Enabled' 0, 1
fi
# Thinkpad X13 Gen 2 Touchpad.
if xinput list | grep -q 'ELAN0676:00 04F3:3195 Touchpad'; then
    xinput --set-prop 'ELAN0676:00 04F3:3195 Touchpad' 'libinput Natural Scrolling Enabled' 1
fi
# Surface Laptop 2 Touchpad.
if xinput list | grep -q 'MSHW0092:00 045E:0933 Touchpad'; then
    xinput --set-prop 'MSHW0092:00 045E:0933 Touchpad' 'libinput Natural Scrolling Enabled' 1
fi

# Reload cursor to prevent "X" or oversized.
xsetroot -cursor_name left_ptr
