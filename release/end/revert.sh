#!/bin/bash
# Helpful to read output when debugging
set -x

# Restore power profile to balanced
# powerprofilesctl set balanced

# Unload VFIO Kernel Module
modprobe -r vfio-pci

# Re-Bind GPU to Nvidia Driver
virsh nodedev-reattach pci_0000_01_00_3
virsh nodedev-reattach pci_0000_01_00_2
virsh nodedev-reattach pci_0000_01_00_1
virsh nodedev-reattach pci_0000_01_00_0

# Reload nvidia modules
modprobe nvidia_drm nvidia_uvm
nvidia-xconfig --query-gpu-info > /dev/null 2>&1

# Bind EFI-Framebuffer
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/bind

# Rebind VT consoles
echo 1 > /sys/class/vtconsole/vtcon0/bind
# Some machines might have more than 1 virtual console. Add a line for each corresponding VTConsole
#echo 1 > /sys/class/vtconsole/vtcon1/bind

# Restart Display Manager
systemctl start display-manager.service
