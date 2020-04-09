# What is DXVK?

[DXVK](https://github.com/doitsujin/dxvk) is a Vulkan-based compatibility layer for Direct3D 11. It allows running 3D applications on Linux using Wine.

For the current status of the project, please refer to the DXVK [wiki](https://github.com/doitsujin/dxvk/wiki).

## Requirements:

- Wine >= 3.10
- [Wine dependencies](https://github.com/lutris/lutris/wiki/Wine-Dependencies) - Wine Staging is recommended
- [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility) - Note for Intel iGPU users: Only Skylake, Kaby Lake, and Coffee Lake offer full Vulkan support. Anything older is only partial. Although some games might work nothing is guaranteed.
- [Driver supported by DXVK.](https://github.com/doitsujin/dxvk/wiki/Driver-support)
- [Vulkan loader, **both** 64-bit and 32-bit.](https://github.com/lutris/lutris/wiki/Installing-drivers#installing-vulkan)

## Installing Supported drivers:

To take advantage of DXVK and it's improved performance you ***must*** install a supported graphics driver and Vulkan dependencies.

**To learn how to do that, follow our guide here: _[Installing Drivers](https://github.com/lutris/lutris/wiki/Installing-drivers)_**

## D9VK and Custom DXVK

Watch the following videos on how to add, and use a custom DXVK version with Lutris.

Tutorial on how to add a custom DXVK version:

**Warning:** We advise you use async-enabled DXVK only with singleplayer games. We do not bear the responsibility should you be banned using async with multiplayer games. Use at your own risk.

<a href="https://youtu.be/X6Vk_J3p2KA" target="_blank"><img src="https://i.imgur.com/TZiyKTB.png" 
alt="Custom DXVK" width="640" height="360" border="10" /></a>

## Other information:

#### Common issues when using DXVK:

https://github.com/doitsujin/dxvk/wiki/Common-issues

#### DXVK YouTube Playlist:

https://www.youtube.com/playlist?list=PLghCwIBikt5hqXHHlKKkA_bertuvcwjgl

#### Available DXVK Lutris Installers\*:

https://lutris.net/games/?q=dxvk%3A+true&search-installers=on

_\*Disclaimer: Not all games listed are playable._
