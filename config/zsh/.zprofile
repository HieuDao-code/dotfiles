# Add Homebrew to PATH
# https://wiki.archlinux.org/title/XDG_Base_Directory
XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_HOME=$HOME/.local/share
XDG_STATE_HOME=$HOME/.local/state

local un=$(uname -a)
os="unknown"
if [[ "$un" =~ [Dd]arwin ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi
	
