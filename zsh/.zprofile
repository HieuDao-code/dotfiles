# Add Homebrew to PATH
local un=$(uname -a)
os="unknown"
if [[ "$un" =~ [Dd]arwin ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi
	
