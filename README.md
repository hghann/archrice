# The Archrice (Worthyox's dotfiles)

This repository contains my personal dotfiles. They are stored here for convenience so that I may quickly access them on new machines or new installs. Also, others may find some of my configurations helpful in customizing their own dotfiles.

- Very useful scripts are in `~/.local/bin/`
- Settings for:
	- vim (text editor)
	- zsh (shell)
	- lf (file manager)
	- mpd/ncmpcpp (music)
	- sxiv (image/gif viewer)
	- mpv (video player)
	- other stuff like xdg default programs, inputrc and more, etc.
- I try to minimize what's directly in `~` so:
	- All configs that can be in `~/.config/` are.
	- Some environmental variables have been set in `~/.zshenv` to move configs into `~/.config/`

## Usage

These dotfiles are intended to go with numerous suckless programs I use:

- [dwm](https://github.com/worthyox/dwm) (window manager)
- [dwmblocks](https://github.com/worthyox/dwmblocks) (statusbar)
- [st](https://github.com/worthyox/st) (terminal emulator)

## Install these dotfiles and all dependencies

Use Makefile to deploy everything:

```
make init
```

