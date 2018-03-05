#!/bin/bash
# This will install all of the needed software for Arch Linux Arm for the raspberry pi 2 in order to have a semi functional desktop.
# You must install and configure sudo first. Run with "./archPiSetup.sh", it will ask for a root password when needed
# Author: Emil Zahariev

sudo pacman -Syu --needed screen vim nfs-utils htop openssh autofs alsa-utils alsa-firmware alsa-lib alsa-plugins git zsh wget curl base-devel diffutils libnewt dialog wpa_supplicant wireless_tools iw crda lshw xorg xorg-server xorg-apps lightdm xorg-xinit lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4 xfce4-goodies xfce4-appfinder xfce4-mailwatch-plugin xfce4-smartbookmark-plugin xfce4-artwork xfce4-mount-plugin xfce4-systemload-plugin xfce4-battery-plugin xfce4-mpc-plugin xfce4-taskmanager xfce4-clipman-plugin xfce4-netload-plugin xfce4-terminal xfce4-cpufreq-plugin xfce4-notes-plugin xfce4-time-out-plugin xfce4-cpugraph-plugin xfce4-notifyd xfce4-timer-plugin xfce4-datetime-plugin xfce4-panel xfce4-verve-plugin xfce4-dev-tools xfce4-power-manager xfce4-wavelan-plugin xfce4-dict xfce4-pulseaudio-plugin xfce4-weather-plugin xfce4-diskperf-plugin xfce4-screenshooter xfce4-whiskermenu-plugin xfce4-eyes-plugin xfce4-sensors-plugin xfce4-xkb-plugin xfce4-fsguard-plugin xfce4-session xfce4-genmon-plugin xfce4-settings htop base-devel wpa_supplicant dialog networkmanager network-manager-applet nm-connection-editor alsa-lib alsa-plugins alsa-tools alsa-utils alsaplayer alsa-lib alsa-firmware pulseaudio pulseaudio-bluetooth pulseaudio-gconf pulseaudio-lirc pulseview pulseaudio-alsa pulseaudio-equalizer pulseaudio-jack pulseaudio-zeroconf phonon-qt4 qt-assistant-compat xf86-video-fbdev xf86-video-vesa btrfs-progs e2fsprogs dosfstools jfsutils mdadm util-linux cryptsetup lvm2 nilfs-utils ntfs-3g reiserfsprogs udftools xfsprogs mtools

sudo pacman -Syu --needed

echo -e '#!/bin/bash\nexec startxfce4' > .xinitrc
echo -e '#!/bin/bash\nexec /usr/bin/Xorg -nolisten tcp "$@" vt$XDG_VTNR' > .xserverrc

wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz

tar -xzf package-query.tar.gz
cd package-query
makepkg -si
tar -xzf yaourt.tar.gz
cd "$HOME"/yaourt
makepkg -si
