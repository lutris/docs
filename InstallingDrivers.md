
## Ubuntu

### NVIDIA:

To get the latest NVIDIA drivers it is necessary to add the [Proprietary GPU Drivers PPA](https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa):

    sudo add-apt-repository ppa:graphics-drivers/ppa

Enable 32 bit architecture (if you haven't already):

    sudo dpkg --add-architecture i386 

Update to refresh packages:

    sudo apt update

_**Warning**: Please ensure your graphics card is supported by the 450 driver before installing._
_For a list of supported GPUs click here: https://www.nvidia.com/Download/driverResults.aspx/163238/en-us

Install the 450 driver:

    sudo apt install nvidia-driver-450

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

First, enable the multilib repository by uncommenting the `[multilib]` section in `/etc/pacman.conf`

<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;">/etc/pacman.conf
--------------------------------------------------------------------------------------
[multilib]
Include = /etc/pacman.d/mirrorlist</pre>

Then upgrade the system `sudo pacman -Syu`.

### NVIDIA:

_**Warning**: Please ensure your graphics card is supported by a modern NVIDIA driver before installing._
_For a list of supported GPUs click here: https://www.nvidia.com/Download/driverResults.aspx/149138/en-us_

A proprietary driver and support for Vulkan are required for games to function properly. To install the driver package, run:

* `sudo pacman -S nvidia` if you are using the `linux` kernel package.
* `sudo pacman -S nvidia-lts` if you are using the `linux-lts` kernel package.
* `sudo pacman -S nvidia-dkms` if you are using a custom kernel package.

Then install the other necessary packages by running this command:

    sudo pacman -S nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader

### AMD

To install support for Vulkan API  (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)) and 32-bit games, execute following command:

    sudo pacman -S lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

### Intel

To install support for Vulkan API  (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)) and 32-bit games, execute following command:

    sudo pacman -S lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

_Note: Only Skylake, Kaby Lake, and Coffee Lake offer full Vulkan support. Broadwell, Haswell and Ivy Bridge only offer partial support, which may not work with a lot of games. Sandy Bridge and older lack any Vulkan support whatsoever._

## Fedora (incomplete guide)
*Note: Dnf will pull most, if not all, AMD/Intel drivers with an install of Lutris, Wine, and/or Steam. Unless on an NVIDIA card, the following guide may be redundant.*

To install support for Vulkan API (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility) and driver), execute following command:

    sudo dnf install vulkan-loader vulkan-loader.i686

### NVIDIA:

_**Warning**: Please ensure your graphics card is supported by modern NVIDIA driver before installing._
_For a list of supported GPUs click here: https://www.nvidia.com/Download/driverResults.aspx/149138/en-us_

A proprietary driver and support for Vulkan are required for games to function properly.  

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
