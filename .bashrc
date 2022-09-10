# File: .bashrc
# Maintainer: Worthyox

# Path
export QT_QPA_PLATFORMTHEME="qt5ct"
export MAN_DISABLE_SECCOMP=1

# Basic bash settings
complete -d cd
# set vi mode
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
# shopt
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control
# ignore upper and lowercase when TAB completion
bind 'set completion-ignore-case on'

# Path
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

# Prompt settings
PS1='\e[1;31m[\e[1;33m\u\e[1;32m@\e[1;34m\h \e[1;35m\w\e[1;31m]\e[0m\$ '
export PS1;
# minimal prompt
#PS1="\e[0;32m";
#PS1+="\w> ";
#PS1+="\e[0m";

# Setting up defaults
export EDITOR='vim'
export TERMINAL='alacritty'
export BROWSER='firefox'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# Deploying randomcolors script
/usr/local/bin/randomcolors.sh
