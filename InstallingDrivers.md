# Installing Drivers

This is a guide on how to install the Vulkan drivers and tools on mainstream GNU/Linux distributions.

**Warning: this page is not 100% accurate, as we do not have all the knowledge for each and every distribution, so we are open in fixing every bits of issues you may encounter.**

## Table of contents

- [**Requirements**](#requirements) **IMPORTANT!**
- [Alpine](#alpine)
	- [Prerequisites](#prerequisites)
		- [Community repository](#community-repository)
		- [AMD](#amd)
		- [Intel](#intel)
		- [Nvidia](#nvidia)
- [Arch / Manjaro / Other Arch derivatives](#arch--manjaro--other-arch-derivatives)
	- [Prerequisites](#prerequisites)
		- [Multilib repository (Manjaro excluded)](#multilib-repository-manjaro-excluded)
		- [AMD](#amd-1)
		- [Intel](#intel-1)
		- [Nvidia](#nvidia-1)
- [Fedora](#fedora)
	- [Prerequisites](#prerequisites-2)
		- [AMD / Intel](#amd--intel)
		- [Nvidia](#nvidia-2)
- [Gentoo / Funtoo / Other Gentoo derivatives](#gentoo--funtoo--other-gentoo-derivatives)
	- [Prerequisites](#prerequisites-3)
		- [AMD](#amd-2)
		- [Intel](#intel-2)
		- [Nvidia](#nvidia-3)
- [NixOS](#nixos)
	- [Prerequisites](#prerequisites-4)
		- [AMD / Intel](#amd--intel-1)
		- [Nvidia](#nvidia-4)
- [openSUSE](#opensuse)
	- [Prerequisites](#prerequisites-5)
		- [AMD](#amd-3)
		- [Intel](#intel-3)
		- [Nvidia](#nvidia-5)
- [Ubuntu / Linux Mint / Other Ubuntu-based distributions](#ubuntu--linux-mint--other-ubuntu-based-distributions)
	- [Prerequisites](#prerequisites-6)
		- [AMD / Intel](#amd--intel-2)
		- [Nvidia](#nvidia-6)
- [Void](#void)
	- [Prerequisites](#prerequisites-7)
		- [AMD](#amd-4)
		- [Intel](#intel-4)
		- [Nvidia](#nvidia-7)

## **Requirements**

**Before reading through the page, you must ensure that your [GPU is capable of running in Vulkan.](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility)**

For more information about Vulkan, you can look at the [awesome-vulkan](https://github.com/vinjn/awesome-vulkan) project.


## Alpine

**||||--::CATEGORY_INCOMPLETE::--||||**

### Prerequisites

#### Community repository

To enable the `Community repository`, you will have to refer to the [Alpine wiki](https://wiki.alpinelinux.org/wiki/Enable_Community_Repository).

Then, choose your GPU's manufacturer:

- [AMD](#amd)
- [Intel](#intel)
- [Nvidia](#nvidia)

#### AMD

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
apk add mesa-vulkan-ati mesa-vulkan-layer vulkan-loader vulkan-headers
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).

#### Intel

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
apk add mesa-vulkan-intel mesa-vulkan-layer vulkan-loader vulkan-headers
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).

#### Nvidia

**||||--::INSTRUCTIONS_NEEDED::--||||**

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
apk add mesa-vulkan-layer vulkan-loader vulkan-headers
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).


## Arch / Manjaro / Other Arch derivatives

### Prerequisites

#### Multilib repository (Manjaro excluded)

To enable the `[multilib]` repository, you will have to refer to the [Arch wiki](https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib). This process does to require for Manjaro users as it is already enabled by default.

Then, upgrade the system by executing the following command as root:

```bash
pacman -Syu
```

Then, choose your GPU's manufacturer:

- [AMD](#amd-1)
- [Intel](#intel-1)
- [Nvidia](#nvidia-1)

#### AMD

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
pacman -S lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).

#### Intel

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
pacman -S lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).

#### Nvidia:

To install support for the Vulkan API and its tools, execute the following command as root:

To install them, execute the following command as root:

```bash
pacman -S nvidia nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).


## Fedora

**Note: this is specifically for Fedora 31. The installation process may be different for different versions of Fedora.**

### Prerequisites

#### AMD / Intel

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
dnf install vulkan-tools mesa-vulkan-drivers vulkan-loader vulkan-validation-layers
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).

#### Nvidia

To install support for the Vulkan API and its tools, execute the following command as root:

- enable the [RPM Fusion repository as well as its nonfree repository](https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/);
- [determine your GPU's model](https://rpmfusion.org/Howto/NVIDIA#Determining_your_card_model);
- [install the drivers for the appropriate model](https://rpmfusion.org/Howto/NVIDIA#Installing_the_drivers).

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
dnf install vulkan-tools mesa-vulkan-drivers vulkan-loader vulkan-validation-layers
```

**(Optional): during this installation, `DNF` will ask if the GPG fingerprint is correct. You can check if it is correct in [RPM Fusion's page](https://rpmfusion.org/keys) to make sure that the fingerprint you check matches your version of Fedora.**

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).


## Gentoo / Funtoo / Other Gentoo derivatives

### Prerequisites

#### AMD

If you are using an AMD GPU, you will have to read through the [AMD GPU Gentoo wiki](https://wiki.gentoo.org/wiki/Amdgpu) page before proceeding.

Then, to install support for the Vulkan API and its tools, execute the following command as root:

```bash
emerge --ask --verbose dev-util/vulkan-tools dev-util/vulkan-headers media-libs/vulkan-layers media-libs/vulkan-loader
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).

#### Intel

If you are using an Intel iGPU, you will have to read through the [Intel Gentoo wiki](https://wiki.gentoo.org/wiki/Intel) page before proceeding.

Then, to install support for the Vulkan API and its tools, execute the following command as root:

```bash
emerge --ask --verbose dev-util/vulkan-tools dev-util/vulkan-headers media-libs/vulkan-layers media-libs/vulkan-loader
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).

#### Nvidia

If you are using an Nvidia GPU, you will have to read through the [Nvidia-drivers Gentoo wiki](https://wiki.gentoo.org/wiki/NVIDIA/nvidia-drivers) page before proceeding.

Then, to install support for the Vulkan API and its tools, execute the following command as root:

```bash
emerge --ask --verbose dev-util/vulkan-tools dev-util/vulkan-headers media-libs/vulkan-loader
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).


## NixOS

**||||--::INSTRUCTIONS_NEEDED::--||||**
**||||--::LUTRIS IS BROKEN IN NIXOS::--||||**

### Prerequisites

#### AMD / Intel

#### Nvidia


## openSUSE

**Note: this _should_ apply in both openSUSE Leap and openSUSE Tumbleweed.** 

### Prerequisites

#### AMD

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
zypper install libvulkan_radeon libvulkan_radeon-32bit vulkan-tools vulkan-loader vulkan-headers vulkan-validationlayers
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).

#### Intel

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
zypper install libvulkan_intel libvulkan_intel-32bit vulkan-tools vulkan-loader vulkan-headers vulkan-validationlayers
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).

#### Nvidia

To install support for the Vulkan API and its tools, you will have to install its **proprietary** drivers first.

To install them, you will have to refer to the [openSUSE wiki](https://en.opensuse.org/SDB:NVIDIA).

Then, to install support for the Vulkan API and its tools, execute the following command as root:

```bash
zypper install vulkan-tools vulkan-loader vulkan-headers vulkan-validationlayers
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).


## Ubuntu / Linux Mint / Other Ubuntu-based distributions

**||||--::INSTRUCTIONS_NEEDED::--||||**

### Prerequisites

#### AMD / Intel

**If you have Ubuntu 19.10 or newer:**
Enable 32 bit architecture (if you haven't already):

```bash
dpkg --add-architecture i386 
```

Install support for 32-bit games:

```bash
apt install libgl1-mesa-dri:i386
```

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386
```

Reboot to apply changes.

#### Nvidia:

To get the latest Nvidia drivers it is necessary to add the [Proprietary GPU Drivers PPA](https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa):

```bash
add-apt-repository ppa:graphics-drivers/ppa
```

Enable 32 bit architecture (if you haven't already):

```bash
dpkg --add-architecture i386 
```

Update to refresh packages:

```bash
apt update
```

Install the 430.40 driver:

```bash
apt install nvidia-driver-430 libnvidia-gl-430 libnvidia-gl-430:i386
```

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
apt install libvulkan1 libvulkan1:i386
```

Reboot to apply changes.


**If you have Ubuntu 18.04 Bionic Beaver or Ubuntu 18.10 Cosmic Cuttlefish:**

Add [kisak-mesa PPA](https://launchpad.net/~kisak/+archive/ubuntu/kisak-mesa): 

```bash
add-apt-repository ppa:kisak/kisak-mesa
```

Enable 32 bit architecture (if you haven't already):

```bash
dpkg --add-architecture i386 
```

Upgrade your system:

```bash
apt update && apt upgrade
```

Install support for 32-bit games:

```bash
apt install libgl1-mesa-glx:i386 libgl1-mesa-dri:i386
```

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386
```

Reboot to apply changes.

_Note: Only Ubuntu 18.04 and higher is supported for AMD and Intel graphics._

_Note for Intel integrated graphics users: Only Skylake, Kaby Lake, and Coffee Lake offer full Vulkan support. Broadwell, Haswell and Ivy Bridge only offer partial support, which may not work with a lot of games. Sandy Bridge and older lack any Vulkan support whatsoever._



## Void

### Prerequisites

#### AMD

To install support for the Vulkan API and its tools, execute the following command as root:

```bash
xbps-install -S mesa-vulkan-radeon Vulkan-Tools Vulkan-Headers Vulkan-ValidationLayers vulkan-loader
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).

#### Intel

To install support for the Vulkan API and its tools, you will have to refer to the [Void Linux documentation](https://docs.voidlinux.org/config/graphics/intel.html?highlight=vulkan#intel-gpu).

Then, to install the Vulkan tools, execute the following commands as root:

```bash
xbps-install -S Vulkan-Headers Vulkan-ValidationLayers
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).

#### Nvidia

To install support for the Vulkan API and its tools, you will have to refer to the [Void Linux wiki](https://wiki.voidlinux.org/Proprietary_Video_Drivers).

Then, to install the Vulkan tools, execute the following commands as root:

```bash
xbps-install -S Vulkan-Headers Vulkan-ValidationLayers
```

Then, proceed to the [Lutris installation page](https://lutris.net/downloads/).
