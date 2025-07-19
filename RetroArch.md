# [RetroArch](https://www.retroarch.com/)

## Setting up BIOS files

Some Libretro cores require optional or mandatory BIOS files to run as expected (or at all). Some of these cores include `Playstation` or Dreamcast related cores.

For a clear idea of which files are needed please consult `Libretro`'s extensive [BIOS Information Hub](https://docs.libretro.com/library/bios/).

### Correct location
As of Lutris __v0.5.20__, when using `Libretro` from `Lutris`, these files are no longer searched in user's home directory (.i.e: `~/.config/retroarch/system`).

Instead, `Lutris` will search in its `Libretro` runner files under: `~./local/share/lutris/runners/retroarch/system`.

### Example
For example, if [BIOS Information Hub](https://docs.libretro.com/library/bios/) mentions that you need these BIOS files for a `Playstation` core:
```text
scph5500.bin 	PS1 JP BIOS - Required for JP games 	8dd7d5296a650fac7319bce665a6a53c
scph5501.bin 	PS1 US BIOS - Required for US games 	490f666e1afb15b7362b406ed1cea246
scph5502.bin 	PS1 EU BIOS - Required for EU games 	32736f17079d0b2b7024407c39bd3050
```

This means that these files must be installed (by you) as:
```text
`~./local/share/lutris/runners/retroarch/system/scph5500.bin`
`~./local/share/lutris/runners/retroarch/system/scph5501.bin`
`~./local/share/lutris/runners/retroarch/system/scph5502.bin`
```

### Path must be exact

Be careful to create additional directories under the `system` directory when needed. For example, if [BIOS Information Hub](https://docs.libretro.com/library/bios/) lists these BIOS files for a `Dreamcast` core:

```text
dc/dc_boot.bin 	Dreamcast BIOS - Required for Dreamcast
dc/naomi.zip 	NAOMI BIOS from MAME - Optional
dc/hod2bios.zip NAOMI The House of the Dead 2 BIOS from MAME - Optional
dc/f355dlx.zip 	NAOMI Ferrari F355 Challenge (deluxe) BIOS from MAME - Optional
dc/f355bios.zip NAOMI Ferrari F355 Challenge (twin/deluxe) BIOS from MAME - Optional
dc/airlbios.zip NAOMI Airline Pilots (deluxe) BIOS from MAME - Optional
dc/awbios.zip 	Atomiswave BIOS from MAME - Optional
dc/naomi2.zip 	NAOMI 2 BIOS from MAME - Optional
dc/segasp.zip 	System SP BIOS from MAME - Optional
```

You'll need to first create the __system/dc__ directory:
```
mkdir -p ~./local/share/lutris/runners/retroarch/system/
```

And then place the needed files so they look like this:
```
~./local/share/lutris/runners/retroarch/system/dc/dc_boot.bin
~./local/share/lutris/runners/retroarch/system/dc/dc/naomi.zip
```

Without the `dc/` directory, the files would not be detected.

## Important notes
### Retroarch vs. Lutris locations
To avoid any confusion please consider that the location where these files are searched for when running a `Libretro` core via `Lutris` is __NOT__ influenced by the following Lutris setting: __Preferences > Storage > Emulator BIOS files location__.

This setting is used by (some) other runners, usually standalone emulators.

For example, if running __Beetle PSX HW__ core from your regular system wide `Retroarch`, BIOS files will be searched under `~/.config/retroarch/system/` as usual, while running the same core from Lutris will search under `~./local/share/lutris/runners/retroarch/system/`.

This allows to prevent interferences between `Retroarch` and `Lutris`,  as `Lutris` deploys its own `retroarch` directory when the runner is activated via the UI, and can include different files, settings, versions etc.

### Share the same BIOS files in Retroarch and Lutris

Of course, it's still possible to share the same directory of BIOS files for both Retroarch and Lutris, in you want to.

Once the Libretro runner is activated in Lutris, you can simply delete the default empty __system__ and replace it by a symbolic link to `Retroarch`'s one:

```
rmdir ~./local/share/lutris/runners/retroarch/system/
cd ~./local/share/lutris/runners/retroarch/
ln -s ~/.config/retroarch/system .
```

### Where to find BIOS files ?
Many of the referenced BIOS files are proprietary and projects like Lutris and Libretro will not provide any indication on how to obtain them.

You shouldn't ask for this on these projects forums and discords either.

## Learning more about Libretro / Retroarch

- The Retroarch website is at:
[RetroArch](https://www.retroarch.com/)

- Libretro website is at:
[Libretro](https://www.libretro.com/)
  - For a list of Emulation cores with specific details, check their __Core Library: Emulation__ section (under `For users` section, in the left menu).

