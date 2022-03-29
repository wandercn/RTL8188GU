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


# Thanks
 [@McMCCRU](https://github.com/McMCCRU/rtl8188gu)
