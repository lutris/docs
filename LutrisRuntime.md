## What is the Lutris runtime?

The runtime is a collection of libraries used to make running games in a more consistent manner across different Linux distributions. The libraries provided are commonly used by games and by the Lutris runners hence using it allows users to run binaries without having to worry about missing dependencies. This is specially handy to run 32bit games on a 64bit OS without having to install 32bit libraries system wide. 
Since they are often sources of conflict between different Linux distributions, low level libraries such as glibc, libstdc++ or OpenGL drivers are not included and are marked as [suggested dependencies](https://github.com/lutris/lutris/blob/master/debian/control#L31) when installing Lutris. Note that you will need to install 32bit OpenGL drivers independently (this depends on what graphics card you have).

The runtime is divided in several part, the first part is based off the Steam runtime but has quite a few libraries removed from it that are known to cause issues on some systems. The other part is the Lutris runtime which completes the Steam runtime by providing additional libraries or more recent versions of some of the removed Steam libraries. The Lutris runtime is built from Ubuntu 14.04 which is also the system used to build most of the runners provided by Lutris, reducing the risk of incompatibilities between the runners and the runtime. Some programs (such as the Dolphin emulator) require a more modern system to be built and are not compatible with the runtime, in those cases, you must provide the dependencies yourself.

The runtime is located at `~/.local/share/lutris/runtime` and is composed of three folders: lib32, lib64 and steam. The steam folder is also divided in 32 and 64bit parts. It is automatically updated when the Lutris client starts and does not depend on the version of the client you run. Any changes made to the runtime will be reverted after an update.

## Disabling the runtime

Some games or runners may be incompatible with the runtime and the application may crash when starting or complain about incompatible libraries. If you experience such issues, the first thing to try is disabling the runtime which can be done in several manners.

The runtime can be disabled for an individual game, for all games using a specific runner or globally, using the appropriate settings. Note that, like all other settings, runner specific settings take precedence over global settings and game settings take precedence over both runner and global settings.

If needed, you can also disable the runtime entirely by exporting an environment variable: 

<code>export LUTRIS_RUNTIME=0</code>

Using this method takes precedence over everything and nothing in Lutris will use the runtime regardless of  individual settings. This will also disable runtime updates so if you export this before running the client for the first time, the runtime will never be loaded.

## Debugging runtime issues ##

Distributing a set of libraries that work consistently across a wide variety of Linux distribution can be a hard task. We try to resolve problems as soon as they are detected but as distributions are constantly updated over time, we need as much input from everyone. Finding what library in the runtime causes a game to crash is usually very straightforward and can be done using a classic [bisection method](https://en.wikipedia.org/wiki/Bisection_method).

The first step is to identify which part of the runtime is causing problems. You can do so by renaming the different parts of the runtime (for example lib32 to lib32.bak). Keep in mind that restarting the Lutris client will trigger a runtime update and redownload a part if it is not found, having an empty folder with the correct name is enough to keep the runtime from re-downloading. It is not necessary to restart the client when you make changes to the contents of the runtime, starting the game again is enough.

Once you have located the offending part of the runtime, you can start putting back libraries in small increments until the game crashes again. When that happens, take the opposite route and remove small increments of libraries until the game doesn't crash. Repeat this process until you have found the library or libraries causing the issues.

Once this is done, please report an issue in the [buildbot issue tracker](https://github.com/lutris/buildbot/issues). Don't forget to include the distribution you're running and which video card and driver you are using. (The runtime usually has more problems with Mesa users).
