#!/system/bin/sh

# Set SeLinux Permissions
setenforce 0

mount /vendor_dlkm
mount /vendor
modprobe -d /vendor/lib/modules /vendor/lib/modules/goodix_brl_mmi.ko
modprobe -d /vendor/lib/modules /vendor/lib/modules/touchscreen_mmi.ko
sleep 1
if [ $(cat /sys/class/touchscreen/primary/productinfo) == "gt9916S" ]
then
echo 1 > /sys/class/touchscreen/primary/forcereflash
echo goodix-boe-gt9916S-24010501-6597AA91-avatrn.bin > /sys/class/touchscreen/primary/doreflash
echo "Reflashing Firmware..."
echo 0 > /sys/class/touchscreen/primary/forcereflash
fi

is_fastboot=$(getprop init.svc.fastbootd)
if [ "$is_fastboot" != "running" ]; then
echo "Fastboot Is Running..."
fi

mkdir /firmware
SLOT=$(getprop ro.boot.slot_suffix)
mount /dev/block/bootdevice/by-name/modem$SLOT /firmware -O ro
echo "1" > /proc/sys/kernel/firmware_config/force_sysfs_fallback
echo "1" > /sys/kernel/boot_adsp/boot
exit 0





