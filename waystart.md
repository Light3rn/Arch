## Arch colors
Text color: #1793D1
Background: #2A2A2A

## Fix hard drives
sudo mount /dev/sdb1 ~/SSD
# Mount drives under /mnt and add to fstab (/etc/fstab)
# <device>	<dir>		<type>    <options>             <dump> <fsck>
/dev/sdb1	/mnt/SSD	ext4      defaults,noatime      0      2
/dev/sdc1	/mnt/HDD	ext4      defaults,noatime      0      2

## Install Elm:
```
gpg --recv-keys C52048C0C0748FEE227D47A2702353E0F7E48EDB
trizen -S elm-platform
```

## Install this if pgadmin4 doesn't work:
https://extensions.gnome.org/extension/1031/topicons/

## Install
sudo npm install -g create-react-app

## Install radeon-gui
trizen -S radeon-profile-git radeon-profile-daemon-git
# Add to /etc/sudoers:
username ALL = NOPASSWD: /usr/bin/radeon-profile

## Install trizen
mkdir builds 
cd builds
git clone https://aur.archlinux.org/trizen.git
cd trizen
makepkg -cis

## Install corsair drivers:
pacaur -S ckb-next-git
sudo systemctl start ckb-next-daemon
sudo systemctl enable ckb-next-daemon


## Install rust
sudo pacman -S rustup
rustup install stable
rustup default stable-x86_64-unknown-linux-gnu

## Install some rust compability
# don't remember if needed anymore
rustup component add rust-src
# for text editor support
sudo pacman -S rust-racer
#add rust source code to make Racer autocompletion work?
# gedit plugin
# https://github.com/isamert/gracer
mkdir -p ~/.local/share/gedit/plugins
cd ~/.local/share/gedit/plugins
git clone https://github.com/isamert/gracer.git
Open gedit, go to Preferences > Plugins > Gracer to activate it.
From plugins menu, open Gracer's Preferences.
Set Racer path and Rust source path.
# Restart gedit.
# update:
cd ~/.local/share/gedit/plugins/gracer
git pull

## Install visual studio code
trizen -S code

## Install Monero
trizen -S monero

## Install virtual box
#install, choose 2
sudo pacman -S virtualbox
#start manually here or reboot
sudo modprobe -a vboxdrv
#add modules for loading on startup
echo 'vboxdrv' | sudo tee --append /etc/modules-load.d/virtualbox.conf
#add user to vboxusers -group
sudo gpasswd -a $USER vboxusers
# Inside guest for shared folders:
Spice guest tools:
https://www.spice-space.org/download.html
Shared folders:
https://www.spice-space.org/download/windows/spice-webdavd/
# Remember to add rust source code if needed rust

## Install mellowplayer
pacaur -S mellowplayer
sudo pacman -S pepper-flash

## Install file sharing
ReadyMedia (minidlna)
/etc/minidlna.conf
systemctl enable minidlna.service
systemctl start minidlna.service
killall minidlnad
# In case needed
rebuild:
minidlnad -R

## To install crossover (wine ++), please check your harddrive
# enable -> /etc/pacman.conf 
[multilib]
Include = /etc/pacman.d/mirrorlist
trizen -S crossover


####### Gnome specific
#Change languages and local formats
#Code example: gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fi')]"
#Code example: gsettings set org.gnome.desktop.background picture-uri "'file:///home/antti/Pictures/archbackground.jpg'"
#Tweak windows: turn on minimize, maximize
#Tweak extensions user themes on, Launch new instance

pacaur -S chrome-gnome-shell-git
https://extensions.gnome.org/extension/358/activities-configurator/
asenna myös plugari
## vanhentunut: pacaur -S gnome-shell-extension-activities-config
# Activities configurat on -> Hide text, Disable Hot corner, Panel transparency 70
pacaur -S gnome-shell-extension-dash-to-dock
# Dash to dock on -> Shrink dash, show counter indications, customize opacity 40%


####### Garbage bin
sudo pacman -S lib32-nvidia-utils ttf-liberation steam lib32-primus primus libvdpau
#also run this:
primusrun %command%
removed primus lib32-primus lib32-nvidia-utils steam
installed nvidia and removed all nvidia
