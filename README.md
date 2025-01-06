Recovery configuration for Moto Edge 2024 (gen5) (codenamed "avatrn")
=========================================

The Motorola Moto Edge 2024 (gen5) (codenamed _"avatrn"_) is a mid-range smartphone from Motorola Mobility announced June 4th 2024.

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
SoC     | Qualcomm SM7435-AB Snapdragon 7s Gen 2 (4 nm)
CPU     | Octa-core (4x2.40 GHz Cortex-A78 & 4x1.95 GHz Cortex-A55)
GPU     | Adreno 710
Memory  | 8 GB RAM (LPDDR4X)
Shipped Android Version | 13.0, My UX 3.0 (Global)
Storage | 256 GB (UFS 2.2)
Battery | Non-removable Li-Po 5000 mAh battery
Display | P-OLED, 1B clrs, 144Hz, HDR10+, 1300nit, 2400x1080, 6.67" (~402 ppi density)
Camera  | 50MP (Wide) + 13MP (Ultra-wide) + 32MP (Selfie)

## Device picture
![Motorola Moto Edge 2024 (gen5)](https://fdn2.gsmarena.com/vv/bigpic/motorola-edge-2024.jpg)

## Device link @ gsmArena
https://m.gsmarena.com/motorola_edge_(2024)-13111.php

# Status
Current state of features:
- [X] Correct screen/recovery size
- [X] Working touch, display
- [X] Screen goes off and on
- [ ] Backup/restore to/from internal/external storage and adb
- [X] Poweroff
- [X] Reboot to system, bootloader, recovery, fastboot, edl
- [X] ADB (including sideload)
- [X] Support EROFS/F2FS/EXT4/exFAT/FAT32/NTFS
- [X] Decrypt /data
- [ ] Flashing zip/images
- [X] MTP export
- [X] All important partitions listed in wipe/mount/backup lists
- [X] Input devices via USB-OTG
- [X] USB mass storage export
- [X] Correct date
- [X] Battery level
- [X] Set brightness
- [X] Vibrate and set vibration
- [X] Screenshot
- [ ] Advanced features

# Images
As of this message being added, I have not flashed the recovery.img in my [other repo](https://github.com/lunarriaa/Action-TWRP-Builder/releases/tag/12635927479)
I am not liable for your device, please do not ask for help in issues. I only made this for my phone specifically, and if it works for me, that's all I need.

# Building

I sincierly apologize for the hell you are about to experience. But if you need some major tips, here.

Resources; 
[Manifest](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp)
[Device Trees](https://github.com/twrpdtgen/)
[Building a Device Tree](https://github.com/twrpdtgen/twrpdtgen/)

If building online, like a GitHub Action/.etc,

- Find your builder, by using [the one I used](https://github.com/lunarriaa/Action-TWRP-Builder/) or searching for one on GitHub.
- Follow the guide in the README.md. If confused on what the variables are, you need your Device Tree, and the android version your phone uses by default. "twrp-12.1" is Android 12, "twrp-14" is Android 14. I don't know if these actually mattered, but just know that trying Android 14 usually failed for me, but 12.1 worked.
- Once your variables are inputed, run the workflow, wait, seriously, I thought it was going to take shorter, but it still took a hour. Don't worry if it freezes a few times, the only thing that matters is if it crashes. If you get the error; PRODUCT_BOOT_CONTROL_HAL is obsolete or something similar, comment out the line in AndroidProducts.mk on your device tree, Fork it if needed.
- If needed, troubleshoot until it works. If no image, you may have done something wrong. Check logs. Do not expect first try, ever. 
- Flash your recovery image like normal.

If building locally, like a laptop/pc/.etc follow this guide, if not, follow the one above.

In a **Linux** enviroment, specifically Ubuntu/Arch/etc.
- *Tip* : Do not use a desktop environment if you dont plan on keeping the install after the build. Just use TTY, as it lowers RAM usage.

Above, in the Resources section, open the "Building a Device Tree" and "Manifest" links. Read their guides to see what they depend on.
It's usually python3, git, and repo. 

For Ubuntu/Debian based distros;
```sh
sudo apt-get install python3 python3-pip git repo
pip3 install twrpdtgen
mkdir {whatever you want}
cd {whatever you want}
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp -b twrp-{your android ver, 11, 12.1, 14}
repo sync
```
Building your device tree;

```sh
cd ~/{firmware dump/location of stock recovery.img}
pip3 twrpdtgen -m {your recovery.img}
```
If you already found a device tree, clone the repo for it and make sure every instance of "omni" in every file is renamed to "twrp", then move it to /device/yourprovider/yourdevice in your TWRP manifest dir.

If you did everything right, and are incredibly lucky, enter the commands below, and then go to your new TWRP recovery.
If not, the issues should always be around the same which are usually due to vendorsetup.sh (comment out lines inside, or just delete it)
If you get out of memory errors, either A, get more RAM, or B, grab one fat fucking SSD/HDD and make a 32GB Swap file. Use tutorials on how to do that.
Do troubleshooting if needed, and word of advice, put quotes around your google search. It will only search for that word.


```bash
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch twrp_avatrn-eng
mka recoveryimage -j$(nproc --all)
```

**Copyright (C) 2024 A-Team Digital Solutions**<br />
**Tree template from TeamWin, some file from VanFirmwareDumps**
