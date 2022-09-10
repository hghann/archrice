# inspired by this video
# https://www.youtube.com/watch?v=aP8eggU2CaU

BASE = $(PWD)
SCRIPTS = $(HOME)/.scripts
MKDIR = mkdir -p
LN = ln -vsf
LNDIR = ln -vs
SUDO = doas
PKGINSTALL = $(SUDO) pacman -Sy --noconfirm

installtermux:
	pkg install tmux gawk make man zsh info vim neovim clang python fzf

termux: $(HOME)/.scripts
	$(MKDIR) $(HOME)/bin
	$(MKDIR) $(HOME)/.shortcuts/tasks
	$(MKDIR) $(HOME)/.config
	$(LN) $(PWD)/termuxconf/.termux/termux.properties $(HOME)/termuxconf/.termux/termux.properties
	$(LN) $(PWD)/termuxconf/.shortcuts/fzbm.sh $(HOME)/termuxconf/.shortcuts/fzbm.sh
	$(LN) $(SCRIPTS)/dmenu/tutorialvids $(HOME)/dmenu/tutorialvids
	$(LN) $(PWD)/termuxconf/bin/termux-file-editor $(HOME)/termuxconf/bin/termux-file-editor
	$(LN) $(PWD)/.config/termuxlocalprofile $(HOME)/.config/termuxlocalprofile
	$(LN) $(PWD)/.config/termuxvimlocal $(HOME)/.config/termuxvimlocal

doas: ## Configure doas
	$(SUDO) echo "permit persist keepenv $(whoami) as root" >> /etc/doas.conf

sudo: # stop asking for password when using sudo
	$(SUDO) echo "## Prevents entering password in new windows\nDefaults \!tty_tickets" >> /etc/sudoers

autologin: # setup auto login
	$(SUDO) $(MKDIR) /etc/systemd/system/getty@tty1.service.d/
	$(SUDO) $(LN) $(PWD)/etc/systemd/system/getty@tty1.service.d/override.conf /etc/systemd/system/getty@tty1.service.d/override.conf

suspend:
	$(SUDO) $(LN) $(PWD)/etc/systemd/logind.conf /etc/systemd/logind.conf

nobeep: # remove system beeping
	rmmod pcspkr
	echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
	xset -b

tlp: ## Setting for power saving and preventing battery deterioration
	$(SUDO) pacman -S tlp powertop
	$(SUDO) $(LN) $(PWD)/etc/default/tlp /etc/default/tlp
	$(SUDO) systemctl enable tlp.service
	$(SUDO) systemctl enable tlp-spleep.service

powersave: ## Powersave settings
	$(SUDO) $(MKDIR) /etc/udev/rules.d
	$(SUDO) $(LN) $(PWD)/etc/udev/rules.d/81-powersave.rules /etc/udev/rules.d/81-powersave.rules
	$(SUDO) $(LN) $(PWD)/etc/udev/rules.d/powersave.rules /etc/udev/rules.d/powersave.rules
	$(SUDO) $(MKDIR) /etc/modprobe.d
	$(SUDO) $(LN) $(PWD)/etc/modprobe.d/iwlwifi.conf /etc/modprobe.d/iwlwifi.conf

pacmancolors:
	# Make pacman and yay colorful and adds eye candy on the progress bar because why not
	$(SUDO) sed -i "s/^#Color/Color/" /etc/pacman.conf
	$(SUDO) sed -i "/#VerbosePkgList/a ILoveCandy" /etc/pacman.conf

networkmanager:
	$(SUDO) systemctl enable NetworkManager.service
	$(SUDO) systemctl start NetworkManager.service
	$(SUDO) $(MKDIR) /etc/NetworkManager

bluetooth:
	$(PKGINSTALL) bluez-utils pulseaudio-bluetooth pulseaudio-alsa blueman
	$(SUDO) $(LN) $(PWD)/etc/systemd/logind.conf /etc/systemd/logind.conf
	$(SUDO) systemctl start bluetooth.service
	$(SUDO) systemctl enable bluetooth.service

systemd: networkmanager # Setup systemd services
	$(SUDO) $(MKDIR) /etc/systemd/system

syncthing: systemd
	$(SUDO) $(MKDIR) /etc/NetworkManager/dispatcher.d
	$(SUDO) $(LN) $(PWD)/etc/NetworkManager/dispatcher.d/10-syncthingstart.sh /etc/NetworkManager/dispatcher.d/10-syncthingstart.sh

screenkey: ## Init screenkey
	# needs yay -S screenkey
	$(MKDIR) $(HOME)/.config
	$(LN) $(PWD)/.config/screenkey.json $(HOME)/.config/screenkey.json

scripts:
	make -s $(HOME)/.scripts

$(HOME)/.scripts:
	@test -d $(SCRIPTS) || git clone https://github.com/worthyox/scripts $(SCRIPTS)

updatescripts:
	cd $(HOME)/.scripts:\
		git pull

pass:
	git clone https://github.com/worthyox/pass $(HOME)/.password-store

vim: ## Init vim
	# requires vim
	git clone https://github.com/worthyox/dotvim $(HOME)/.vim
	cd $(HOME)/.vim && make -f $(HOME)/.vim/Makefile

vimupdate: ## Updates vim config
	cd $(HOME)/.vim;\
		git pull

installsuckless: ## Install and setup suckless programs
	$(MKDIR) $(HOME)/.suckless
	git clone https://github.com/worthyox/dwm $(HOME)/.suckless
	git clone https://github.com/worthyox/st $(HOME)/.suckless
	git clone https://github.com/worthyox/dmenu $(HOME)/.suckless
	cd $(HOME)/.suckless/dwm && make -f $(HOME)/.suckless/dwm/Makefile
	cd $(HOME)/.suckless/st && make -f $(HOME)/.suckless/st/Makefile
	cd $(HOME)/.suckless/dmenu && make -f $(HOME)/.suckless/dmenu/Makefile

sucklessupdate: ## Updates suckless programs
	cd $(HOME)/.suckless/dwm;\
		git pull;\
			 make -f $(HOME)/.suckless/dwm/Makefile
	cd $(HOME)/.suckless/st;\
		git pull;\
			 make -f $(HOME)/.suckless/st/Makefile
	cd $(HOME)/.suckless/dmenu;\
		git pull;\
			 make -f $(HOME)/.suckless/dmenu/Makefile

testinit: ## Test initial deploy dotfiles
	rm -rf $(HOME)/.config/alacritty
	$(LNDIR) $(PWD)/.config/alacritty $(HOME)/.config/alacritty
	#rm -rf $(HOME)/.config/$@
	#$(LNDIR) $(PWD)/.config/$@ $(HOME)/.config/$@
	#$(PACMAN) $@
	#test -L $(HOME)/.config/$@/$@.mxl || rm -rf $(HOME)/.config/$@/$@.mxl
	#ln -vsf {$(PWD),$(HOME)}/.config/$@/$@.mxl

init: ## Inital deploy dotfiles
	$(LN) $(PWD)/.bash_profile $(HOME)/.bash_profile
	$(LN) $(PWD)/.bashrc $(HOME)/.bashrc
	$(LN) $(PWD)/.profile $(HOME)/.profile
	rm -rf $(HOME)/.config/zsh
	$(LNDIR) $(PWD)/.config/zsh $(HOME)/.config/zsh
	rm -rf $(HOME)/.config/nvim
	$(LNDIR) $(PWD)/.config/nvim $(HOME)/.config/nvim
	rm -rf $(HOME)/.config/xfce4
	$(LNDIR) $(PWD)/.config/xfce4 $(HOME)/.config/xfce4
	rm -rf $(HOME)/.config/picom
	$(LNDIR) $(PWD)/.config/picom $(HOME)/.config/picom
	rm -rf $(HOME)/.config/alacritty
	$(LNDIR) $(PWD)/.config/alacritty $(HOME)/.config/alacritty
	rm -rf $(HOME)/.config/dunst
	$(LNDIR) $(PWD)/.config/dunst $(HOME)/.config/dunst
	rm -rf $(HOME)/.config/fontconfig
	$(LNDIR) $(PWD)/.config/fontconfig $(HOME)/.config/fontconfig
	rm -rf $(HOME)/.config/lf
	$(LNDIR) $(PWD)/.config/lf $(HOME)/.config/lf
	rm -rf $(HOME)/.config/mpd
	$(LNDIR) $(PWD)/.config/mpd $(HOME)/.config/mpd
	rm -rf $(HOME)/.config/mpv
	$(LNDIR) $(PWD)/.config/mpv $(HOME)/.config/mpv
	rm -rf $(HOME)/.config/ncmpcpp
	$(LNDIR) $(PWD)/.config/ncmpcpp $(HOME)/.config/ncmpcpp
	rm -rf $(HOME)/.config/newsboat
	$(LNDIR) $(PWD)/.config/newsboat $(HOME)/.config/newsboat
	rm -rf $(HOME)/.config/openbox
	$(LNDIR) $(PWD)/.config/openbox $(HOME)/.config/openbox
	rm -rf $(HOME)/.config/qutebrowser
	$(LNDIR) $(PWD)/.config/qutebrowser $(HOME)/.config/qutebrowser
	rm -rf $(HOME)/.config/btop
	$(LNDIR) $(PWD)/.config/btop $(HOME)/.config/btop
	rm -rf $(HOME)/.config/startpage
	$(LNDIR) $(PWD)/.config/startpage $(HOME)/.config/startpage
	rm -rf $(HOME)/.config/sxiv
	$(LNDIR) $(PWD)/.config/sxiv $(HOME)/.config/sxiv
	rm -rf $(HOME)/.config/tint2
	$(LNDIR) $(PWD)/.config/tint2 $(HOME)/.config/tint2
	rm -rf $(HOME)/.config/wget
	$(LNDIR) $(PWD)/.config/wget $(HOME)/.config/wget
	rm -rf $(HOME)/.config/X11
	$(LNDIR) $(PWD)/.config/X11 $(HOME)/.config/X11
	rm -rf $(HOME)/.config/calcurse
	$(LNDIR) $(PWD)/.config/calcurse $(HOME)/.config/calcurse
	rm -rf $(HOME)/.config/flameshot
	$(LNDIR) $(PWD)/.config/flameshot $(HOME)/.config/flameshot
	rm -rf $(HOME)/.config/gtk-2.0
	$(LNDIR) $(PWD)/.config/gtk-2.0 $(HOME)/.config/gtk-2.0
	rm -rf $(HOME)/.config/gtk-3.0
	$(LNDIR) $(PWD)/.config/gtk-3.0 $(HOME)/.config/gtk-3.0
	rm -rf $(HOME)/.config/Mousepad
	$(LNDIR) $(PWD)/.config/Mousepad $(HOME)/.config/Mousepad
	rm -rf $(HOME)/.config/neofetch
	$(LNDIR) $(PWD)/.config/neofetch $(HOME)/.config/neofetch
	rm -rf $(HOME)/.config/nitrogen
	$(LNDIR) $(PWD)/.config/nitrogen $(HOME)/.config/nitrogen
	rm -rf $(HOME)/.config/pcmanfm
	$(LNDIR) $(PWD)/.config/pcmanfm $(HOME)/.config/pcmanfm
	rm -rf $(HOME)/.config/qt5ct
	$(LNDIR) $(PWD)/.config/qt5ct $(HOME)/.config/qt5ct
	rm -rf $(HOME)/.config/xarchiver
	$(LNDIR) $(PWD)/.config/xarchiver $(HOME)/.config/xarchiver
	rm -rf $(HOME)/.config/zathura
	$(LNDIR) $(PWD)/.config/zathura $(HOME)/.config/zathura
	$(LN) $(PWD)/.config/mimeapps.list $(HOME)/.config/mimeapps.list
	$(LN) $(PWD)/.config/starship.toml $(HOME)/.config/starship.toml
	$(LN) $(PWD)/.config/user-dirs.dirs $(HOME)/.config/user-dirs.dirs
	rm -rf $(HOME)/.local/bin
	$(LNDIR) $(PWD)/.local/bin $(HOME)/.local/bin
	rm -rf $(HOME)/.local/share/applications
	$(LNDIR) $(PWD)/.local/share/applications $(HOME)/.local/share/applications
	rm -rf $(HOME)/.local/share/getkeys
	$(LNDIR) $(PWD)/.local/share/getkeys $(HOME)/.local/share/getkeys
	rm -rf $(HOME)/.local/share/xfce4
	$(LNDIR) $(PWD)/.local/share/xfce4 $(HOME)/.local/share/xfce4
	$(LN) $(PWD)/.local/share/emoji $(HOME)/.local/share/emoji

X: ## Setup files for xorg
	$(MKDIR) $(HOME)/.config/X11
	$(LN) $(PWD)/.config/X11/xinitrc $(HOME)/.config/X11/xinitrc
	$(LN) $(PWD)/.config/X11/xprofile $(HOME)/.config/X11/xprofile
	$(LN) $(PWD)/.config/X11/xresources $(HOME)/.config/X11/xresources
	$(LN) $(PWD)/.config/X11/xserverrc $(HOME)/.config/X11/xserverrc
	$(MKDIR) $(HOME)/.config/picom
	$(LN) $(PWD)/.config/picom/picom.conf $(HOME)/.config/picom/picom.conf
	$(MKDIR) $(HOME)/.config/fontconfig
	$(LN) $(PWD)/.config/fontconfig/fonts.conf $(HOME)/.config/fontconfig/fonts.conf
	$(MKDIR) $(HOME)/.config/dunst
	$(LN) $(PWD)/.config/dunst/critical.png $(HOME)/.config/dunst/critical.png
	$(LN) $(PWD)/.config/dunst/dunstrc $(HOME)/.config/dunst/dunstrc
	$(LN) $(PWD)/.config/dunst/normal.png $(HOME)/.config/dunst/normal.png
	$(MKDIR) $(HOME)/.config/zathura
	$(LN) $(PWD)/.config/zathura/zathurarc $(HOME)/.config/zathura/zathurarc
	$(MKDIR) $(HOME)/.config/qutebrowser/bookmarks
	$(LN) $(PWD)/.config/qutebrowser/config.py $(HOME)/.config/qutebrowser/config.py
	$(LN) $(PWD)/.config/bookmarks $(HOME)/.config/qutebrowser/bookmarks/urls
	$(MKDIR) $(HOME)/.config/sxiv/exec
	$(LN) $(PWD)/.config/sxiv/exec/key-handler $(HOME)/.config/sxiv/exec/key-handler
	$(LN) $(PWD)/.config/mimeapps.list $(HOME)/.config/mimeapps.list
	$(LN) $(PWD)/.config/starship.toml $(HOME)/.config/starship.toml
	$(LN) $(PWD)/.config/user-dirs.dirs $(HOME)/.config/user-dirs.dirs

alacritty: ## Setup files for alacritty
	$(MKDIR) $(HOME)/.config/alacritty
	$(LN) $(PWD)/.config/alacritty/alacritty.yml $(HOME)/.config/alacritty/alacritty.yml

lf: ## Setup files for lf
	$(MKDIR) $(HOME)/.config/lf
	$(LN) $(PWD)/.config/lf/cleaner $(HOME)/.config/lf/cleaner
	$(LN) $(PWD)/.config/lf/lfrc $(HOME)/.config/lf/lfrc
	$(LN) $(PWD)/.config/lf/preview $(HOME)/.config/lf/preview

mpv: ## Setup files for mpv
	$(MKDIR) $(HOME)/.config/mpv
	$(LN) $(PWD)/.config/mpv/input.conf $(HOME)/.config/mpv/input.conf
	$(LN) $(PWD)/.config/mpv/mpv.conf $(HOME)/.config/mpv/mpv.conf

mpd: ## Setup files for mpd
	$(MKDIR) $(HOME)/.config/mpd/mpd.conf
	$(LN) $(PWD)/.config/mpd/mpd.conf $(HOME)/.config/mpd/mpd.conf

ncmpcpp: ## Setup files for ncmpcpp
	$(MKDIR) $(HOME)/.config/ncmpcpp
	$(LN) $(PWD)/.config/ncmpcpp/bindings $(HOME)/.config/ncmpcpp/bindings
	$(LN) $(PWD)/.config/ncmpcpp/config $(HOME)/.config/ncmpcpp/config

openbox: ## Setup files for openbox
	$(MKDIR) $(HOME)/.config/openbox
	$(LN) $(PWD)/.config/openbox/autostart $(HOME)/.config/openbox/autostart
	$(LN) $(PWD)/.config/openbox/menu.xml $(HOME)/.config/openbox/menu.xml
	$(LN) $(PWD)/.config/openbox/rc.xml $(HOME)/.config/openbox/rc.xml

tint2: ## Setup files for tint2
	$(MKDIR) $(HOME)/.config/tint2
	$(LN) $(PWD)/.config/tint2/tint2rc $(HOME)/.config/tint2/tint2rc

PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man
TMPDIR = $(PWD)/tmp

walk: ## installs plan9 find SUDO NEEDED
	$(MKDIR) $(TMPDIR)
	git clone https://github.com/google/walk.git $(TMPDIR)/walk
	cd $(TMPDIR)/walk && make
	$(MKDIR) $(DESTDIR)$(PREFIX)/bin
	# installing walk
	cp -f     $(TMPDIR)/walk/walk   $(DESTDIR)$PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/walk
	cp -f     $(TMPDIR)/walk/walk.1 $(DESTDIR)$(MANPREFIX)/man1/walk.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/walk.1
	# installing sor
	cp -f     $(TMPDIR)/walk/sor   $(DESTDIR)$PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/sor
	cp -f     $(TMPDIR)/walk/sor.1 $(DESTDIR)$(MANPREFIX)/man1/sor.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/sor.1

jot: ## install jot a markdown style  preprocessor for note-taking in groff
	$(MKDIR) $(TMPDIR)
	git clone https://gitlab.com/rvs314/jot.git $(TMPDIR)/$<
	rm -rf $(TMPDIR)

# grap can be found here: https://www.lunabase.org/-faber/Vault/software/grap/

base: ## Install base and base-devel package plus doas because sudo is bloated
	$(PKGINSTALL) filesystem gcc-libs glibc bash coreutils file findutils gawk \
		grep procps-ng sed tar gettext pciutils psmisc shadow util-linux bzip2 gzip \
		xz licenses pacman systemd systemd-sysvcompat iputils iproute2 autoconf sudo \
		automake binutils bison fakeroot flex gcc groff libtool m4 make patch pkgconf \
		texinfo which opendoas

docker: ## Docker initial setup
	$(SUDO) pacman -S docker
	$(SUDO) usermod -aG docker $(USER)
	$(MKDIR) $(HOME)/.docker
	$(LN) $(PWD)/.docker/config.json $(HOME)/.docker/config.json
	$(SUDO) systemctl enable docker.service
	$(SUDO) systemctl start docker.service

install: ## Install arch linux packages using pacman
	$(PKGINSTALL) --needed - < $(PWD)/pkg/pacmanlist
	#$(PKG) pkgfile --update
	$(SUDO) pacman -Fy

aur: ## Install arch linux AUR packages using yay
	yay -S --needed - < $(PWD)/pkg/aurlist

####yay: ## Install yay using yay
####	$(PKGINSTALL) yay

yay: paru ## Setup yay (AUR Helper)
	# sudo pacman -S --needed base-devel
	$(MKDIR) $(TMPDIR)
	git clone https://aur.archlinux.org/yay.git $(TMPDIR)/yay
	cd $(TMPDIR)/yay && makepkg -si

paru: yay ## Setup paru (AUR Helper) or simply install using yay
	# sudo pacman -S --needed base-devel
	$(MKDIR) $(TMPDIR)
	git clone https://aur.archlinux.org/paru.git $(TMPDIR)/paru
	cd $(TMPDIR)/paru && makepkg -si

desktop: ## Update desktop entry
	$(SUDO) $(LN) $(PWD)/usr/share/applications/vim.desktop /usr/share/applications/vim.desktop

backup: ## Backup arch linux packages
	$(MKDIR) $(PWD)/pkg
	#pacman -Qnq > ${PWD}/pkg/pacmanlist
	pacman -Qeq > $(PWD)/pkg/pacmanlist
	pacman -Qqem > $(PWD)/pkg/aurlist

update: ## Update arch linux packages and save packages cache 3 generations
	yay -Syu

pip: ## Install python packages
	pip install --user --upgrade pip
	pip install --user 'python-language-server[all]'

pipbackup: ## Backup python packages
	$(MKDIR) $(PWD)/pkg
	pip freeze > $(PWD)/pkg/piplist.txt

pipupdate: ## Update python packages
	pip list --user | cut -d" " -f 1 | tail -n +3 | xargs pip install -U --user

testpath: ## ECHO PATH
	PATH=$$PATH
	@echo $$PATH
	echo $(PWD)
	PWD=$(PWD)
	echo $(HOME)
	HOME=$(HOME)

archinstall: base install vim installsuckless paru yay tlp init networkmanager pacmancolors doas sudo suspend aur scripts X

allinstall: install init paru yay tlp aur

allupdate: update vimupdate scriptsupdate sucklessupdate

allbackup: backup

.DEFAULT_GOAL := help
.PHONY: allinstall allupdate allbackup

help: ## Prints out Make help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
