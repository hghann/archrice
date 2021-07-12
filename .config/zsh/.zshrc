#
# ▒███████▒  ██████   ██░ ██  ██▀███    ▄████▄
# ▒ ▒ ▒ ▄▀░▒██    ▒ ▒▓██░ ██ ▓██ ▒ ██▒ ▒██▀ ▀█
# ░ ▒ ▄▀▒░ ░ ▓██▄   ░▒██▀▀██ ▓██ ░▄█ ▒ ▒▓█    ▄
#   ▄▀▒   ░  ▒   ██▒ ░▓█ ░██ ▒██▀▀█▄  ▒▒▓▓▄ ▄██
# ▒███████▒▒██████▒▒ ░▓█▒░██▓░██▓ ▒██▒░▒ ▓███▀
# ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░  ▒ ░░▒░▒░ ▒▓ ░▒▓░░░ ░▒ ▒
#  ░▒ ▒ ░ ▒░ ░▒  ░ ░  ▒ ░▒░ ░  ░▒ ░ ▒    ░  ▒
# ░ ░ ░ ░ ░░  ░  ░    ░  ░░ ░  ░░   ░  ░
#   ░ ░          ░    ░  ░  ░   ░      ░ ░
#
# My zsh config. Not much to see here; just some pretty standard stuff.
#
# Initial Setup
# touch "$HOME/.local/share/zsh/history
# Setup Alias in $HOME/.config/zsh/aliasrc

# Enabling prompt colors
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Setting history file and some options
HISTSIZE=10000                  # How many lines of history to keep in memory
SAVEHIST=10000                  # Number of history entries to save to disk
setopt appendhistory            # Append history to the history file (no overwriting)
setopt sharehistory             # Share history across terminals
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
#HISTDUP=erase                  # Erase duplicates in the history file

# loading aliasrc
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"

# Setting key bindings
bindkey '^ ' autosuggest-accept

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

# Deploying randomcolors script
/usr/local/bin/randomcolors.sh

# Souricing zsh plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Setting the starship prompt 
eval "$(starship init zsh)"
