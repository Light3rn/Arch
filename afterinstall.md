### Cleanup
#### Remove orphans
```
pacman -Rns $(pacman -Qtdq)
```
#### Sizes of packages not in base or base-devel group
```
expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqen | sort) <(pacman -Qqg base base-devel | sort)) | sort -n
```
#### Sizes of all packages
```
pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
```

### Customizations

Text color: #1793D1
Background: #2A2A2A

### Dash to dock:
```
aurman -S gnome-shell-extension-dash-to-dock
```
### Install yay or aurman
```
mkdir builds 
cd builds

git clone https://aur.archlinux.org/yay-bin.git
or
cd yay-bin
makepkg -cis

git clone https://aur.archlinux.org/aurman.git
cd aurman
gpg --recv-keys 465022E743D71E39
makepkg -cis
```
### Wallpapers:
http://oswallpapers.com/
### Theming:
```
aurman -S gnome-osc-hs-gtk-theme
aurman -S macos-icon-theme
aurman -S capitaine-cursors
```
Tweaks->Appearance->Themes->Applications+Cursor+Icons

### Western digital green:
Please notice that time is x5s (12=60s):
```
sudo pacman -S idle3-tools
sudo idle3ctl -s 12 /dev/sdX
```


### Fonts
```
aurman -S otf-san-francisco adobe-source-code-pro-fonts
```
Tweaks-Fonts
* Window title Cantarelli Bold 11 -> SF Pro Display Bold
* Interface Cantarell Regular 11 -> SF Pro Display Regular
* Document Sans Regular 11 -> SF Pro Text Regular
* Monospace Monospace Regular -> Source COde Pro Regular

For terminal:
```
system-san-francisco-font-git
```

### Install powerpill
```
aurman -S powerpill
```
Also edit /etc/pacman.conf libs look like this or you'll get errors with powerpill:
```
[core]
SigLevel = PackageRequired
Include = /etc/pacman.d/mirrorlist
```
### Create update script and automate it
Generate "update" -file to your homefolder
```
#!/bin/bash
#reflector --verbose --country Austria --country Belarus --country Belgium --country "Bosnia and Herzegovina" --country Bulgaria --country Croatia --country Czechia --country Denmark --country Finland --country France --country Germany --country Greece --country Hungary --country Iceland --country Ireland --country Israel --country Italy --country Latvia --country Lithuania --country Luxembourg --country Netherlands --country Norway --country Poland --country Portugal --country Romania --country Serbia --country Slovakia --country Slovenia --country Spain --country Sweden --country Switzerland --country Ukraine --country "United Kingdom" --latest 25 --sort rate --save /etc/pacman.d/mirrorlist
curl -o /etc/pacman.d/mirrorlist 'https://www.archlinux.org/mirrorlist/?country=AT&country=BY&country=BE&country=BA&country=BG&country=HR&country=CZ&country=DK&country=FI&country=FR&country=DE&country=GR&country=HU&country=IS&country=IE&country=IL&country=IT&country=LV&country=LT&country=LU&country=NL&country=NO&country=PL&country=PT&country=RO&country=RS&country=SK&country=SI&country=ES&country=SE&country=CH&country=UA&country=GB&protocol=http&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on'
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist
powerpill -Syu
```
Then just run this command from your update button
```
gnome-terminal -- sudo ~/update
```
### Install corsair drivers:
```
aurman -S ckb-next
sudo systemctl start ckb-next-daemon
sudo systemctl enable ckb-next-daemon
```
### Install visual studio code
```
aurman -S code
```
### Install virtual box
Install, **choose 2**
```
sudo pacman -S virtualbox
```
Start manually here or reboot
```
sudo modprobe -a vboxdrv
```
add modules for loading on startup
```
echo 'vboxdrv' | sudo tee --append /etc/modules-load.d/virtualbox.conf
```
add user to vboxusers -group
```
sudo gpasswd -a $USER vboxusers
```
Install extension pack for usb2 support:
```
aurman -S virtualbox-ext-oracle
```
#### Inside guest for shared folders:
Spice guest tools:
https://www.spice-space.org/download.html
Shared folders:
https://www.spice-space.org/download/windows/spice-webdavd/
### Fix hard drives
```
sudo mount /dev/sdb1 ~/SSD
```

### Mount drives under /mnt and add to fstab (/etc/fstab)
```
 <device>	<dir>		<type>    <options>             <dump> <fsck>
/dev/sdb1	/mnt/SSD	ext4      defaults,noatime      0      2
/dev/sdc1	/mnt/HDD	ext4      defaults,noatime      0      2
```

### Install Elm:
https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
###### 1. Create a directory for global packages
```sh
mkdir "${HOME}/.npm-packages"
```
###### 2. Indicate to `npm` where to store globally installed packages. In your `~/.npmrc` file add:
```sh
prefix=${HOME}/.npm-packages
```
###### 3. Ensure `npm` will find installed binaries and man pages. Add the following to your `.bashrc`/`.zshrc`:

```sh
NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
```
Then just
```
npm install -g elm
```
You may start with (needs relogin):
```
elm-package install
```

### Install this if pgadmin4 doesn't work:

https://extensions.gnome.org/extension/1031/topicons/


### Install rust
```
sudo pacman -S rustup
rustup install stable
rustup default stable-x86_64-unknown-linux-gnu
```

### Install some rust compability
#### Don't remember if needed anymore
```
rustup component add rust-src
```
#### For text editor support
```
sudo pacman -S rust-racer
```
add rust source code to make Racer autocompletion work?
```
gedit plugin
```
https://github.com/isamert/gracer
```
mkdir -p ~/.local/share/gedit/plugins
cd ~/.local/share/gedit/plugins
git clone https://github.com/isamert/gracer.git
```
Open gedit, go to Preferences > Plugins > Gracer to activate it.
From plugins menu, open Gracer's Preferences.
Set Racer path and Rust source path.
Restart gedit.
update:
```
cd ~/.local/share/gedit/plugins/gracer
git pull
```
##### Remember to add rust source code if needed rust

### Install Monero
```
aurman -S monero
```

### Install mellowplayer
```
pacaur -S mellowplayer
sudo pacman -S pepper-flash
```

### Install file sharing
ReadyMedia (minidlna) 
* Remember that the hard disc needs to be mounted with fstab for permission
* Edit /etc/minidlna.conf
```
systemctl enable minidlna.service
systemctl start minidlna.service
killall minidlnad
```

#### In case needed:
```
rebuild:
minidlnad -R
```


### To install crossover (wine ++), please check your harddrive
##### enable -> /etc/pacman.conf 
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```
And:
```
aurman -S crossover
```


## Gnome specific
Change languages and local formats
Code example: gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fi')]"
Code example: gsettings set org.gnome.desktop.background picture-uri "'file:///home/users/Pictures/background.jpg'"
Tweak windows: turn on minimize, maximize
Tweak extensions user themes on, Launch new instance
```
aurman -S chrome-gnome-shell-git gnome-shell-extension-no-topleft-hot-corner
```
https://extensions.gnome.org/extension/358/activities-configurator/

Install plugin
```
## Deprecated: pacaur -S gnome-shell-extension-activities-config
```
Activities configurat on -> Hide text, Disable Hot corner, Panel transparency 70
```
aurman -S gnome-shell-extension-dash-to-dock
```
Dash to dock on -> Shrink dash, show counter indications, customize opacity 40%


## Garbage bin
### Nvidia:
```
sudo pacman -S lib32-nvidia-utils ttf-liberation steam lib32-primus primus libvdpau
```
#### Also to remember:
primusrun %command%
removed primus lib32-primus lib32-nvidia-utils steam
installed nvidia and removed all nvidia
