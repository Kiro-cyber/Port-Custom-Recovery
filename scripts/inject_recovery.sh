#!/bin/bash
set -e

TARGET_BOOT=$1
RECOVERY_IMAGE=$2
OUTPUT_BOOT=$3

echo "Injecting recovery into $TARGET_BOOT..."

# Распаковываем целевой boot-образ
./tools/magiskboot unpack "$TARGET_BOOT"

# Заменяем ramdisk на наш рекавери
cp "$RECOVERY_IMAGE" ramdisk.cpio

# Пересобираем boot-образ
./tools/magiskboot repack "$TARGET_BOOT" --keepcmdline

# Сохраняем результат
mv new-boot.img "$OUTPUT_BOOT"
echo "Ported boot image created: $OUTPUT_BOOT"