debian-mini-odroid-c1
=====================

Script to build a minimal Debian sd card image.  If you are looking for a minimal Debian image with read-only root file system, look [here](https://github.com/tomuta/debian-mini-ro-root-odroid-c1).

## Features:
* SSH root login password: odroid
* Host name: odroidc1-MACADDRESS (e.g. odroidc1-1a2b3c4d5e6f)
* SSH host keys are generated and saved permanently on first boot
* Automatic mounting of USB storage devices using usbmount

# Using docker

Just do :

```
docker build --rm -t="ants/odroidbuilder:v1" .
docker run --privileged -ti -v /temp:/temp ants/odroidbuilder:v1
```

and then 

```
mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc
apt-get update
apt-get install -y binfmt-support qemu qemu-user-static
git clone https://github.com/vallettea/debian-mini-odroid-c1.git /root/odroid
cd /root/odroid
make
```
# Clone

This will install the toolchains, compile u-boot, the kernel, bootstrap Debian and create a 512mb sdcard.img file, which then can be transferred to a sd card (e.g. using dd):
```
sudo dd bs=1M if=sdcard.img of=/dev/YOUR_SD_CARD
```
