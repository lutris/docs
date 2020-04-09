## Ubuntu / Linux Mint / Other Ubuntu-based distributions:

### Nvidia:

To get the latest Nvidia drivers it is necessary to add the [Proprietary GPU Drivers PPA](https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa):

    sudo add-apt-repository ppa:graphics-drivers/ppa

Enable 32 bit architecture (if you haven't already):

    sudo dpkg --add-architecture i386 

Update to refresh packages:

    sudo apt update

_**Warning**: Please ensure your graphics card is supported by the 430 driver before installing._
_For a list of supported GPUs click here: https://www.nvidia.com/Download/driverResults.aspx/149138/en-us_

Install the 430.40 driver:

    sudo apt install nvidia-driver-430 libnvidia-gl-430 libnvidia-gl-430:i386

Install support for Vulkan API (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)):

    sudo apt install libvulkan1 libvulkan1:i386

Reboot to apply changes.

### AMD / Intel:

**If you have Ubuntu 19.10 or newer:**
Enable 32 bit architecture (if you haven't already):

    sudo dpkg --add-architecture i386 

Install support for 32-bit games:

    sudo apt install libgl1-mesa-dri:i386

Install support for Vulkan API (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)):    

    sudo apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386

Reboot to apply changes.

**If you have Ubuntu 18.04 Bionic Beaver or Ubuntu 18.10 Cosmic Cuttlefish:**

Add [kisak-mesa PPA](https://launchpad.net/~kisak/+archive/ubuntu/kisak-mesa): 

    sudo add-apt-repository ppa:kisak/kisak-mesa

Enable 32 bit architecture (if you haven't already):

    sudo dpkg --add-architecture i386 

Upgrade your system:

    sudo apt update && sudo apt upgrade

Install support for 32-bit games:

    sudo apt install libgl1-mesa-glx:i386 libgl1-mesa-dri:i386

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

    sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader

### AMD

To install support for Vulkan API  (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)) and 32-bit games, execute following command:

    sudo pacman -S lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

### Intel

To install support for Vulkan API  (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)) and 32-bit games, execute following command:

    sudo pacman -S lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

_Note: Only Skylake, Kaby Lake, and Coffee Lake offer full Vulkan support. Broadwell, Haswell and Ivy Bridge only offer partial support, which may not work with a lot of games. Sandy Bridge and older lack any Vulkan support whatsoever._

## Fedora (Incomplete Guide)

To install support for Vulkan API (will be functional only if you have a [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility) and driver), execute following command:

    sudo dnf install vulkan-loader vulkan-loader.i686
