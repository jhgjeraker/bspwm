# .bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# -----------------------------------------------
# General
# 
# limits recursive functions
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100 

# Remove background highlights for permissioned directories.
eval "$(dircolors $HOME/.config/dircolors)"

# Quick usage-lookup of any tool directly in the terminal.
# Example: `>> cheat sed`
function cheat() {
    curl "http://cheat.sh/$1"
}


# -----------------------------------------------
# PS1
#
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ (\1)/'
}

export PS1='\[\033[01;32m\]>> \[\033[00m\]\[\033[01;34m\]\W\[\033[01;32m\]$(parse_git_branch)\[$(tput sgr0)\]: '


# -----------------------------------------------
# Aliases
#
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lha'

# In case I get stuck with CapsLock turned on.
alias capslock='xdotool key Caps_Lock'
alias CAPSLOCK='xdotool key Caps_Lock'

# Monitor Configurations.
alias mm='sh /usr/local/bin/monitors.sh'

# Applications
alias py='python3'
alias bt='bluetoothctl'
alias feh='feh --auto-rotate'


# -----------------------------------------------
# Application Specific
#
# Ranger
export RANGER_LOAD_DEFAULT_RC=FALSE
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
alias pei='source /usr/local/bin/pyenv-init.sh'
alias pea='pei && pyenv activate'
alias ped='pei && pyenv deactivate'
alias pel='pei && pyenv virtualenvs'

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# -----------------------------------------------
# Development
#
# Golang
export GOPATH=$HOME/dev/go
export PATH="$PATH:$HOME/dev/go/bin"

# AWS
export SAM_CLI_TELEMETRY=0

# Terraform
export PATH="$HOME/.tfenv/bin:$PATH"

# Disruptive Technologies
export DT_CREDENTIALS_FILE='/home/kepler/.config/disruptive/DT_CREDENTIALS_FILE.json'

# Google Cloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/kepler/dev/google-cloud-sdk/path.bash.inc' ]; then . '/home/kepler/dev/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/kepler/dev/google-cloud-sdk/completion.bash.inc' ]; then . '/home/kepler/dev/google-cloud-sdk/completion.bash.inc'; fi

