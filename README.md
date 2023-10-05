# taichi-gpu-passthrough

To restore the libvirt KVM VM, change into the taichi-gpu-passthrough project directory and type:

    sudo virsh define --file win10-passthrough.xml

# Single GPU passthrough
If the Nvidia drivers were loaded at boot, copy the "release" and "prepare" directories into the host's /etc/libvirt/hooks/qemu.d/win10-passthrough/ directory. When a user launches the win10-passthrough virtual machine, they will be logged out of the current Wayland session and the Nvidia GPU will be made available to the guest virtual machine. Use of the GPU will be returned to the host when the guest virtual machine closes.

# To Do
* Apply guest optimizations
* Single GPU passthrough
