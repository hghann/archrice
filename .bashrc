#
#  ▄▄▄▄    ▄▄▄       ██████   ██░ ██  ██▀███    ▄████▄
# ▓█████▄ ▒████▄   ▒██    ▒ ▒▓██░ ██ ▓██ ▒ ██▒ ▒██▀ ▀█
# ▒██▒ ▄██▒██  ▀█▄ ░ ▓██▄   ░▒██▀▀██ ▓██ ░▄█ ▒ ▒▓█    ▄
# ▒██░█▀  ░██▄▄▄▄██  ▒   ██▒ ░▓█ ░██ ▒██▀▀█▄  ▒▒▓▓▄ ▄██
# ░▓█  ▀█▓▒▓█   ▓██▒██████▒▒ ░▓█▒░██▓░██▓ ▒██▒░▒ ▓███▀
# ░▒▓███▀▒░▒▒   ▓▒█▒ ▒▓▒ ▒ ░  ▒ ░░▒░▒░ ▒▓ ░▒▓░░░ ░▒ ▒
# ▒░▒   ░ ░ ░   ▒▒ ░ ░▒  ░ ░  ▒ ░▒░ ░  ░▒ ░ ▒    ░  ▒
# ░    ░   ░   ▒  ░  ░  ░    ░  ░░ ░  ░░   ░  ░
# ░            ░        ░    ░  ░  ░   ░      ░ ░
#
# My zsh config. Not much to see here; just some pretty standard stuff.

# Path
export QT_QPA_PLATFORMTHEME="qt5ct"
export MAN_DISABLE_SECCOMP=1

# Basic bash settings
set -o vi
bind 'set completion-ignore-case on'
shopt -s cdspell
complete -d cd

# Prompt settings
PS1="\e[0;32m";
PS1+="\w> ";
PS1+="\e[0m";
export PS1;

# Setting up defaults
export EDITOR='vim'
export TERMINAL='alacritty'
export BROWSER='firefox'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Aliases
alias v='vim'

# Deploying randomcolors script
/usr/local/bin/randomcolors.sh
