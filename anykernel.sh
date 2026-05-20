kernel.string=Sancikrunul Kernel by GitHub Actions
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=vayu
device.name2=bhima
supported.versions=
supported.patchlevels=

. tools/ak3-core.sh;

block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

split_boot;
flash_boot;
