# Performance Tweaks
Test for yourself!! Some installers use some of the tweaks. You should always test what works best for your own system.

## Enable DXVK
DX11 translated into Vulkan, see [How to: DXVK](https://github.com/lutris/docs/blob/master/HowToDXVK.md).

## Enable Game Mode
Game Mode set your CPU governor to max performance while you are playing, and can improve FPS in some cases. It's automatically enabled for all your games when you have game mode installed on your system. The only thing to have in consideration is that you must install gamemode, and lib32-gamemode. If you can't install this libraries, make sure your operating system has multiarch (ubuntu) or multilib (arch linux) enabled. You need Lutris 0.4.23 or upper. More information available [here](https://github.com/FeralInteractive/gamemode).

## Frametimes optimization
If your game uses DXVK, you can tweak it to make it run smoother. You only need to set DXVK_HUD=frametimes. The next time you run your game you will see a frametimes graph. Now you can change the settings of your game until:

* The difference between "MIN frametime" and "MAX frametime" is as small as possible. Ideally, the graph should look almost flat.
* You get the same amount of FPS as your screen refresh rate + 5 (65FPS). Having more FPS than that has no effect at all.

This optimization solve most stuttering problems in any game. The most important options to tweak inside of the game are "Limit FPS" and "V-Sync".

## Changing Windows version
Sometimes games work different if they see a different Wine version set. Change it with "Wine Configuration".

## NVIDIA GPU only optimization
For NVidia users. Environment variables can be set per game in Configure > System Options > Environment variables. Latest driver for NVidia helps. Right now 396.54.06 (Vulkan Beta). Though latest driver could freeze if you get too much fps, and you have flipping enabled without vsync.

### __GL_THREADED_OPTIMIZATION
This optimization has no effect with Vulkan games. Allow the NVidia driver to work multi threaded. This speeds up when the drivers has a lot to do, but when your CPU is filled to the max, it can lower fps. It is standard on when the driver thinks it can improve performance. You can set it to 1 to force it on, or 0 to turn it off.
### __GL_SHADER_CACHE
Shaders have to be created on the fly on Linux, this gives stuttering. These shaders are stored in a cache. The NVidia cache has a maximum of 128mb shared across all games if you do not set anything. It is better to use a cache per game. Use __GL_SHADER_DISK_CACHE= 0 or 1 to disable / enable, and __GL_SHADER_DISK_CACHE_PATH=/path/to/location to set the location. This last option automatically enables the previous one.
## AMD GPU only optimization

### mesa_glthread
Similar to nvidia, set to "true" or "false", see: [Performance impact of Mesa_glthread](https://www.gamingonlinux.com/wiki/Performance_impact_of_Mesa_glthread)
