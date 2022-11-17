#! /bin/bash Fedora_Audio_Packages.sh

##########################################################################
figlet "XanMod RT Kernel for Low Latency Audio and Performance"
##########################################################################
figlet "Enable copr Repository"
##########################################################################
sudo cp /etc/fstab /etc/fstab.orig

sudo dnf copr enable rmnscnce/kernel-xanmod -y

sudo dnf install kernel-xanmod-edge kernel-xanmod-rt kernel-xanmod-tt -y

cat /proc/version

# Remove unneeded kernel modules
modules="module1 module2 module3"

for module in $modules; do
  modprobe -r $module
done

# Unbind Bluetooth
echo -n "2-1.6" > /sys/bus/usb/drivers/usb/unbind

# Disable CPU frequency scaling
systemctl mask ondemand

# Set scaling governor to performance
echo -n performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

@audio - rtprio 90       # maximum realtime priority
 @audio - memlock unlimited  # maximum locked-in-memory address space (KB)

cd /etc/sysctl.conf
vm.swappiness = 10

sudo mkdir github

cd github

sudo git clone https://github.com/hamadmarri/TT-CPU-Scheduler.git
sudo chmod 755 TT-CPU-Scheduler.git

cd ~

# Check Config #

su -c 'yum install mercurial'
hg clone https://realtimeconfigquickscan.googlecode.com/hg/ realtimeconfigquickscan

cd realtimeconfigquickscan/

perl realTimeConfigQuickScan.pl

############ Audio Base Packages ##################
sudo dnf install alsa-firmware alsa-tools alsa-utils alsamixergui -y
sudo dnf install mscore tuxguitar Ardour -y
sudo dnf install hydrogen zynaddsubfx sooperLooper -y
sudo dnf install rakarrack guitarix -y
sudo dnf install jackctlmmc pulseaudio-module-jack patchage -y
sudo dnf install a2jmidid jack_capture -y
sudo dnf install JACK-Rack calf carla -y
sudo dnf install ladspa lv2 -y
sudo dnf install rtirq FFADO -y
sudo dnf install wine winetricks q4wine -y
