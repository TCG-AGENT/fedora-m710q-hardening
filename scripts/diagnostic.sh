#!/bin/bash
echo "=============================================="
echo "  Lenovo M710q Security Hardening Diagnostic"
echo "=============================================="
echo ""
echo "[1] Secure Boot Status:"
mokutil --sb-state
echo ""
echo "[2] Kernel Lockdown Mode:"
cat /sys/kernel/security/lockdown
echo ""
echo "[3] IOMMU Status:"
sudo dmesg | grep -i "DMAR: IOMMU enabled" || echo "WARNING: IOMMU not enabled"
echo ""
echo "[4] DMA Remapping Devices:"
if ls /sys/class/iommu/*/devices/* 2>/dev/null; then
    echo "DMA protection active"
else
    echo "WARNING: No IOMMU device groups found"
fi
echo ""
echo "[5] Suspend Mode:"
cat /sys/power/mem_sleep
echo ""
echo "[6] Kernel Command Line:"
cat /proc/cmdline
echo ""
echo "[7] Full HSI Report:"
sudo fwupdmgr security --force
