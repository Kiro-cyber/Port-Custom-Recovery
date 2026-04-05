#!/bin/bash
# Для ручной сборки boot-образа с нуля
./tools/mkbootimg \
  --kernel kernel \
  --ramdisk ramdisk.cpio \
  --cmdline "$(cat cmdline)" \
  --base $(cat board) \
  --pagesize $(cat pagesize) \
  --output output/custom_boot.img