Although Lutris provides and uses its own Wine builds, we still recommend you install all of Wine's dependencies to ensure a working experience. The easiest way to get them is to install Wine system-wide through your package manager.

The version of Wine installed should not matter, it is not even required for Wine to be present as long as all dependencies are satisfied. Although, Lutris will display a warning message if it cannot detect an existing installation of Wine.

# Distribution-specific instructions

Below are a list of commands specific to your distribution. Please, follow them before asking for support.

## Ubuntu/Debian/Ubuntu derivatives/Debian derivatives

To get all neccesary dependencies, you need to enable 32 bit architecture (if you haven't already), install Wine packages and other additional dependencies.
To do so in one command, copy and paste this into the terminal

    sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386

##  Arch/EndeavourOS/Manjaro/Other Arch derivatives

Enable multilib:

To enable multilib repository, uncomment the `[multilib]` section in `/etc/pacman.conf`

<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;">/etc/pacman.conf
--------------------------------------------------------------------------------------
[multilib]
Include = /etc/pacman.d/mirrorlist</pre>

Upgrade your system:

    sudo pacman -Syu 

Execute the following command:

```
sudo pacman -S --needed wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
```

Disclaimer: this may seem like a lot of libraries to install, but in order for games to install and work correctly, you will need them.

## Solus

Execute following command:

    sudo eopkg install wine wine-devel wine-32bit winetricks
    
## Fedora

>Fedora offers two `wine` packages, both of which are versions of `wine-staging`. While `staging` is usually recommended for gaming and Lutris, other versions can be retrieved from [WineHQ Download](https://wiki.winehq.org/Download). The `wine` package will install *all* dependencies, which may be easier for less advanced users, but also includes some applications and libraries you will probably never use. The `wine-core` package ships with a more minimal installation of wine, but may require certain dependencies to be installed later on an app by app basis.

Execute following command:

    sudo dnf install wine
    
For a more minimal experience:

    sudo dnf install wine-core wine-core.i686

## Other distributions

To install Wine on other distributions, consult the [WineHQ Download](https://wiki.winehq.org/Download) page for more information.
