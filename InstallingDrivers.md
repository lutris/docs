
## Ubuntu / KDE Neon / Other Ubuntu derivatives

### NVIDIA:

NOTE: Mint is not supported and these instructions **MAY NOT**  work in Mint.   Following them may leave you packages in a **broken state!** or leave you with **missing drivers**. You have been warned!


To get the latest NVIDIA drivers it is necessary to add the [Proprietary GPU Drivers PPA](https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa), enable 32 bit architecture (if you haven't already), update to refresh packages and then install the 535 driver and support for the Vulkan API (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)):

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


## Void Linux

For 32-bit drivers, enable the `multilib` repository by installing package `void-repo-multilib`. If using the proprietary NVIDIA driver, enable the `nonfree` and `multilib-nonfree` repositories as well by installing `void-repo-nonfree` and `void-repo-multilib-nonfree`. Sync the repository index files with `sudo xbps-install -S`.

**Note:** Not all of the commands below have been thoroughly tested and might install packages that are not strictly necessary.

### NVIDIA

**Note:** The following command assumes that the most recent NVIDIA drivers can be used. If you have an older NVIDIA graphics card, choose the appropriate version of `nvidia` and `nvidia-libs-32bit`.

```console
sudo xbps-install mesa mesa-32bit vulkan-loader vulkan-loader-32bit nvidia nvidia-libs-32bit
```

### AMD

```console
sudo xbps-install mesa mesa-32bit vulkan-loader vulkan-loader-32bit mesa-vulkan-radeon mesa-vulkan-radeon-32bit
```

Alternatively, `amdvlk` and `amdvlk-32bit` can be used instead of `mesa-vulkan-radeon` and `mesa-vulkan-radeon-32bit`.

### Intel

```console
sudo xbps-install mesa mesa-32bit vulkan-loader vulkan-loader-32bit mesa-vulkan-intel mesa-vulkan-intel-32bit
```
