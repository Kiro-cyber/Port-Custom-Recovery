#!/bin/bash
set -e

BOOT_IMAGE=$1
OUTPUT_DIR="output"

echo "Extracting recovery from $BOOT_IMAGE..."

# Используем magiskboot для распаковки
./tools/magiskboot unpack "$BOOT_IMAGE"

# Находим и сохраняем ramdisk (рекавери)
if [ -f ramdisk.cpio ]; then
  mv ramdisk.cpio "$OUTPUT_DIR/recovery.img"
  echo "Recovery extracted to $OUTPUT_DIR/recovery.img"
else
  echo "Error: Could not find recovery in boot image"
  exit 1
fi

# Очистка временных файлов
rm -f kernel kernel_dtb cmdline board base pagesize pagesize_kernel tags_addr kernel_offset ramdisk_offset second_offset dt_offset header_version os_version os_patch_level dtb
