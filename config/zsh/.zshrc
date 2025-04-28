# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Source zsh plugins
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # syntax highlighting
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh # auto suggestions
fpath=($ZDOTDIR/plugins/zsh-completions/src $fpath) # additional zsh completions
source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh # history search
source $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh # fzf-tab

## Powerlevel10k
if [ "$OS" = "Darwin" ]; then
  source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
else
  source ~/powerlevel10k/powerlevel10k.zsh-theme
fi

## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Shell Autocompletion after these commands
autoload -Uz compinit && compinit

## uv
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

## fnm (fast node mananger)
OS="$(uname -s)"
if [ "$OS" = "Darwin" ]; then
  eval "$(fnm env --use-on-cd --shell zsh)"
else # linux
  FNM_PATH="$HOME/.local/share/fnm"
  if [ -d "$FNM_PATH" ]; then
    export PATH="$HOME/.local/share/fnm:$PATH"
  fi
  eval "$(fnm env --shell zsh)"
fi
eval "$(fnm completions --shell zsh)"

## zoxide, smarter cd command
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
if [ "$OS" = "Darwin" ]; then
  eval "$(fzf --zsh)"
else # linux
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion stlyle
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# fzf-tab tmux pop up
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup 
# zoxide preview
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
