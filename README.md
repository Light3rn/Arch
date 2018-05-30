# Light3rn Arch install script
Arch install script

1) Boot Installation
2) ```loadkeys xx```
3) ```fdisk -l```
4) a) If UEFI:
* First open  with ```fdisk /dev/sdX```
* Then first let's create new GPT partition table and EFI partition:
* ```g``` -> ```n ``` -> ```(default)``` -> ```(default)``` -> ```+512M ``` -> ```yes ``` -> ```t ``` -> ```n ```
* Then let's use what's left for main partition (you may do what you like):
* ```n ``` -> ```default ``` -> ```default ``` -> ```default ```
5) If Non-UEFI, partition with ```fdisk: /dev/sdX``` and ```o``` -> ```n ``` -> ```a``` -> ```w```
7) ```wget https://github.com/lightern/arch/tarball/master -O - | tar xz```
8) ```dir (to check folder)```
9) ```cd lightern-arch-XXXXXXX```
10) Edit installed programs in archwayland or archx: ```sudo nano archwayland```
11) ```chmod +x install```
12) ```./install```
13) Follow instructions
