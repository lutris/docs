## PlayStation Emulation

Libretro offers 3 different cores to emulate Playstation games.

* PCSX Rearmed: This core offers basic emulation with no advanced features. It can fallback to an emulated BIOS if none is found but it is still recommended to provide a BIOS for compatibility reasons.
* Beetle PSX: This core offers more precise emulation compared to PCSX but will require a valid BIOS file.
* Beetle PSX HW: This is like the Beetle PSX core but with advanced rendering options. This core will give you the best visual results.

### Setting up BIOS files

Playstation BIOS files have to be placed in RetroArch's system directory (by default: `~/.config/retroarch/system`).
Make sure the files are correctly named and have the correct MD5 sum. The list below gives you the supported BIOS files and their checksums.

```
scph5500.bin 	PS1 JP BIOS - Required for JP games 	8dd7d5296a650fac7319bce665a6a53c
scph5501.bin 	PS1 US BIOS - Required for US games 	490f666e1afb15b7362b406ed1cea246
scph5502.bin 	PS1 EU BIOS - Required for EU games 	32736f17079d0b2b7024407c39bd3050
