[[ -f ~/.bashrc ]] && . ~/.bashrc

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
