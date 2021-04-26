Although Lutris provides and uses its own Wine builds, we still recommend you install all of Wine's dependencies to ensure a working experience. The easiest way to get them is to install Wine system-wide through your package manager.

The version of Wine installed should not matter, it is not even required for Wine to be present as long as all dependencies are satisfied. Although, Lutris will display a warning message if it cannot detect an existing installation of Wine.

# Distribution-specific instructions

Below are a list of commands specific to your distribution. Please, follow them before asking for support.

## Ubuntu/Debian/Linux Mint/Ubuntu derivatives/Debian derivatives

Enable 32 bit architecture (if you haven't already): 

    sudo dpkg --add-architecture i386 

Download and add the repository key:

    wget -nc https://dl.winehq.org/wine-builds/winehq.key
    sudo apt-key add winehq.key

Add the repository:

|For this version: | Use this command:          
|------------------|--------------------------------
|Ubuntu 20.10      | sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ groovy main'
|Ubuntu 20.04      | sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
|Ubuntu 19.10      | sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ eoan main'
|Ubuntu 19.04      | sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ disco main'
|Ubuntu 18.10      | sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ cosmic main'
|Ubuntu 18.04<br>Linux Mint 19.x | sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
|Debian 10 Buster  | sudo apt install software-properties-common<br>sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/debian/ buster main'
|Debian 11 Bullseye| sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/debian/ bullseye main'

**Only for Ubuntu 18.04:**
Add SDL2 Backports PPA (for Faudio package):

    sudo add-apt-repository ppa:cybermax-dexter/sdl2-backport

Update packages:

    sudo apt-get update
    
Install Wine

    sudo apt-get install --install-recommends winehq-staging

If you receive this error: `The following packages have unmet dependencies`, execute following command instead:

For compatibility reasons, install these additional libraries:

>sudo apt-get install libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386


These libraries may be used by games, launchers, or applications. E.g. Origin, Battle.net, Uplay etc. It's good practice to install these in addition to Wine.

##  Arch/Antergos/Manjaro/Other Arch derivatives

Enable multilib:

To enable multilib repository, uncomment the `[multilib]` section in `/etc/pacman.conf`

<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;">/etc/pacman.conf
--------------------------------------------------------------------------------------
[multilib]
Include = /etc/pacman.d/mirrorlist</pre>

Upgrade your system:

    sudo pacman -Syu 

Execute the following command:

>sudo pacman -S wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt  lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader

Disclaimer: this may seem like a lot of libraries to install, but in order for games to install and work correctly, you will need them.

## Solus

Execute following command:

    sudo eopkg install wine wine-devel wine-32bit-devel winetricks
    
## Fedora

>Fedora offers two `wine` packages, both of which are versions of `wine-staging`. While `staging` is usually recommended for gaming and Lutris, other versions can be retrieved from [WineHQ Download](https://wiki.winehq.org/Download). The `wine` package will install *all* dependencies, which may be easier for less advanced users, but also includes some applications and libraries you will probably never use. The `wine-core` package ships with a more minimal installation of wine, but may require certain dependencies to be installed later on an app by app basis.

Execute following command:

    sudo dnf install wine
    
For a more minimal experience:

    sudo dnf install wine-core wine-core.i686

## Other distributions

To install Wine on other distributions, please, consult the [WineHQ Download](https://wiki.winehq.org/Download) page for more information.
