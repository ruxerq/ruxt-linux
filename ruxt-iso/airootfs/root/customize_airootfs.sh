#!/bin/bash

# Create liveuser without a password and add to essential groups
useradd -m -g users -G wheel,video,audio,optical,storage,power,network,input -s /bin/bash liveuser
passwd -d liveuser

# Allow wheel group passwordless sudo
echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/00-wheel-nopasswd
chmod 0440 /etc/sudoers.d/00-wheel-nopasswd

# Make sure permissions in home are owned by liveuser
chown -R liveuser:users /home/liveuser
