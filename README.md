# taichi-gpu-passthrough

To restore the libvirt KVM VM, change into the taichi-gpu-passthrough project directory and type:

    sudo virsh define --file win10-passthrough.xml

# To Do
* Fix having to manually enter DNS info in guest. (related to host using systemd-resolved?)
* Use evdev for keyboard/mouse
* Use Looking Glass instead of changing monitor inputs
* Replace virtual disk with passed through SATA SSD
* Single GPU passthrough
