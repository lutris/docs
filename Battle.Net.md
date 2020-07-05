# Battle.Net
Battle.Net is the game launcher for Blizzard and Activision games.<br>

## Important Note! 
**_Battle.Net won't work correctly if it was installed on an NTFS partition. Please choose an Ext4 drive as destination instead._**

## Dependencies for Battle.Net

### Wine dependencies
Wine dependencies are **required** for Overwatch to work. Please follow the instructions on [Wine Dependencies](https://github.com/lutris/lutris/wiki/Wine-Dependencies) page to get them.

### DXVK dependencies
As Battle.Net is a D3D11 app, and some installers use DXVK by default, it's required to install dependencies and right drivers for it. For instructions, refer to [How to: DXVK](https://github.com/lutris/lutris/wiki/How-to:-DXVK).<br>
Otherwise, Battle.Net **may not work**.

### Additional dependencies required specifically for Battle.net:
These dependencies may already be installed on your system, but it won't hurt to ensure you have them.
* Ubuntu: `libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libsqlite3-0:i386`
* Arch: `lib32-gnutls lib32-libldap lib32-libgpg-error lib32-sqlite lib32-libpulse`
* Fedora: `gnutls gnutls-devel openldap openldap-devel libgpg-error sqlite2.i686 sqlite2.x86_64` (Both i686 and x86_64 versions)
* Solus: `libgnutls libgnutls-devel libgnutls-32bit libgnutls-32bit-devel openldap-devel openldap-32bit-devel libgpg-error-devel libgpg-error-32bit libgpg-error-32bit-devel sqlite3 sqlite3-32bit`
* OpenSuse: `libgnutls.so.30 libgnutls-devel libgnutls.so.28 libldap libgpg-error` (Or libgpg-error.so.0)
* Gentoo: `gnutls libgpg-error sqlite app-crypt/p11-kit sys-libs/readline libusb`, all with `abi_x86_32` enabled.

##  Known issues and troubleshooting
Bugs, misconfigured systems and missing dependencies can sometimes cause issues with Battle.Net:

### The installer window does not show up, installation is stuck
Usually it's caused by missing wine dependencies, but sometimes it's a result of an unknown bug in KDE.
There are no known workarounds to this, so the only solution is to use another DE.

### The installer freezes at ~25% and then returns an error
This is caused by broken or missing installation of 32-bit `nvidia-utils` (or `mesa`). 

It's a very common problem among users who attemped to install Nvidia driver using `.run` file. To fix it, it's suggested to _completely_ reinstall your system and get drivers from repositories instead.

### We're having trouble launching the Blizzard Update Agent
Same issue as the previous one, caused by missing 32 bit `nvidia-utils` (or `mesa`).
Also may be caused by not rebooting after installing drivers.

### A required DLL could not be found
If the message appears when DXVK is in use, and it works with DXVK disabled, make sure you installed Vulkan correctly, including 32 bit packages.
If the issue persists, try removing Lutris's DXVK catalog in `.local/share/lutris/runtime/dxvk` (.local is a hidden folder inside your `Home` directory).

### Spinning Icon, no login buttons
Go to options for Battle.Net - disable hardware acceleration.

You might also have success if you try [deleting the app's cache directory](https://us.battle.net/support/en/article/34721), which will be in the wine prefix's `drive_c/ProgramData/` directory.

### Black screen when starting game
Go to options for Battle.Net- disable streaming

### Sleeping Agent / issues with installing / updating :
<details>
<summary>Click to view screenshots</summary>
<br>

Greyed out install button:

![](https://cdn.discordapp.com/attachments/288951868082749441/482531076712169472/unknown.png)

Blizzard Agent went to sleep:

![](https://i.imgur.com/ZJnpWRD.png)

</details>
<br>

Here is what you can try:
1. Use wine version 3.20 or newer.
2. Close Battle.Net fully and wait a bit until all its processes exit. But just in case, terminate Battle.Net, Agent.exe and wineserver with: 

`killall Agent.exe Battle.net.exe wineserver` 

Then, inside the prefix Battle.Net is installed in, find `drive_c/ProgramData` folder and delete `Battle.net`. Open Battle.Net again and wait a little bit, the error should disappear.

To restore your existing game installations  after this, simply open Settings>Game Install/Update and click "Scan for Games".

### It simply won't start
Try to change executable from `Battle.net Launcher.exe` to `Battle.net.exe`, and try again.

### Blizzard Error: The Application Encountered an unexpected error
This can be caused by bad fonts (for example, `all-repository-fonts` from AUR). Try removing them.<br><br>
It can also be caused by missing 32-bit Vulkan loader. Refer to [How-To:-DXVK](https://github.com/lutris/lutris/wiki/How-to:-DXVK) for instructions.

## Limit FPS in-game from Battle.Net
See: https://us.battle.net/support/en/article/32248

## 32-bit Nvidia
When you install the nvidia-driver package, it might not necessarily install the 32-bit libraries, which is a problem because Battle.net is a 32-bit app. Check your distribution's documentation for the correct packages.
