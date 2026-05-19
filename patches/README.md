# 🔥 Sancikrunul Kernel — POCO X3 Pro (vayu)

<div align="center">

![Kernel](https://img.shields.io/badge/Kernel-Sancikrunul-orange?style=for-the-badge)
![Device](https://img.shields.io/badge/Device-POCO%20X3%20Pro-blue?style=for-the-badge)
![ROM](https://img.shields.io/badge/ROM-HyperOS%202-red?style=for-the-badge)
![KernelSU](https://img.shields.io/badge/Root-KernelSU%20Next-green?style=for-the-badge)

</div>

Custom kernel untuk **POCO X3 Pro (vayu/bhima)** berbasis HyperOS 2, dengan nama kernel **Sancikrunul** dan integrasi **KernelSU Next** untuk akses root.

---

## ✨ Fitur

| Fitur | Keterangan |
|-------|------------|
| 🏷️ Kernel Name | `sancikrunul` |
| 📱 Device | POCO X3 Pro (vayu / bhima) |
| 🔑 Root Manager | KernelSU Next (latest) |
| 🔧 Compiler | Clang 19 (ZyCromerZ) |
| 🎯 ROM Target | HyperOS 2 |
| 📦 Source | [AnymoreProject/kernel_xiaomi_vayu](https://github.com/AnymoreProject/kernel_xiaomi_vayu) |

---

## 🏗️ Struktur Repository

```
sancikrunul-kernel/
├── .github/
│   └── workflows/
│       └── build-kernel.yml    ← GitHub Actions workflow utama
├── patches/                    ← Patch tambahan (opsional, format .patch)
│   └── *.patch
├── scripts/                    ← Script helper
│   └── extract-boot.sh
└── README.md
```

---

## 🚀 Cara Build via GitHub Actions

### Step 1 — Fork / Setup Repository

1. **Fork** repository ini ke akun GitHub kamu, atau buat repo baru dan upload semua file ini ke dalamnya.

2. Pastikan struktur folder sesuai di atas.

### Step 2 — Enable GitHub Actions

1. Buka repository kamu di GitHub.
2. Klik tab **Actions**.
3. Klik **"I understand my workflows, go ahead and enable them"** jika diminta.

### Step 3 — Jalankan Build

1. Klik tab **Actions** di repo kamu.
2. Pilih workflow **"🔨 Build Sancikrunul Kernel - POCO X3 Pro (vayu)"**.
3. Klik tombol **"Run workflow"** (kanan atas).
4. Isi parameter build:

   | Parameter | Keterangan | Default |
   |-----------|------------|---------|
   | `Enable KernelSU Next` | Aktifkan root KernelSU Next | ✅ true |
   | `Upload to GitHub Release` | Upload hasil ke GitHub Release | ✅ true |
   | `Build Type` | RELEASE atau DEBUG | RELEASE |

5. Klik **"Run workflow"** warna hijau.

### Step 4 — Tunggu Build Selesai

Build memakan waktu sekitar **30–60 menit** tergantung cache.

Progres bisa dipantau secara real-time di tab **Actions**.

### Step 5 — Download Hasil Build

Setelah build selesai:

- **Via Artifacts**: Tab Actions → pilih run → scroll ke bagian Artifacts → download.
- **Via Releases**: Tab **Releases** di halaman repo kamu (jika opsi upload to release diaktifkan).

---

## 📲 Cara Flash Kernel

1. Pastikan bootloader sudah **unlock**.
2. Install **Custom Recovery** (TWRP / OrangeFox).
3. Backup ROM kamu terlebih dahulu.
4. Download file `.zip` hasil build.
5. Boot ke Recovery.
6. Flash file zip tersebut.
7. Reboot.
8. (Jika pakai KernelSU Next) → Install **KernelSU Manager APK** dari [KernelSU Next Releases](https://github.com/rifsxd/KernelSU-Next/releases).

---

## ⚙️ Informasi Boot Image (HyperOS 2)

Diambil dari analisis `boot.img` HyperOS 2 milik vayu:

```
Magic           : ANDROID!
Header Version  : 2
Page Size       : 4096
Kernel Addr     : 0x00008000
Ramdisk Addr    : 0x01000000
Tags Addr       : 0x00000100
Cmdline         : console=ttyMSM0,115200n8 androidboot.hardware=qcom
                  androidboot.console=ttyMSM0 androidboot.memcg=1
                  lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,
                  memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1
                  swiotlb=2048 loop.max_part=7
                  androidboot.usbcontroller=a600000.dwc3 buildvariant=user
```

---

## 🔑 Tentang KernelSU Next

[KernelSU Next](https://github.com/rifsxd/KernelSU-Next) adalah fork aktif dari KernelSU yang memberikan akses root berbasis kernel (bukan Magisk/overlay).

Keunggulan:
- Root langsung di level kernel
- Lebih susah dideteksi oleh apps banking
- Mendukung module Magisk melalui KSUD
- Tidak memerlukan patching boot image manual

---

## 📋 Requirements Sebelum Build

- Akun **GitHub** (gratis)
- Repository ini sudah di-fork / di-upload ke GitHub
- **Tidak perlu** mesin Linux lokal — semua build terjadi di GitHub Actions (gratis 2000 menit/bulan)

---

## 🛠️ Menambahkan Patch Custom

Taruh file `.patch` ke folder `patches/`. Workflow akan otomatis menerapkannya sebelum build.

Cara membuat patch dari perubahan lokal:
```bash
git diff > patches/nama-patch-saya.patch
```

---

## ⚠️ Disclaimer

> Kernel ini dibuat untuk tujuan pembelajaran dan kustomisasi personal.
> Flash kernel custom berisiko brick jika tidak dilakukan dengan benar.
> **Selalu backup sebelum flash.** Developer tidak bertanggung jawab atas kerusakan perangkat.

---

## 📞 Referensi

- [AnymoreProject/kernel_xiaomi_vayu](https://github.com/AnymoreProject/kernel_xiaomi_vayu)
- [KernelSU Next](https://github.com/rifsxd/KernelSU-Next)
- [AnyKernel3](https://github.com/osm0sis/AnyKernel3)
- [ZyCromerZ Clang](https://github.com/ZyCromerZ/Clang)
