
## Ubuntu

### Nvidia:

To get the latest Nvidia drivers it is necessary to add the [Proprietary GPU Drivers PPA](https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa):

    sudo add-apt-repository ppa:graphics-drivers/ppa

Enable 32 bit architecture (if you haven't already):

    sudo dpkg --add-architecture i386 

Update to refresh packages:

    sudo apt update

_**Warning**: Please ensure your graphics card is supported by the 465 driver before installing._
_For a list of supported GPUs click here: https://www.nvidia.com/Download/driverResults.aspx/163238/en-us

Install the 465 driver:

    sudo apt install nvidia-driver-465

Install support for Vulkan API (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)):

    sudo apt install libvulkan1 libvulkan1:i386

Reboot to apply changes.

### AMD / Intel:

Add [kisak-mesa PPA](https://launchpad.net/~kisak/+archive/ubuntu/kisak-mesa): 

    sudo add-apt-repository ppa:kisak/kisak-mesa

Enable 32 bit architecture (if you haven't already):

    sudo dpkg --add-architecture i386 

Upgrade your system:

    sudo apt update && sudo apt upgrade

Install support for 32-bit games:

    sudo apt install libgl1-mesa-dri:i386

Install support for Vulkan API (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)):    

    sudo apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386


Reboot to apply changes.

_Note: Only Ubuntu 18.04 and higher is supported for AMD and Intel graphics._

_Note for Intel integrated graphics users: Only Skylake, Kaby Lake, and Coffee Lake offer full Vulkan support. Broadwell, Haswell and Ivy Bridge only offer partial support, which may not work with a lot of games. Sandy Bridge and older lack any Vulkan support whatsoever._

## Arch / Manjaro / Other Arch derivatives:

First, enable multilib.

To enable multilib repository, uncomment the `[multilib]` section in `/etc/pacman.conf`

<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;">/etc/pacman.conf
--------------------------------------------------------------------------------------
[multilib]
Include = /etc/pacman.d/mirrorlist</pre>

Then upgrade the system `sudo pacman -Syu`.

### Nvidia:

_**Warning**: Please ensure your graphics card is supported by modern Nvidia driver before installing._
_For a list of supported GPUs click here: https://www.nvidia.com/Download/driverResults.aspx/149138/en-us_

Proprietary driver and support for Vulkan are required for proper functionality of games.

To install it, execute following command:

    sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader

### AMD

To install support for Vulkan API  (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)) and 32-bit games, execute following command:

    sudo pacman -S lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

### Intel

To install support for Vulkan API  (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)) and 32-bit games, execute following command:

    sudo pacman -S lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

_Note: Only Skylake, Kaby Lake, and Coffee Lake offer full Vulkan support. Broadwell, Haswell and Ivy Bridge only offer partial support, which may not work with a lot of games. Sandy Bridge and older lack any Vulkan support whatsoever._

## Fedora (Incomplete Guide)
*Note: Dnf will pull most, if not all, AMD/Intel drivers with an install of Lutris, Wine, and/or Steam. Unless on an NVIDIA card, the following guide may be redundant.*

To install support for Vulkan API (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility) and driver), execute following command:

    sudo dnf install vulkan-loader vulkan-loader.i686

### Nvidia:

_**Warning**: Please ensure your graphics card is supported by modern Nvidia driver before installing._
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
    
### NVidia

The closed source NVidia dirver is not available by default.
Please check which NVidia GPU you have and run one of the following One-Click Installers.

Those will then add the required official NVidia driver repository from https://download.nvidia.com/opensuse/ and install the required nvidia driver package.

#### Geforce 600 series and later

[Supported products](https://www.nvidia.com/Download/driverResults.aspx/162107/en-us)

[One Click Installer](https://opensuse-community.org/nvidia_G05.ymp)

#### Geforce 400 series and later

[Supported producs](https://www.nvidia.com/Download/driverResults.aspx/142567/en-us)

[One Click Installer](https://opensuse-community.org/nvidia_G04.ymp)


For Vulkan support on NVidia drivers also run:

    sudo zypper in libvulkan1 libvulkan1-32bit
