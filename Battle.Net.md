# Battle.Net
Battle.Net is the game launcher for Blizzard and Activision games.<br>

## Important Note! 
**_Battle.Net won't work correctly if it was installed on an NTFS partition. Please choose an Ext4 drive as destination instead._**

## Dependencies for Battle.Net

### Wine / Proton Runner
* Modern Battle.Net versions require an up-to-date runner such as **GE-Proton (GE-Proton 9 or 11+)** or recent **Wine Staging**.
* **Avoid `wine-ge-8-26` on modern Linux kernels (6.8+)**: older Wine 8 builds trigger a known WineServer socket polling assertion crash (`complete_async_poll: Assertion 'output->count == signaled_count' failed`).

### Proper driver installation
Battle.net requires up-to-date, Vulkan capable graphics drivers.
For instructions on how to install them, refer to [How to: Installing Drivers](https://github.com/lutris/docs/blob/master/InstallingDrivers.md).<br>
Otherwise, Battle.Net **may not work**. Ensure both 64-bit and 32-bit graphics/Vulkan packages (e.g. `mesa-vulkan-drivers:i386`, `libgl1-mesa-dri:i386`) are installed since Battle.net and its Update Agent are 32-bit binaries.

## Known issues and troubleshooting
Bugs, misconfigured systems and missing dependencies can sometimes cause issues with Battle.Net:

### Login and Battle.net itself are extremely slow
Make sure your hostname resolves to 127.0.0.1. Edit `/etc/hosts` with `sudo nano /etc/hosts` and the first line should be something like `127.0.0.1		localhost myhostname.localdomain myhostname` where myhostname is replaced by your actual hostname. You can get your hostname by launching the `hostname` command. Do not touch the rest of the file and be careful with mistakes and typos as they can cause serious issues with your system.

### Blank / white login window or unresponsive UI
Modern Battle.net uses Chromium Embedded Framework (CEF) for its login and store interface:
1. **Add `WINE_SIMULATE_WRITECOPY=1`:**
   In Lutris, right click Battle.net -> **Configure** -> **System options** -> scroll down to **Environment variables**, click **Add**, and set `Key: WINE_SIMULATE_WRITECOPY` with `Value: 1`. This allows Wine to emulate Windows Copy-on-Write memory management required by Chromium.
2. **Keep Hardware Acceleration enabled:**
   Unless you lack working Vulkan drivers, do **not** disable hardware acceleration in modern Battle.net. Disabling hardware acceleration forces SwiftShader (CPU software rendering via ANGLE), which frequently deadlocks under Wine on Linux.
3. **Clear corrupt browser caches:**
   If the login screen is blank after a crash or runner update, terminate all processes and delete:
   * `<prefix>/drive_c/users/<user>/AppData/Local/CEF/`
   * `<prefix>/drive_c/users/<user>/AppData/Local/Battle.net/BrowserCaches/`
4. **DLL Overrides (AMD/Mesa):**
   In Lutris -> Configure -> Runner options -> DLL overrides, add `locationapi` with value `d` (disabled).

### Window flashes for a second and disappears / Starts minimized
Battle.net often defaults to minimizing directly to the Windows system tray:
1. Open `<prefix>/drive_c/users/<user>/AppData/Roaming/Battle.net/Battle.net.config` in a text editor.
2. Locate `"AutoStartMinimized"` and `"MinimizedOnStartup"`.
3. Set both values to `"false"`.

### The launcher exits immediately or Lutris "Stop" button doesn't work
In Lutris -> **Configure** -> **Game options**:
* Change **Executable** from `Battle.net Launcher.exe` to `Battle.net.exe`.
* `Battle.net Launcher.exe` is a small updater stub that exits after launching the main process; changing this allows Lutris to properly track the running application.

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

### Terminating stuck Battle.net processes
Because CEF renames helper processes in `/proc` to Chromium internal names (`CrBrowserMain`, `CrGpuMain`, `CrRendererMain`), a basic `killall Battle.net.exe` will leave zombie processes holding shared memory locks.
To cleanly shut down:
```bash
killall -9 wineserver wineserver64 Battle.net.exe Agent.exe 2>/dev/null
pkill -9 -f '\.exe' 2>/dev/null
rm -f /dev/shm/wine* /dev/shm/u1000-Shm*
```

### Sleeping Agent / issues with installing / updating:
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
1. Ensure you are using a modern runner (GE-Proton 9/11+ or Wine Staging).
2. Close Battle.Net fully, terminate lingering processes (see section above), and delete `<prefix>/drive_c/ProgramData/Battle.net`.
3. Open Battle.Net again. To restore your existing game installations after this, simply open Settings > Game Install/Update and click "Scan for Games".

### Blizzard Error: The Application Encountered an unexpected error
This can be caused by bad fonts (for example, `all-repository-fonts` from AUR). Try removing them.<br><br>
It can also be caused by missing 32-bit Vulkan loader. Refer to [How-To:-DXVK](https://github.com/lutris/docs/blob/master/HowToDXVK.md) for instructions.

## Limit FPS in-game from Battle.Net
See: https://us.battle.net/support/en/article/32248

## 32-bit Nvidia
When you install the nvidia-driver package, it might not necessarily install the 32-bit libraries, which is a problem because Battle.net is a 32-bit app. Check your distribution's documentation for the correct packages.
