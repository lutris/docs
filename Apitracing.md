# Apitracing a game
This guide in detail describes how to create an apitrace capture of a game, which can be very useful for debugging purposes.
## On Linux
* Check whether the game is 64-bit or 32-bit.

To determine that on Linux, use `file` command in the terminal:
> file /path/to/executable/program.exe

where `/path/to/executable/` is an an actual location of the game's EXE file and `program.exe` is its actual name.
If the game is **32-bit**, you will see this in the output
> PE32 executable (GUI) Intel 80386, for MS Windows

And if it's **64-bit**, you will get this instead:
> PE32+ executable (GUI) x86-64, for MS Windows

* Open `winecfg` and add a `native,builtin` override for `d3d9`, `d3d11` and `dxgi.dll`. Here's a GIF that showcases the process:

![Peek 2020-04-09 17-32](https://user-images.githubusercontent.com/10602045/78906537-29951b00-7a88-11ea-8142-3681f1ba8af0.gif)
* Download prebuilt apitrace files: https://people.freedesktop.org/~jrfonseca/apitrace/apitrace-msvc-latest.7z
* Extract the archive. 
* Now you have to copy the appropriate `d3d9.dll`, `d3d11.dll`, `dxgi.dll` and `dxgitrace.dll` files.

If the game is **32-bit**, choose the files located in 
>apitrace-msvc/**x86**/lib/wrappers

And if it's **64-bit**, choose the file located in
>apitrace-msvc/**x64**/lib/wrappers
* Now copy those DLL files into **the same folder as the game's .EXE**.
* Before the next step, make sure you disable or get rid of DXVK files first, as it's preferred that you use WineD3D to make an apitrace.
* Launch the game and try to reproduce your issue as fast as possible, then exit the game after that (using ALT+F4 is fine).
* Locate the .trace file. If you've done everything correctly, in wine, you can usually find it in `/path/to/prefix/drive_c/users/USERNAME/Desktop`, where `/path/to/prefix` is the location of your Wine prefix and `USERNAME` is your username in the system.
The file should have the size of at least a few hundred megabytes (or at least one hundred if the game is very simple), quite often it's a few gigabytes.
If the size is way less than that (like a few bytes or kilobytes) and/or the game crashed during the tracing process, then it means it's is not really traceable, at least on Linux. Make sure you mention this.
* Compress the .trace file (preferably in a common file format, something like `.tar.xz`) and share it using a *common* file sharing service like Google Drive or Mega. **Don't** use Firefox Send and other temporary file sharing services, as the link to the file may expire before the person it was made for can download it.

## On Windows
If you have access to Windows, it's best that you perform the tracing on it rather than on Linux.
* Check whether the game is 64-bit or 32-bit. 
To do that on Windows, right-click on the executable file you want to check, select “Properties”, then click the tab “Compatibility”.

If the first Windows version in the list is "Windows Vista", then it means the game is **64-bit**.
 
If you see older Windows versions in that menu, like "Windows 98", then the game is **32-bit**.
![](https://cdn.discordapp.com/attachments/545938151739228191/604369144892358667/compatibility-check.png)
* Download prebuilt apitrace files: https://people.freedesktop.org/~jrfonseca/apitrace/apitrace-msvc-latest.7z
* Extract the archive. 
* Now you have to copy the appropriate `d3d9.dll`, `d3d11.dll`, `dxgi.dll` and `dxgitrace.dll` files.

If the game is **32-bit**, choose the files located in 
>apitrace-msvc/**x86**/lib/wrappers

And if it's **64-bit**, choose the file located in
>apitrace-msvc/**x64**/lib/wrappers
* Now copy those DLL files into **the same folder as the game's .EXE**.
* Launch the game and try to reproduce your issue as fast as possible, then exit the game after that (using ALT+F4 is fine).
* The .trace file should be located on your Desktop.
* Locate the .trace file. If you've done everything correctly, in wine, you can usually find it in `/path/to/prefix/drive_c/users/USERNAME/Desktop`, where `/path/to/prefix` is the location of your Wine prefix and `USERNAME` is your username in the system.
The file should have the size of at least a few hundred megabytes (or at least one hundred or so if the game is very simple), quite often it's a few gigabytes.
If the size is way less than that (like a few bytes or kilobytes) and/or the game crashed during the tracing process, then it means it's is not really traceable, at least on Linux. Make sure you mention this.
* Compress the .trace file (preferably in a common file format, something like `.tar.xz`) and share it using a *common* file sharing service like Google Drive or Mega. **Don't** use Firefox Send and other temporary file sharing services, as the links the file may expire before the person it was made for can download it.
