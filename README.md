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
- [ ] All important partitions listed in wipe/mount/backup lists
- [X] Input devices via USB-OTG
- [ ] USB mass storage export
- [X] Correct date
- [X] Battery level
- [X] Set brightness
- [X] Vibrate and set vibration
- [X] Screenshot
- [ ] Advanced features

# Building
```bash
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch twrp_avatrn-eng
mka recoveryimage -j$(nproc --all)
```

**Copyright (C) 2024 A-Team Digital Solutions**<br />
**Tree template from TeamWin, some file from VanFirmwareDumps**
