# Apitracing a game

This guide in detail describes how to create an [apitrace](https://apitrace.github.io/) capture of a game, which can be very useful for debugging purposes.

## On Linux

* Check whether the game is 64-bit or 32-bit.

To determine that on Linux, use the `file` command on the game's exe in the terminal,
> file /path/to/executable/program.exe

where `/path/to/executable/` is the actual location of the game's EXE file and `program.exe` is its actual name.

If the game is **32-bit**, you will see this in the output:
> PE32 executable (GUI) Intel 80386, for MS Windows

And if it's **64-bit**, you will get this instead:
> PE32+ executable (GUI) x86-64, for MS Windows

* Open `winecfg` and add a `native,builtin` override for `d3d9`, `d3d11` and `dxgi.dll`. Here's a GIF that showcases the process:

![](/assets/1.gif)

* Download prebuilt apitrace files:

If the game is **32-bit**
>https://github.com/apitrace/apitrace/releases/download/10.0/apitrace-10.0-win32.7z

And if it's **64-bit**
>https://github.com/apitrace/apitrace/releases/download/10.0/apitrace-10.0-win64.7z

* Extract the archive. 
* Now you have to copy the appropriate `d3d9.dll`, `d3d11.dll`, `dxgi.dll` and `dxgitrace.dll` files.

If the game is **32-bit**, choose the files located in:
>apitrace-10.0-**win32**/lib/wrappers

And if it's **64-bit**, choose the file located in:
>apitrace-10.0-**win64**/lib/wrappers

* Now copy those DLL files into **the same folder as the game's .EXE**.
* Before the next step, make sure you disable or get rid of DXVK files first, as it's preferred that you use WineD3D to make an apitrace.
* However, if WineD3D doesn't work, you may use apitrace in combination with DXVK as long as DXVK dlls are located in the Windows/system32 (64-bit libraries) and Windows/syswod64 (32-bit libraries). Yes, this is not a mistake, 64-bit libraries go into system32.
  This is just how Windows/Wine works.
* Make sure to mention the backend you used (WineD3D or DXVK) in your report.
* Launch the game and try to reproduce your issue as fast as possible, then exit the game after that (using ALT+F4 is fine).
* Locate the `.trace` file. If you've done everything correctly, in Wine, you can usually find it in `/path/to/prefix/drive_c/users/USERNAME/Desktop`, where `/path/to/prefix` is the location of your Wine prefix and `USERNAME` is your username in the system.
  It will have the name of the game's .exe, but use the `.trace` extension.
* A properly generated trace should have the size of at least a few hundred megabytes (or at least one hundred or so if the game is very simple).  Quite often it's a few gigabytes.
  If the size is way less than that (by a few bytes or kilobytes) and/or the game crashed during the tracing process, then it most likely means it's not really traceable, at least on Linux. Make sure you mention this.
* However, in some rare instances, apitrace is able to capture at least a single frame of the game, resulting in a `.trace` that has a size of few megabytes or a few hundred kilobytes. In some rare instances, it could be enough to reproduce something like a crash on launch.
  In that case, attaching such a file to your report won't hurt, but make sure to mention the size.
* Compress the `.trace` file (preferably in a common file format with good compression, something like `.tar.xz` or `.7z`) and share it using a *common* file sharing service like Google Drive or Mega. **Don't** use temporary file sharing services,
  as the link to the file may expire before the person it was made for can download it. Additionally, don't remove the `.trace` file from your cloud storage until the issue is resolved and closed.

## On Windows

If you have access to Windows, it's best that you perform the tracing on it rather than on Linux.

* Check whether the game is 64-bit or 32-bit. 

To do that on Windows, right-click on the executable file you want to check, select “Properties”, then click the tab “Compatibility”.
 
If you see older Windows versions in that menu, like "Windows 98", then the game is **32-bit**.

If the first Windows version in the list is "Windows Vista", then it means the game is **64-bit**.

**_Please do not set the application to the compatibility mode before tracing!_**

![](https://cdn.discordapp.com/attachments/545938151739228191/604369144892358667/compatibility-check.png)

* Download prebuilt apitrace files:

If the game is **32-bit**:
>https://github.com/apitrace/apitrace/releases/download/10.0/apitrace-10.0-win32.7z

And if it's **64-bit**:
>https://github.com/apitrace/apitrace/releases/download/10.0/apitrace-10.0-win64.7z

* Extract the archive. 
* Now you have to copy the appropriate `d3d9.dll`, `d3d11.dll`, `dxgi.dll` and `dxgitrace.dll` files.

If the game is **32-bit**, choose the files located in :
>apitrace-10.0-**win32**/lib/wrappers

And if it's **64-bit**, choose the file located in:
>apitrace-10.0-**win64**/lib/wrappers

* Now copy those DLL files into **the same folder as the game's .EXE**.
* Launch the game and try to reproduce your issue as fast as possible, then exit the game after that (using ALT+F4 is fine).
* The .trace file should be located on your Desktop.
* Locate the .trace file. If you've done everything correctly, in wine, you can usually find it on your Desktop. It will have the name of the game's .exe, but use the `.trace` extension.
* A properly generated trace should have the size of at least a few hundred megabytes (or at least one hundred or so if the game is very simple), quite often it's a few gigabytes.
  If the size is way less than that (like a few bytes or kilobytes) and/or the game crashed during the tracing process, then it most likely means it's is not really traceable. Make sure you mention this.
* However, in some rare instances, apitrace is able to capture only a single frame of the game, resulting in a `.trace` that has a size of few megabytes or a few hundred kilobytes. In some rare instances, it could be enough to reproduce something like a crash on launch.
  In that case, attaching such file to your report won't hurt, but make sure to mention the size.
* Compress the `.trace` file (preferably in a common file format with good compression, something like `.tar.xz` or `.7z`) and share it using a *common* file sharing service like Google Drive or Mega. **Don't** use temporary file sharing services, as the link to the
  file may expire before the person it was made for can download it. Additionally, don't remove the `.trace` file from your cloud storage until the issue is resolved and closed.
