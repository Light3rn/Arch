# Light3rn Arch install script
Arch install script

1) Boot Installation
2) loadkeys xx
3) fdisk -l
4) If UEFI, partition with fdisk: /dev/sdX1 EFI and /dev/sdX2 Linux (using GPT)
5) If Non-UEFI, partition with fdisk: /dev/sdX1 (if dos, make it bootable)
6) wget https://github.com/lightern/arch/tarball/master -O - | tar xz
7) dir (to check folder)
8) cd lightern-arch-XXXXXXX
9) Chmod +x install
10) ./install
11) Follow instructions
