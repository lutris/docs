# Wine Builds

Lutris offers a variety of Wine builds that might offer better compatibility or performance in certain games.

You can find the sources for these builds here: [https://github.com/lutris/wine](https://github.com/lutris/wine)

### lutris
Prepared and built by [Tannis Root](https://github.com/tannisroot?tab=repositories) under Ubuntu 18.04.
Includes a lot of patches and improvements from Proton, including esync, clock monotonic patchset, fsync_ and other various patches. Depending on Wine version, it also occasionally fixes regressions that were introduced in the Wine version the `lutris` build is based on.
Patchnotes for these releases are available on [lutris/wine release page](https://github.com/lutris/wine/releases).

### lutris-fshack
Same as `lutris`, but includes **fshack**, a software implementation of monitor modesetting (resolution changing), ported over from Proton. With it, your whole monitor will no longer modeset to a lower resolution if the game requests it, instead Wine itself will do it and only do it for the game itself.
It may also improve fullscreen behavior for games that run in your native resolution, but results may way from game to game.
Additionally, due to fshack being quite big and modifying a lot of components, some fixes and patches that are used in normal `lutris` aren't compatible with it and thus missing.

## Deprecated builds

### ge-protonified
Prepared and built by [Glorious Eggroll](https://github.com/lutris/wine/commits?author=GloriousEggroll) under Ubuntu 18.04, unlike tkg builds, which used to be built under Ubuntu 16.04.
Includes majority of patches and improvements present in Proton, including fshack, esync, faudio and clock monotonic patchset, and other patches that were present in `tkg` builds. Depending on Wine version, it also occasionally fixes regressions that were introduced Wine release `ge-protonified` build is based against.

### ge-protonified-nofshack
Same as `ge-protonified`, but lacks fshack patches, which sometimes cause "clipping` raw input issues in certain games.

### tkg

This is the base build we offer. Made by [@Tk-Glitch](https://github.com/Tk-Glitch), it contains both the [Staging](https://github.com/wine-staging/wine-staging) and [esync](https://github.com/zfigura/wine/tree/esync) patchsets, as well as a few other utility patches such as the fix enabling Path of Exile to run in D3D11 mode. On older versions (3.16 and lower), you also can use the [PBA](https://github.com/acomminos/wine-pba) patchset, most useful for older D3D9 titles. 
This build also contains a patch to see the store page in the Steam client. All the builds beginning with "tkg" have all those patches.
 
### tkg-fo4

This builds contains a patch for a [Fallout 4 Direct Sound bug](https://bugs.winehq.org/show_bug.cgi?id=41271)
It also contains a patch to fix [Fallout 4 (and Skyrim) Script Extender](https://github.com/hdmap/wine-hackery/tree/master/f4se)
 
### tkg-nopulse - Deprecated

This build disables the staging pulseaudio patchset in wine, which fixes some sound issues on specific hardware and buggy Pulseaudio defaults of some distros. Your audio is glitchy whatever you've tried before? Give this build a go.
 
### tkg-protonified

This build uses the fullscreen patch from Proton to run older games at the native desktop resolution (For example, games running only at 800x600 will be stretched to the native resolution, without deforming the aspect ratio). On supported setups, this also disable the desktop compositor (Kwin, Mutter, Compton and possibly other compositors are compatible)
 
### tkg-sims2

Contains a fix for The Sim 2, [disables wined3d-WINED3D_RS_COLORWRITEENABLE and wined3d-Indexed_Vertex_Blending patchsets](https://bugs.winehq.org/show_bug.cgi?id=8051)
 
### tkg-starcitizen - Deprecated

Fixes [performance issues](https://bugs.winehq.org/show_bug.cgi?id=46252) in Star Citizen
 
### tkg-unity

Fixes [networking/downloading issues](https://bugs.winehq.org/show_bug.cgi?id=45546) with Unity games such as Magic The Gathering: Arena.
 
### tkg-oldnvidia-sims3

This build is only needed to play The Sims 3 on an [Nvidia graphics drivers older than 415.xx](https://bugs.winehq.org/show_bug.cgi?id=45361) 
 
### tkg-mwo

This build is only needed to play Mechwarrior Online (https://mwomercs.com/forums/topic/268847-running-the-game-on-ubuntu-steam-play/page__st__20__p__6195387#entry6195387)
 
### tkg-legacy

This build is based on Wine-Staging 3.18 to enable PBA usage, but comes with Proton fullscreen hack and compositor bypass, as well as the 3.21/4.0 python patches enabling The Sims 4 to run.
