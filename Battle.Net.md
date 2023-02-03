# Battle.Net
Battle.Net is the game launcher for Blizzard and Activision games.<br>

## Important Note! 
**_Battle.Net won't work correctly if it was installed on an NTFS partition. Please choose an Ext4 drive as destination instead._**

## Dependencies for Battle.Net

### Wine dependencies
Wine dependencies are **required** for Overwatch to work. Please follow the instructions on [Wine Dependencies](https://github.com/lutris/docs/blob/master/WineDependencies.md) page to get them.

### Proper driver installation
Battle.net requires up-to-date, Vulkan capable graphics drivers.
For instructions on how to install them, refer to [How to: Installing Drivers](https://github.com/lutris/docs/blob/master/InstallingDrivers.md).<br>
Otherwise, Battle.Net **may not work**.

##  Known issues and troubleshooting
Bugs, misconfigured systems and missing dependencies can sometimes cause issues with Battle.Net:

### Login and Battle.net itself are extremely slow
Make sure your hostname resolves to 127.0.0.1 in your /etc/hosts file. The first line should be something like `127.0.0.1		localhost myhostname.localdomain myhostname` where myhostname is replaced by your actual hostname. You can get your hostname by launching the `hostname` command.

### The installer window does not show up, installation is stuck
Usually it's caused by missing wine dependencies, but sometimes it's a result of an unknown bug in KDE.
There are no known workarounds to this, so the only solution is to use another DE.

If you are behind a proxy, or behind a DNS Filter like PiHole, and your installation stalls with an "Object moved" error, whitelist `*.blizzard.com` and `*.battle.net` to allow agent installation. There is built-in telemetry that can cause the installation to fail, even with all the correct system dependecies.

### The installer freezes at ~25% and then returns an error
This is caused by broken or missing installation of 32-bit `nvidia-utils` (or `mesa`). 

It's a very common problem among users who attemped to install Nvidia driver using `.run` file. To fix it, it's suggested to _completely_ reinstall your system and get drivers from repositories instead.

### We're having trouble launching the Blizzard Update Agent
Same issue as the previous one, caused by missing 32 bit `nvidia-utils` (or `mesa`).
Also may be caused by not rebooting after installing drivers.

### A required DLL could not be found
If the message appears when DXVK is in use, and it works with DXVK disabled, make sure you installed Vulkan correctly, including 32 bit packages.
If the issue persists, try removing Lutris's DXVK catalog in `.local/share/lutris/runtime/dxvk` (.local is a hidden folder inside your `Home` directory).

If disabling DXVK doesn't work, it might be an issue with NTFS. Although NTFS is not recommended, the problem occurs due to how the Battle.net app checks for the required DLLs, which, for Windows, file names are case-insensitive, whereas for Linux, file names are case-sensitive. In other words, the app can't find the required DLLs because Linux treats those DLLs as case-sensitive and therefore the app won't launch.

To fix it, try renaming the following files in `drive_c/Program Files (x86)/Battle.net/Battle.net.xxxxx` (where xxxxx is the latest version you have installed):
- `msvcp140.dll` -> `MSVCP140.dll`
- `vcruntime140.dll` -> `VCRUNTIME140.dll`

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

If you're using an AMD GPU, try setting `radeon_icd.x86_64.json` in Lutris System preferences -> System options -> Vulkan ICD loader. Make sure to tick "Show advanced options".

### It simply won't start
Try to change executable from `Battle.net Launcher.exe` to `Battle.net.exe`, and try again.

### Blizzard Error: The Application Encountered an unexpected error
This can be caused by bad fonts (for example, `all-repository-fonts` from AUR). Try removing them.<br><br>
It can also be caused by missing 32-bit Vulkan loader. Refer to [How-To:-DXVK](https://github.com/lutris/docs/blob/master/HowToDXVK.md) for instructions.

## Limit FPS in-game from Battle.Net
See: https://us.battle.net/support/en/article/32248

## 32-bit Nvidia
When you install the nvidia-driver package, it might not necessarily install the 32-bit libraries, which is a problem because Battle.net is a 32-bit app. Check your distribution's documentation for the correct packages.
