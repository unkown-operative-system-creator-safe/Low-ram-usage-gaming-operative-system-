#!/bin/bash

# Setup zRAM for ultra-low memory usage
cat <<EOF > /etc/systemd/zram-generator.conf
[zram0]
zram-size = ram / 2
compression-algorithm = zstd
EOF
systemctl daemon-reload

# Kernel Tweaks for Gaming Performance
cat <<EOF > /etc/sysctl.d/99-gaming.conf
vm.swappiness=10
vm.max_map_count=2147483642
kernel.nmi_watchdog=0
EOF

# Force Performance Governor
echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# Enable necessary background services
systemctl enable NetworkManager
systemctl enable gamemoded

echo "OS Optimized."
