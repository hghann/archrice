#!/bin/zsh

######################################################################
# @author      : hg (https://github.com/hghann)
# @file        : .zshenv
# @created     : Wed 27 Jan 5:43:18 2021
#
# @description : Runs on login. Environmental variables are set here.
######################################################################

# Adds `~/.local/bin` to $PATH
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Options
unsetopt PROMPT_SP

# Default Apps
export WM="dwm"
export TERMINAL="alacritty"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export EDITOR="nvim"
export VISUAL="nvim"
export CODEEDITOR="notepadqq"
export READER="zathura"
export VIDEO="mpv"
export IMAGE="sxiv"
export PAGER="less"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#export MANPAGER="nvim -c 'set ft=man' -"
export BROWSER="librewolf"
export QT_QPA_PLATFORMTHEME="qt5ct"
export BUKUSERVER_PER_PAGE=100
export GHLENABLECOLOR=1

# $HOME Clean-up:
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority # This line will break some DMs.
export ICEAUTHORITY="${XDG_CACHE_HOME:-$HOME/.cache}/ICEauthority"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"
export R_HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/r/.Rhistory"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rust"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export LESSHISTFILE="-"

# Other program settings:
export REFER="$HOME/documents/referbib"
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm
export SDCV_PAGER='bat --pager "less -RF"'
#export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_OPTS="--color=dark"
#export LESS=-R
#export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.

# This is the list for lf icons:
export LF_ICONS="\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.vimrc=:\
*.viminfo=:\
*.gitignore=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
