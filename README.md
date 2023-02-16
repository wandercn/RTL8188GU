# RTL8188GU
Realtek RTL8188GU Driver for TP-link TL-WN725N USB wifi


# How to query USB WLAN model ?
 
```
pi@raspberrypi:~ $ lsusb|grep WLAN
Bus 001 Device 007: ID 0bda:b711 Realtek Semiconductor Corp. RTL8188GU 802.11n WLAN Adapter (After Modeswitch)
```
you can see WLAN model is "RTL8188GU"

# For Orange Pi 5 (ARM64)

 build kernel to get linux-headers-legacy-rockchip-rk3588_X.X.X_arm64.deb
 See [orangepi.cn](http://www.orangepi.cn/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-pi-5.html)
```
sudo apt install -y linux-headers-legacy-rockchip-rk3588_X.X.X_arm64.deb
 ```

import module for os_dep/linux/os_intfs.c, if got errors
```
// this is necessary for oragepi5
sed -i '31i MODULE_IMPORT_NS(VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver);' os_dep/linux/os_intfs.c
 ```

## 1. Source installation

 Install the required packages and reboot

```
sudo apt install -y bc build-essential git

sudo reboot

```

Get source code

```
git clone https://github.com/wandercn/RTL8188GU.git
cd RTL8188GU/8188gu-1.0.1

sudo make

sudo make install

```
## 2. DKMS installation
 Install the required packages and reboot

```
sudo apt install -y dkms bc build-essential git dh-make

sudo reboot

```

DKMS install

```

cd /usr/src

sudo git clone https://github.com/wandercn/RTL8188GU.git

sudo mv RTL8188GU/8188gu-1.0.1 8188gu-1.0.1
sudo rm -rf RTL8188GU

sudo dkms add -m 8188gu -v 1.0.1 

sudo dkms build -m 8188gu -v 1.0.1

sudo dkms install -m 8188gu -v 1.0.1

```
check status

```
orangepi@orangepi5:~$ sudo dkms status
8188gu, 1.0.1, 5.10.110-rockchip-rk3588, aarch64: installed

```
# For Raspberry PI (ARM)
## 1. Source installation

 Install the required packages and reboot

```
sudo apt install -y raspberrypi-kernel-headers raspberrypi-kernel raspberrypi-bootloader bc build-essential git

sudo reboot

```

Get source code

```
git clone https://github.com/wandercn/RTL8188GU.git
cd RTL8188GU/8188gu-1.0.1

sudo make

sudo make install

```

## 2. DKMS installation

 Install the required packages and reboot

```
sudo apt install -y dkms raspberrypi-kernel-headers raspberrypi-kernel raspberrypi-bootloader bc build-essential git dh-make

sudo reboot
```

DKMS install

```

cd /usr/src

sudo git clone https://github.com/wandercn/RTL8188GU.git

sudo mv RTL8188GU/8188gu-1.0.1 8188gu-1.0.1
sudo rm -rf RTL8188GU

sudo dkms add -m 8188gu -v 1.0.1 

sudo dkms build -m 8188gu -v 1.0.1

sudo dkms install -m 8188gu -v 1.0.1



```
check status

```
pi@raspberrypi:/usr/src $ sudo dkms status
8188gu, 1.0.1, 5.10.103+, armv6l: installe

```
## 3. deb installation

 Install the required packages and reboot

```
sudo apt install -y dkms raspberrypi-kernel-headers raspberrypi-kernel raspberrypi-bootloader bc build-essential git dh-make

sudo reboot
```

dkms deb install

```
dpkg -i 8188gu-dkms_1.0.1_armhf.deb

```

check status

```
pi@raspberrypi:/usr/src $ sudo dkms status
8188gu, 1.0.1, 5.10.103+, armv6l: installe

```

make only binary driver deb for help others

```
sudo mkbmdeb -m 8188gu -v 1.0.1

Using /etc/dkms/template-dkms-mkbmdeb
copying template...
modifying debian/changelog...
modifying debian/compat...
modifying debian/control...
modifying debian/copyright...
modifying debian/README.Debian...
modifying debian/rules...
copying legacy postinstall template...
Copying source tree...
Gathering binaries...Marking modules for 4.9.41-v7+ (armv7l) for archiving...

Creating tarball structure to specifically accomodate binaries.

Tarball location: /var/lib/dkms/8188gu/1.0.1/tarball/8188gu-1.0.1.dkms.tar.gz


DKMS: mktarball completed.

Copying DKMS tarball into DKMS tree...
Building binary package...dpkg-buildpackage: warning: using a gain-root-command while being root
 dpkg-source --before-build 8188gu-dkms-1.0.1
 fakeroot debian/rules clean
dh_clean: Compatibility levels before 9 are deprecated (level 7 in use)
 debian/rules build
 fakeroot debian/rules binary
dh_installdirs: Compatibility levels before 9 are deprecated (level 7 in use)
dh_strip: Compatibility levels before 9 are deprecated (level 7 in use)
dh_installdeb: Compatibility levels before 9 are deprecated (level 7 in use)
 dpkg-genbuildinfo --build=binary
 dpkg-genchanges --build=binary >../8188gu-dkms-bin_1.0.1_armhf.changes
dpkg-genchanges: info: binary-only upload (no source code included)
 dpkg-source --after-build 8188gu-dkms-1.0.1


DKMS: mkbmdeb completed.
Moving built files to /var/lib/dkms/8188gu/1.0.1/bmdeb...
Cleaning up temporary files...

>> you can find deb file in /var/lib/dkms/8188gu/1.0.1/bmdeb/
>> send the deb file to others for install driver 
```
## 4. only binary driver deb (The corresponding kernel version is required)

```
dpkg -i 8188gu-modules-4.9.41-v7+_1.0.1_armhf.deb
dpkg -i 8188gu-modules-5.10.103+_1.0.1_armhf.deb

sudo depmod $(uname -r)
sudo reboot
```
# For Ubuntu PC(x86)

## 1. Source installation

 Install the required packages and reboot

```
sudo apt install -y dkms git build-essential linux-headers-$(uname -r)

```

Get source code

```
git clone https://github.com/wandercn/RTL8188GU.git
cd RTL8188GU/8188gu-1.0.1
sudo ./AMD_X86.sh

sudo make

sudo make install

```

## 2. DKMS installation

 Install the required packages and reboot

```
sudo apt install -y dkms git build-essential linux-headers-$(uname -r) dh-make

```

DKMS install

```

cd /usr/src

sudo git clone https://github.com/wandercn/RTL8188GU.git 8188gu-1.0.1

sudo cd RTL8188GU/8188gu-1.0.1
sudo ./AMD_X86.sh
sudo mv 8188gu-1.0.1 ../ 
sudo rm -rf RTL8188GU

sudo dkms add -m 8188gu -v 1.0.1 

sudo dkms build -m 8188gu -v 1.0.1

sudo dkms install -m 8188gu -v 1.0.1



```
check status

```
pi@raspberrypi:/usr/src $ sudo dkms status
8188gu, 1.0.1, 5.10.103+, armv6l: installe

```
make only binary driver deb for help others

```
sudo dkms mkbmdeb -m 8188gu -v 1.0.1

Using /etc/dkms/template-dkms-mkbmdeb
copying template...
modifying debian/changelog...
modifying debian/compat...
modifying debian/control...
modifying debian/copyright...
modifying debian/README.Debian...
modifying debian/rules...
copying legacy postinstall template...
Gathering binaries...Marking modules for 5.13.0-37-generic (x86_64) for archiving...

Creating tarball structure to specifically accomodate binaries.

Tarball location: /var/lib/dkms/8188gu/1.0.1/tarball//8188gu-1.0.1.dkms.tar.gz


DKMS: mktarball completed.

Copying DKMS tarball into DKMS tree...
Building binary package...dpkg-buildpackage: 警告: 使用超级用户命令
 dpkg-source --before-build .
 fakeroot debian/rules clean
dh_clean: warning: Compatibility levels before 9 are deprecated (level 7 in use)
 debian/rules build
 fakeroot debian/rules binary
dh_installdirs: warning: Compatibility levels before 9 are deprecated (level 7 in use)
dh_strip: warning: Compatibility levels before 9 are deprecated (level 7 in use)
dh_compress: warning: Compatibility levels before 9 are deprecated (level 7 in use)
dh_installdocs: warning: Compatibility levels before 9 are deprecated (level 7 in use)
dh_installdeb: warning: Compatibility levels before 9 are deprecated (level 7 in use)
dh_shlibdeps: warning: Compatibility levels before 9 are deprecated (level 7 in use)
 dpkg-genbuildinfo --build=binary
 dpkg-genchanges --build=binary >../8188gu-dkms-bin_1.0.1_amd64.changes
dpkg-genchanges: info: binary-only upload (no source code included)
 dpkg-source --after-build .


DKMS: mkbmdeb completed.
Moving built files to /var/lib/dkms/8188gu/1.0.1/bmdeb...
Cleaning up temporary files...

>> you can find deb file in /var/lib/dkms/8188gu/1.0.1/bmdeb/
>> send the deb file to others for install driver 

```

## 3. deb installation

 Install the required packages and reboot

```
sudo apt install -y dkms git build-essential linux-headers-$(uname -r) dh-make

```

dkms deb install

```
dpkg -i 8188gu-dkms_1.0.1_amd64.deb

```

check status

```
pi@raspberrypi:/usr/src $ sudo dkms status
8188gu, 1.0.1, 5.10.103+, armv6l: installe

```
## 4. only binary driver deb installation（The corresponding kernel version is required）
```
dpkg -i 8188gu-modules-5.13.0-37-generic_1.0.1_amd64.deb

sudo depmod $(uname -r)
sudo reboot
```
# Thanks
 [@McMCCRU](https://github.com/McMCCRU/rtl8188gu)
