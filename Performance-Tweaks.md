# Performance Tweaks

Test for yourself!! Some installers use some of the tweaks. You should always test what works best for your own system.

## Enable DXVK

DX11 translated into Vulkan, see [How to: DXVK](https://github.com/lutris/docs/blob/master/HowToDXVK.md).

## Enable Game Mode

Game Mode set your CPU governor to max performance while you are playing, and can improve FPS in some cases. It's automatically enabled for all your games when you have game mode installed on your system. The only thing to have in consideration is that you must install gamemode, and lib32-gamemode. If you can't install this libraries, make sure your operating system has multiarch (ubuntu) or multilib (arch linux) enabled. You need Lutris 0.4.23 or upper. More information available [here](https://github.com/FeralInteractive/gamemode).

## Frametime optimization

If your game feels laggy or stuttery, you can tweak its settings to make it run smoother. To better observe the effect of your settings, set the environment variable DXVK_HUD=frametimes. With this set, DXVK will overlay a frametime graph the next time you run your game. Note that this only works when your game is run using DXVK but that is the case for most Windows games on Lutris.
Now tweak the game's settings until:

- The difference between "MIN frametime" and "MAX frametime" is as small as possible. Ideally, the graph should look almost flat.
- You get a new frame about as often as your screen refreshes; ideally with a ~10% buffer (i.e. for a 60Hz screen you should aim for ~66FPS = ~15ms/frame). Having more FPS than that can reduce input lag further which can be important if your game is of competitive nature but, in more casual games, better visuals are usually preferrable.

Some settings you should have a look at in particular when you have stuttering problems are "V-Sync" and "Limit FPS":

- V-Sync makes every frame wait for the next refresh of your monitor, thus limiting your FPS precisely to your monitor's refresh rate and eliminating 'tearing' (when two or more frames are on the screen at the same time with visible seams between them). Though do note that this significantly increases button-to-pixel delay which can make your game feel less responsive.
- If adaptive sync is enabled in both your desktop environment and monitor, limiting FPS a few frames below your monitor's refresh rate ensures a tear-free experience at all times. Tweak this setting so that the frametimes are always _above_ than your monitor's refresh interval (i.e. >7ms for a 144Hz monitor).

## Changing Windows version

Sometimes games work different if they see a different Wine version set. Change it with "Wine Configuration".

## NVIDIA GPU only optimization

For NVidia users. Environment variables can be set per game in Configure > System Options > Environment variables. Latest driver for NVidia helps. Right now 396.54.06 (Vulkan Beta). Though latest driver could freeze if you get too much fps, and you have flipping enabled without vsync.

### \_\_GL_THREADED_OPTIMIZATION

This optimization has no effect with Vulkan games. Allow the NVidia driver to work multi threaded. This speeds up when the drivers has a lot to do, but when your CPU is filled to the max, it can lower fps. It is standard on when the driver thinks it can improve performance. You can set it to 1 to force it on, or 0 to turn it off.

### \_\_GL_SHADER_CACHE

Shaders have to be created on the fly on Linux, this gives stuttering. These shaders are stored in a cache. The NVidia cache has a maximum of 128mb shared across all games if you do not set anything. It is better to use a cache per game. Use **GL_SHADER_DISK_CACHE= 0 or 1 to disable / enable, and **GL_SHADER_DISK_CACHE_PATH=/path/to/location to set the location. This last option automatically enables the previous one.
