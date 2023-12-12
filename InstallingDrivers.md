
**NOTE:** The information in this page is NOT endorsed by the Lutris development team. It is entirely written by the community.


## Ubuntu / KDE Neon / Other Ubuntu derivatives

### NVIDIA:

NOTE: Mint is not supported and these instructions **MAY NOT**  work in Mint.   Following them may leave you packages in a **broken state!** or leave you with **missing drivers**. You have been warned!


To get the latest NVIDIA drivers it is necessary to add the [Proprietary GPU Drivers PPA](https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa), enable 32 bit architecture (if you haven't already), update to refresh packages and then install the 535 driver and support for the Vulkan API (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)):

**NOTE** YOU DO NOT NEED TO USE A PPA TO INSTALL VULKAN AND DRIVERS

To do all of that, run this one command:

    sudo add-apt-repository ppa:graphics-drivers/ppa && sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install -y nvidia-driver-535 libvulkan1 libvulkan1:i386

Reboot to apply changes.

_**Warning**: Please ensure your graphics card is supported by the 535 driver before installing._
_For a list of supported GPUs click here: https://www.nvidia.com/Download/driverResults.aspx/186156/en-us_
    
_**Disclaimer**: Sometimes we forget to update the guide to reference the latest version of the NVIDIA driver._
_You can check the latest version of the Nvidia driver for your gpu here and then replace *535* in **nvidia-driver-535** with the first part of the version number (the one before the dot, **535**.48.07) that is actually latest: https://www.nvidia.com/Download/index.aspx_

### AMD / Intel:

**NOTE:** Mint is not supported and these instructions **WILL NOT** work in Mint without manual intervention that is outside the scope of this guide.  Following them **WILL** leave your packages in a broken state!!

To make sure you are running the latest drivers for AMD/Intel graphics, you need to add [kisak-mesa PPA](https://launchpad.net/~kisak/+archive/ubuntu/kisak-mesa), enable 32 bit architecture (if you haven't already), update and upgrade your system, install support for 32-bit games and install the support for Vulkan API (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)):

**NOTE** YOU DO NOT NEED TO USE A PPA TO INSTALL VULKAN AND DRIVERS

To do all of that, run this one command:

    sudo add-apt-repository ppa:kisak/kisak-mesa && sudo dpkg --add-architecture i386 && sudo apt update && sudo apt upgrade && sudo apt install libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386

Reboot to apply changes.

_Note: Only Ubuntu 18.04 and higher is supported for AMD and Intel graphics._

_Note for Intel integrated graphics users: Only Skylake and newer Intel CPUs (processors) offer full Vulkan support. Broadwell, Haswell and Ivy Bridge only offer partial support, which will very likely not work with a lot of games properly. Sandy Bridge and older lack any Vulkan support whatsoever._

## Arch / Manjaro / Other Arch Linux derivatives:

First, enable multilib (32-bit support).

To enable multilib repository, uncomment the `[multilib]` section in `/etc/pacman.conf`

<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;">/etc/pacman.conf
--------------------------------------------------------------------------------------
[multilib]
Include = /etc/pacman.d/mirrorlist</pre>

Then upgrade the system `sudo pacman -Syu`.

### NVIDIA:

_**Warning**: Please ensure your graphics card is supported by modern NVIDIA driver before installing._
_For a list of supported GPUs click here: https://www.nvidia.com/Download/driverResults.aspx/149138/en-us_

Proprietary driver and support for Vulkan are required for proper functionality of games.

To install it, execute the following command:

_**Warning**: Installing nvidia-settings on Manjaro will fail as it isn't in the repos and gets installed with the drivers themself._
_To make sure you're running proprietary Nvidia drivers you should run sudo mhwd -i pci video-nvidia_

	sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader

### AMD

To install support for Vulkan API  (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)) and 32-bit games, execute following command:

    sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

### Intel

To install support for Vulkan API  (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)) and 32-bit games, execute following command:

    sudo pacman -S --needed lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

_Note for Intel integrated graphics users: Only Skylake and newer Intel CPUs (processors) offer full Vulkan support. Broadwell, Haswell and Ivy Bridge only offer partial support, which will very likely not work with a lot of games properly. Sandy Bridge and older lack any Vulkan support whatsoever._

## Fedora (Incomplete Guide)
*Note: Dnf will pull most, if not all, AMD/Intel drivers with an install of Lutris, Wine, and/or Steam. Unless on an NVIDIA card, the following guide may be redundant.*

To install support for Vulkan API (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility) and driver), execute following command:

    sudo dnf install vulkan-loader vulkan-loader.i686

### NVIDIA:

_**Warning**: Please ensure your graphics card is supported by modern NVIDIA driver before installing._
_For a list of supported GPUs click here: https://www.nvidia.com/Download/driverResults.aspx/149138/en-us_

Proprietary driver and support for Vulkan are required for proper functionality of games.

First, update (and reboot) your system:

    sudo dnf update
    reboot
Next, make sure the official repos are installed:

    sudo dnf install fedora-workstation-repositories
Enable the NVIDIA driver repo:

    sudo dnf config-manager --set-enabled rpmfusion-nonfree-nvidia-driver
Reboot again.
After the reboot, verify the addition of the repository via the following command:

    sudo dnf repository-packages rpmfusion-nonfree-nvidia-driver info
If several NVIDIA drivers are loaded, you are good to go. Finally, login, connect to the internet, and open the software app. Click _Add-ons> Hardware Drivers> NVIDIA Linux Graphics Driver> Install._

If you’re using an older GPU or plan to use multiple GPUs, check  [the RPMFusion guide](https://rpmfusion.org/Howto/NVIDIA?highlight=%28CategoryHowto%29)  for further instructions. Finally, to ensure a successful reboot, set “WaylandEnable=false” in  _/etc/gdm/custom.conf_, and make sure to avoid using secure boot.


## openSUSE Tumbleweed

*Notice:* openSUSE Leap releases are currently not officaly supported because they ship an older version of glibc (2.26 but 2.27 is required at least).

### AMD

Usually, if you have an AMD GPU running with open source drivers (Mesa), the required packages should already be installed.
If for some reason they aren't, run the following command:

    sudo zypper in kernel-firmware-amdgpu libdrm_amdgpu1 libdrm_amdgpu1-32bit libdrm_radeon1 libdrm_radeon1-32bit libvulkan_radeon libvulkan_radeon-32bit libvulkan1 libvulkan1-32bit
    
### Intel

Usually, if you have an Intel iGPU running with open source drivers (Mesa), the required packages should already be installed.
If for some reason they aren't, run the following command:

    sudo zypper in kernel-firmware-intel libdrm_intel1 libdrm_intel1-32bit libvulkan1 libvulkan1-32bit libvulkan_intel libvulkan_intel-32bit
    
### NVIDIA

The closed source NVIDIA driver is not available by default.
Please check which NVIDIA GPU you have and run one of the following One-Click Installers.

Those will then add the required official NVIDIA driver repository from https://download.nvidia.com/opensuse/ and install the required NVIDIA driver package.

#### Geforce 600 series and later

[Supported products](https://www.nvidia.com/Download/driverResults.aspx/162107/en-us)

[One Click Installer](https://opensuse-community.org/nvidia_G05.ymp)

#### Geforce 400 series and later

[Supported products](https://www.nvidia.com/Download/driverResults.aspx/142567/en-us)

[One Click Installer](https://opensuse-community.org/nvidia_G04.ymp)


For Vulkan support on NVIDIA drivers also run:

    sudo zypper in libvulkan1 libvulkan1-32bit

## NixOS

*Notice:* Do NOT download video drivers via building it, installing via ``nix-env`` or such, putting the lines below and rebuilding is the safest way to download video drivers on NixOS.

### AMD

Add the following lines to your NixOS hardware config, by default it should be at ``/etc/nixos/hardware-configuration.nix``

```boot.initrd.kernelModules = [ "amdgpu" ];```

To use the amdgpu graphics driver on XServer, add the following lines to your NixOS config, by default it should be at ``/etc/nixos/configuration.nix`` (customize as you prefer)

```
services.xserver.enable = true; # to enable the xorg server
services.xserver.videoDrivers = [ "amdgpu" ]; # to load the amdgpu kernel module
```
### NVIDIA

Add the following lines to your NixOS hardware configuration, by default it should be at ``/etc/nixos/hardware-configuration.nix``

```
boot.initrd.kernelModules = [ "nvidia" ]; 
boot.blacklistedKernelModules = ["nouveau"];
```
Add the following lines to your NixOS configuration, by default it should be at ``/etc/nixos/configuration.nix`` (customize as you prefer)

```
# Enable the Xorg Xserver
  services.xserver.enable = true;
# Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;
    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;
    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Do not disable this unless your GPU is unsupported or if you have a good reason to.
    open = true;
    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
```
Adjust the ``package`` variable according to your needs.

Determine which Nvidia driver package you need in accordance with your hardware. The following options are available:
```
hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable
hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta
hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production (installs 535)
hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta
hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_390
hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_340
```

For most users, the first option will be fine, but if you have a very old nvidia GPU, then using a legacy driver is needed.

### Renderer configuration (OpenGL, Vulkan)

To enable OpenGL and Vulkan, you can add the following lines to your NixOS configuration, the file is located at ``/etc/nixos/configuration.nix`` by default.

```
hardware.opengl.driSupport = true;
# For 32 bit applications
hardware.opengl.driSupport32Bit = true;
hardware.opengl.extraPackages = with pkgs; [
  rocm-opencl-icd
  rocm-opencl-runtime
];
```

amdvlk is not recommended but on older AMD hardware, it can be helpful, so to use amdvlk add the following lines to your configuration instead.

```
hardware.opengl.driSupport = true;
# For 32 bit applications
hardware.opengl.driSupport32Bit = true;
hardware.opengl.extraPackages = with pkgs; [
  amdvlk
];
```

And to verify if you have OpenGL properly set up, you can install ``clinfo``.

For additional troubleshooting steps, [you can refer to the NixOS wiki](https://nixos.wiki/wiki)

Links: 
[AMD](https://nixos.wiki/wiki/AMD_GPU);
[NVIDIA](https://nixos.wiki/wiki/Nvidia);
[Intel](https://nixos.wiki/wiki/Intel_Graphics);

