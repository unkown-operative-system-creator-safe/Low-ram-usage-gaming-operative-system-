#!/bin/bash
# Gaming Tweaks 2026
echo "Optimizing..."

# Use zRAM for low-memory overhead
echo -e "[zram0]\nzram-size = ram / 2\ncompression-algorithm = zstd" > /etc/systemd/zram-generator.conf

# High performance kernel settings
echo "vm.swappiness=10" > /etc/sysctl.d/99-gaming.conf
echo "vm.max_map_count=2147483642" >> /etc/sysctl.d/99-gaming.conf

# Visuals: Autostart Hyprland
echo "exec Hyprland" >> /root/.bash_profile

systemctl enable NetworkManager
systemctl enable gamemoded
