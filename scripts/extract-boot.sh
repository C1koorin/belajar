#!/usr/bin/env bash
# ============================================================
# extract-boot.sh — Ekstrak dan analisis Android boot.img
# Untuk: POCO X3 Pro (vayu) | HyperOS 2
# ============================================================
set -e

BOOT_IMG="${1:-boot.img}"
OUT_DIR="${2:-boot_extracted}"

if [ ! -f "$BOOT_IMG" ]; then
    echo "Usage: $0 <boot.img> [output_dir]"
    exit 1
fi

echo "================================================"
echo " Sancikrunul Boot Image Extractor"
echo "================================================"
echo ""

# Install tool jika belum ada
if ! command -v magiskboot &>/dev/null; then
    echo "[*] Downloading magiskboot..."
    wget -q https://github.com/topjohnwu/Magisk/releases/latest/download/Magisk-v27.0.apk \
         -O Magisk.apk
    unzip -p Magisk.apk lib/x86_64/libmagiskboot.so > magiskboot
    chmod +x magiskboot
    MAGISKBOOT=./magiskboot
else
    MAGISKBOOT=magiskboot
fi

mkdir -p "$OUT_DIR"
cp "$BOOT_IMG" "$OUT_DIR/boot.img"
cd "$OUT_DIR"

echo "[*] Unpacking boot.img..."
$MAGISKBOOT unpack boot.img

echo ""
echo "[*] Boot image info:"
$MAGISKBOOT hexpatch boot.img --dryrun 2>/dev/null || true

ls -lh

echo ""
echo "[+] Ekstraksi selesai di: $OUT_DIR/"
echo "    kernel      — kernel binary"
echo "    ramdisk.cpio.gz — ramdisk"
echo "    dtb         — device tree blob (jika ada)"
