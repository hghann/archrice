[[ -f ~/.bashrc ]] && . ~/.config/bashrc

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export HISTFILE="$XDG_DATA_HOME"/bash/history

export EDITOR="vim"
export READER="zathura"
export VISUAL="vim"
export CODEEDITOR="notepadqq"
export TERMINAL="alacritty"
export BROWSER="firefox"
export COLORTERM="truecolor"
export PAGER="less"
export WM="openbox"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi
