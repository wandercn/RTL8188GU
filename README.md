# RTL8188GU
Realtek RTL8188GU Driver for TP-link TL-WN725N USB wifi


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
sudo apt install -y dkms raspberrypi-kernel-headers raspberrypi-kernel raspberrypi-bootloader bc build-essential git

sudo reboot
```

DKMS install

```

cd /usr/src

sudo git clone https://github.com/wandercn/RTL8188GU.git 8188gu-1.0.1

sudo cd RTL8188GU/8188gu-1.0.1
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
## 3. deb installation

 Install the required packages and reboot

```
sudo apt install -y dkms raspberrypi-kernel-headers raspberrypi-kernel raspberrypi-bootloader bc build-essential git

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
sudo apt install -y dkms git build-essential linux-headers-$(uname -r)

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
sudo mkbmdeb -m 8188gu -v 1.0.1
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
## 4. only binary driver deb （The corresponding kernel version is required）
```
dpkg -i 8188gu-modules-5.13.0-37-generic_1.0.1_amd64.deb
```
# Thanks
 [@McMCCRU](https://github.com/McMCCRU/rtl8188gu)
