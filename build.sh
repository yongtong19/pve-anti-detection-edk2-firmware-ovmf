#以下两行docker里面运行需要sudo 如果pve里面运行请删除sudo
sudo apt-get update
sudo apt-get install -y pve-qemu-kvm gcc-aarch64-linux-gnu gcc-riscv64-linux-gnu libacl1-dev libaio-dev libattr1-dev libcap-ng-dev libcurl4-gnutls-dev libepoxy-dev libfdt-dev libgbm-dev libglusterfs-dev libgnutls28-dev libiscsi-dev libjpeg-dev libnuma-dev libpci-dev libpixman-1-dev libproxmox-backup-qemu0-dev librbd-dev libsdl1.2-dev libseccomp-dev libslirp-dev libspice-protocol-dev libspice-server-dev libsystemd-dev liburing-dev libusb-1.0-0-dev libusbredirparser-dev libvirglrenderer-dev meson python3-sphinx python3-sphinx-rtd-theme quilt xfslibs-dev
ls
df -h
git clone git://git.proxmox.com/git/pve-edk2-firmware.git
cd pve-edk2-firmware
git submodule set-url edk2 https://github.com/tianocore/edk2
#git reset --hard 17443032f78eaf9ae276f8df9d10c64beec2e048
apt install devscripts -y
mk-build-deps --install
make
make clean
cp ../ROG-logo-red.bmp debian/Logo.bmp
cp ../sedPatch-pve-edk2-firmware-anti-dection.sh edk2/
cd edk2
chmod +x sedPatch-pve-edk2-firmware-anti-dection.sh
bash sedPatch-pve-edk2-firmware-anti-dection.sh
git diff > edk2-autoGenPatch.patch
cp edk2-autoGenPatch.patch ../
cd ..
apt install devscripts -y
mk-build-deps --install
make
