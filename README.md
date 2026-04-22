# Fedora 43 Hardening on Lenovo ThinkCentre M710q

![HSI Status](https://img.shields.io/badge/HSI-2%2B-success?style=flat&logo=lenovo&logoColor=white&labelColor=555555)
![Fedora](https://img.shields.io/badge/Fedora-43-51a2da?style=flat&logo=fedora&logoColor=white)
![Kernel](https://img.shields.io/badge/Kernel-6.19-blue?style=flat&logo=linux&logoColor=white)
![Secure Boot](https://img.shields.io/badge/Secure%20Boot-Enabled-brightgreen?style=flat&logo=ubuntu&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat)

## Problem Statement

On a Lenovo ThinkCentre M710q running Fedora 43, the `fwupdmgr security` report showed **HSI:1!** with failures for:

- UEFI Secure Boot (`! Fail`)
- Linux Kernel Lockdown (`! Fail`)
- IOMMU Protection (`! Fail`)
- Pre-boot DMA Protection (`! Fail`)
- Suspend-to-RAM (`! Fail`)

Despite Secure Boot being enabled in the BIOS, the OS reported it as disabled and stuck in "Setup Mode".

## Solution Overview

This project provides a reproducible methodology to:

1. **Resolve Secure Boot "Setup Mode"** using `mokutil --enable-validation` and MokManager enrollment.
2. **Enable Kernel Lockdown** in `confidentiality` mode.
3. **Enable IOMMU and DMA Protection** via kernel parameters.
4. **Disable Suspend-to-RAM** (switch to `s2idle`).

After applying the fixes, the system achieved **HSI-2+**, the maximum possible for this hardware generation.

## Quick Start

### 1. Diagnostic (Before Hardening)
```bash
git clone https://github.com/TCG-AGENT/fedora-m710q-hardening.git
cd fedora-m710q-hardening
./scripts/diagnostic.shENDREADME
