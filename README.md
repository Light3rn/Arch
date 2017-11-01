# Arch
Arch install script

1) Boot Installation as UEFI
2) Partition with fdisk:
If UEFI then /dev/sda1 Linux and /dev/sda2 EFI
Else /dev/sda
3) wget https://github.com/Light3rn/Arch/tarball/master -O - | tar xz
4) cd <dir>
5) If not uefi, nano archinstall and change uefi=0
6) chmod +x archinstall
7) ./archinstall
