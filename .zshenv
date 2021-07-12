#
# ▒███████▒  ██████   ██░ ██  ▓█████ ███▄    █  ██▒   █▓
# ▒ ▒ ▒ ▄▀░▒██    ▒ ▒▓██░ ██  ▓█   ▀ ██ ▀█   █ ▓██░   █▒
# ░ ▒ ▄▀▒░ ░ ▓██▄   ░▒██▀▀██  ▒███  ▓██  ▀█ ██▒ ▓██  █▒░
#   ▄▀▒   ░  ▒   ██▒ ░▓█ ░██  ▒▓█  ▄▓██▒  ▐▌██▒  ▒██ █░░
# ▒███████▒▒██████▒▒ ░▓█▒░██▓▒░▒████▒██░   ▓██░   ▒▀█░
# ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░  ▒ ░░▒░▒░░░ ▒░ ░ ▒░   ▒ ▒    ░ ▐░
#  ░▒ ▒ ░ ▒░ ░▒  ░ ░  ▒ ░▒░ ░░ ░ ░  ░ ░░   ░ ▒░   ░ ░░
# ░ ░ ░ ░ ░░  ░  ░    ░  ░░ ░    ░     ░   ░ ░       ░
#   ░ ░          ░    ░  ░  ░░   ░           ░       ░
#
# My zsh config. Not much to see here; just some pretty standard stuff.
#

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Default Apps
export TERMINAL="alacritty"
export COLORTERM="truecolor"
export EDITOR="vim"
export VISUAL="vim"
export READER="zathura"
export VIDEO="mpv"
export IMAGE="sxiv"
export BROWSER="firefox"
export PAGER="less"
export CODEEDITOR="notepadqq"
export WM="openbox"
export OPENER="xdg-open"
export QT_QPA_PLATFORMTHEME="qt5ct"

# Fixing Paths
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GOPATH="$XDG_DATA_HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Set Manager
# Uncomment only one of these!

## "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

## "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

## "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

# Disable files
export LESSHISTFILE=-

# Path
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
