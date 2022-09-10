# The Archrice (Steve's dotfiles)

<!-- Header & Preview Image -->
<p align="center">
    <img width="600" alt="My Desktop" src="https://github.com/hghann/archrice/blob/master/screenshots/desktop.png">
</p>

<!-- Shields -->
<p align="center">
  <a href="https://github.com/hghann/archrice/blob/master/LICENSE" alt="License">
      <img src="https://img.shields.io/github/license/hghann/archrice" /></a>
  <a href="https://img.shields.io/github/languages/count/hghann/archrice"  alt="Activity">
      <img src="https://img.shields.io/github/languages/count/hghann/archrice" /></a>
  <a href="https://img.shields.io/github/languages/code-size/hghann/archrice"  alt="Code size">
      <img src="https://img.shields.io/github/languages/code-size/hghann/archrice" /></a>
  <a href="https://github.com/hghann/archrice/pulse" alt="Activity">
      <img src="https://img.shields.io/github/commit-activity/m/hghann/archrice" /></a>
</p>

## Table of Contents

- [About this repo](#about-this-repo)
- [Highlights](#highlights)
- [Packages Overview](#packages-overview)
- [Install these dotfiles](#install-these-dotfiles-and-all-dependencies)
- [The make Command](#the-make-command)
- [Additional Resources](#additional-resources)
- [License](#license)

## About this repo

This repository contains my personal dotfiles. They are stored here for
convenience so that I may quickly access them on new machines or new installs.
Also, others may find some of my configurations helpful in customizing their
own dotfiles.

- Very useful scripts are in `~/.local/bin/`
- Settings for:
	- vim (text editor)
	- zsh (shell)
	- lf (file manager)
	- zathura (pdf viewer)
	- mpd/ncmpcpp (music)
	- sxiv (image/gif viewer)
	- mpv (video player)
	- newsboat (rss reader)
	- other stuff like xdg default programs, inputrc and more, etc.
- I try to minimize what's directly in `~` so:
	- All configs that can be in `~/.config/` are.
	- Some environmental variables have been set in `~/.zshenv` to move configs into `~/.config/`

## Highlights

- Minimal efforts to install everything, using a [Makefile](./Makefile)
- Fast and colored prompt
- Well-organized and easy to customize


## Packages Overview

These dotfiles are intended to go with numerous suckless programs I use:

- [dwm](https://github.com/hghann/dwm) (window manager)
- [dwmblocks](https://github.com/hghann/dwmblocks) (statusbar)
- [st](https://github.com/hghann/st) (terminal emulator)

## Install these dotfiles and all dependencies

This repo is managed by a makefile. Run `make` with no arguments to list
all commands that could be executed.

Use Makefile to deploy everything:

```
make init
```

On a sparkling fresh installation of Arch linux:

```bash
sudo pacman -Syu git make curl
```

Ths command installs `git`, `make`, and `curl` (not available on stock
arch linux). Now there are two options:

1. Install this repo with `curl` available:

```bash
bash -c "`curl -fsSL https://raw.githubusercontent.com/hghann/dotfiles/master/remote-install.sh`"
```

This will clone or download, this repo to `~/.dotfiles` depending on the
availability of `git`, `curl` or `wget`.

2. Alternatively, clone manually into the desired location:

```bash
git clone https://github.com/hghann/archrice.git ~/.dotfiles
```

Use the [Makefile](./Makefile) to install everything
[listed above](#package-overview), and [config](./.config) (using
[make](https://www.gnu.org/software/make/)):

```bash
cd ~/.dotfiles
make init
```

The installation process in the Makefile is tested on every push and every week
in this [GitHub Action](https://github.com/hghann/archrice/actions).

## The `make` command

```bash
$ make help
Usage: make <command>

Commands:
    alacritty         Deploy Alacritty configs
    backup            Backup macOS packages using brew
    base              Install base system
    doas              Configure doas
    dock              Apply macOS dock settings
    duti              Setup default applications
    grap              Install grap - a groff preprocessor for drawing graphs
    help              Prints out Make help
    init              Inital deploy dotfiles on osx machine
    install           Install arch linux packages using pacman
    jot               Install jot - a markdown style preprocessor for groff
    lf                Deploy lf configs
    macos             Apply macOS system defaults
    mpd               Deploy mpd configs
    mpv               Deploy mpv configs
    ncmpcpp           Deploy ncmpcpp configs
    pip               Install python packages
    pipbackup         Backup python packages
    pipupdate         Update python packages
    pkg_base          Install base packages plus doas because sudo is bloat
    prog_base         Install base programs
    ssh-key_gen       Generate an SSH key
    sync              Push changes to git repo
    testinit          Test initial deploy dotfiles
    testpath          echo $PATH
    update            Update macOS packages and save packages cache
    vim               Init vim
    vimpull           Updates local vim config
    vimpush           Updates vim repo
    walk              Installs plan9 find SUDO NEEDED
    wm                Deploy window manager configs
```

## Additional Resources

- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
- [Homebrew](https://brew.sh)
- [Homebrew Cask](https://github.com/Homebrew/homebrew-cask)
- [Bash prompt](https://wiki.archlinux.org/index.php/Color_Bash_Prompt)
- [Lars Kappert's Dotfiles](https://github.com/webpro/dotfiles)
- [Luke Smith's Dotfiles](https://github.com/LukeSmithxyz/voidrice)

## License

The files and scripts in this repository are licensed under the MIT License,
which is a very permissive license allowing you to use, modify, copy,
distribute, sell, give away, etc. the software. In other words, do what you
want with it. The only requirement with the MIT License is that the license and
copyright notice must be provided with the software.
