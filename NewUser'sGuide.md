# New User’s Guide to Lutris

Welcome to Lutris, [a game library manager](https://github.com/lutris/lutris) that allows you to bring your entire game collection together regardless of platform.

This is a guide for new users that are just starting out with Lutris. Once you have [installed the Lutris client](https://lutris.net/downloads) for your distribution, [updated your Nvidia and AMD/Intel drivers](https://github.com/lutris/docs/blob/master/InstallingDrivers.md) and while not a requirement, it is recommended to have a [recent version of WINE](https://github.com/lutris/docs/blob/master/WineDependencies.md) to pull in all the required dependencies. After that, you’ll be ready to go on your Lutris journey.

## Installing a Game

In Lutris, there are many ways to install games from your game collections. For this guide, it will only concentrate on installing a game from a Source.

### Configuring your Sources

Under **Sources** on the left-hand side of the client, you’ll find a list of all the Sources you currently have enabled. Clicking one shows all the games that are available from that particular Source.

**Lutris Source**

The **Lutris** source displays all of the games you have registered in your [Lutris.net](https://lutris.net/) library and allows you to search for any Community Installers that are available for a particular game. Both of these options are placed in tabs at the top of the client after selecting the source.

**Local Source**

The **Local** source displays all of your native Linux games.

**GOG Source**

The **GOG** source lists every game in your [GOG](https://www.gog.com/) library.

**Humble Bundle Source**

The **Humble Bundle** source shows all the games in your [Humble Bundle](https://www.humblebundle.com/) library.

**Epic Games Store Source**

The **Epic Games Store** source will exhibit every game in your [Epic Games Store](https://www.epicgames.com/store/en-US/) library.

**Note – for GOG, Humble Bundle and the Epic Games Store, you have to log into the appropriate source via the connect button that appears after hovering over the source itself, otherwise none of the games linked with the associated source are displayed.**

**Steam**

Once you have the native Linux Steam client installed on your distribution and logged in successfully, all of your Steam games (regardless of platform), will appear here.

**Steam for Windows Source**

The Steam for Windows source lists every Steam game available in your library, run via the Wine Steam Runner. This option is available, in case you do not wish to use the native Linux Steam client with Proton.

**The Lutris team [has said](https://twitter.com/LutrisGaming/status/1454539182647377920) that integration for Steam for Windows will be removed, whilst leaving the Wine Steam Runner for those who still wish to use it.**

### Installation of a Game from a Source

Installing games from a Source is usually straightforward with Lutris.

1. Select a Source, then the game you wish to play and click the "Install" button at the bottom of the client. 
2. Lutris will then open a dialogue box and offer you some options for installation (downloading the base game, additional audio files, mods and much more). Depending on the Source used, the options presented will vary.
3. Once you click the "Install" button in the dialogue box, Lutris will handle the rest for you. For example. this includes downloading and running the installer for GOG games (with any associated community written installers for additional configuration) or for a Steam game, opening your Steam client, downloading the game and closing the client when the installation is done.

## Lutris Settings Menu

To open the menu, click the “Context Menu” button (the one with three lines stacked on top of each other) in the top right-hand corner of the client and then click “Preferences”. These are the options available to you:

**Interface**

- **Minimize client when a game is launched** - minimises the Lutris client whenever any game is ran.
- **Hide text under icons (requires a restart)**
- **Show Tray Icon (requires restart)** - places a little Lutris icon in your system tray to easily run your games with.
- **Use dark theme (requires dark theme variant for Gtk)** - sets the client into dark mode for those with a preference for dark themes.

**Runners**

Here, you can add, remove and configure all of the Runners available for Lutris.

The “Download” button downloads and installs the Runner, while the “Cog” button opens up the individual settings for each runner. Any settings configured here affect all games globally (unless the Runner’s settings are changed in a specific game’s configuration).

As of writing (14th December, 2021), the current list of Runners are:
- **Adventure Games Studio** - a graphical adventure engine.
- **Atari800** - an Atari 400, 800 and XL emulator.
- **Citra** - a Nintendo 3DS emulator.
- **Colem** - a ColecoVision and Coleco Adam emulator.
- **Desmume** - a Nintendo DS emulator.
- **DGen** - a Sega Genesis/Megadrive emulator.
- **Dolphin** - a GameCube and Nintendo Wii emulator.
- **DOSBox** - an MS-DOS emulator.
- **EasyRPG Player** - for RPG Maker 2000 and 2003 games.
- **Frotz** - a Z-code emulator for text adventure games.
- **FS-UAE** - an Amiga emulator.
- **Hatari** - an Atari ST emulator.
- **jzlntv** - an Intellivision emulator.
- **Libretro** - a cross-platform front-end interface for emulation suites such as RetroArch.
- **Linux** - for native Linux games and applications.
- **MAME** - Multiple Arcade Machine Emulator for arcade games.
- **Mednafen** - a multi-system emulator.
- **melonDS** - a Nintendo DS emulator.
- **MicroM8** - an Apple II emulator.
- **Mupen64Plus** - a Nintendo 64 emulator.
- **O2EM** - a Magnavox Odyssey 2 emulator.
- **Osmose** - a Sega Master System emulator.
- **PCem** - an IBM PC emulator.
- **PCSX2** - a PlayStation 2 emulator.
- **PICO-8** -  a fantasy (virtual) console.
- **PPSSPP** - a Sony PSP emulator.
- **Redream** - a Sega Dreamcast emulator.
- **Reicast** - another Sega Dreamcast emulator.
- **ResidualVM** - a 3D point-and-click adventure games engine.
- **RPCS3** - a PlayStation 3 emulator.
- **Ryujinx** - a Nintendo Switch emulator.
- **ScummVM** - for 2D point-and-click adventure games.
- **Snes9x** - a Super Nintendo emulator.
- **Speccy** - a Sinclair ZX Spectrum emulator.
- **Steam** - runs the Steam Linux client.
- **Stella** - an Atari 2600 emulator.
- **TIC-80** - a fantasy (virtual) computer for making, playing and sharing games with.
- **Vice** - a Commodore emulator.
- **Virtual Jaguar** - an Atari Jaguar emulator.
- **Web** - runs web games.
- **Wine** - runs Windows games and programs under a compatibility layer.
- **Wine Steam** - runs the Windows Steam client under Wine.
- **Yuzu** - another Nintendo Switch emulator.
- **ZDoom** - the ZDoom DOOM Game Engine.

**Services**

Enable or disable all of your Game Source integration here. Any sources enabled will appear under the **Sources** menu on the left-hand side of the client.

**Hardware information**

Provides an output of your current system’s hardware, including **System**, **CPU**, **Memory** and **Graphics**. It is very useful if you need to troubleshoot performance issues with games.

**Global options**

These settings are global and affect all the games in your library. However, you can change each setting on a game by game basis if you so prefer. 
- **Default installation folder** – the default place where you install your games.
- **Disable Lutris Runtime** – off by default. If switched on, Lutris will load some libraries that can cause incompatibilities with some games.
- **Prefer system libraries** – enabled by default and utilises the libraries that come with your system as opposed to the ones that Lutris provides.
- **Restore resolution on game exit** – disabled by default, but can be enabled if some games are not automatically restoring your native desktop resolution after exiting the game.
- **Disable screen saver** – enabled by default, so your system’s screen saver doesn’t interfere with the currently running game.
- **FPS counter (MangoHud)** – if you have [MangoHud](https://github.com/flightlessmango/MangoHud) installed to check your game’s FPS and more, set this option to Enabled with either Vulkan or OpenGL (depending on what Graphics API the game is using).
- **Enable Feral GameMode** – if you have [Feral Interactive’s GameMode](https://github.com/FeralInteractive/gamemode) installed to optimise your system for games, this option by default will be enabled. If GameMode is not installed, the option will be greyed out.
- **Enabled NVIDIA Prime Render Offload** – if you have the [latest NVIDIA drivers installed with a patched X.Org server](https://download.nvidia.com/XFree86/Linux-x86_64/470.63.01/README/primerenderoffload.html), a specific game can be ran on your Nvidia GPU, then return to your system’s power-saving Intel GPU once the game is closed. This is a great option if configured correctly for laptops with Nvidia Optimus.
- **Switch resolution to** – before a game starts, Lutris can change your desktop resolution to something that fits the game better. By default, Lutris runs the game at your native desktop resolution.
- **Environment variables** - enabling specific adjustments to things like translation layers such as DXVK can be applied here. For example, in the **Key** column, you can add ```DXVK_HUD``` and in the **Value** column, you can place ```frametimes``` to display a frametime graph in games that use DXVK.

**For more advanced users that are comfortable with playing around with their settings, check the “Show advanced options” box for even more options.**

## Context Menu

Right-clicking on any installed game in Lutris, provides the user with these options:
- **Play** – runs the game.
- **Show Logs** - opens a separate window and is useful for debugging purposes.
- **Configure** - allows you to edit different settings of the game.

Additionally, images (like a game’s artwork) can also be placed here for as a custom banner and icon, just click the boxes with the Lutris logo inside and choose your image. To remove any images, click the “brush” icon.

A game’s **Identifier** and **Directory** can also be changed here. Changing the directory is useful if you decide to move the game’s files to another location.

- **Add to favorites** - adds the game to the **Favorites** submenu on the left-hand side of the client under **Library**.
- **Browse files** - opens the directory where the game is installed in your chosen file manager.
- **Create desktop shortcut** - creates a nice shortcut on your desktop.
- **Create application menu shortcut** - places a shortcut for the game in your system’s application menu.
- **Install another version** - install a different version of the game through this option.
- **Remove** - this removes the game as Installed from your Library (including associated Play Time and other meta data), but does not delete any of the game’s files.
- **View on Lutris.net** - shows additional information about the game on [Lutris.net](https://lutris.net/) as well as if any community installers are available for it, what platform it is for, release date and more.
- **Hide game from library** - hides games you don’t want to see in your library. To view the game again, go to the Lutris Settings Menu and click “Show Hidden Games”. If you want to unhide the game permanently, follow the previous steps and right-click the game and select “Unhide game from library”.


## Navigating Your Library

### Library

**Games**

Under **Library** on the left-hand side, clicking **Games** will display all of the available games that are currently installed in your library.

**Recent**

Clicking **Recent** will display all of the games that you have played recently.

**Favorites**

Clicking **Favorites** shows you every game you have selected as your favourites, either via right-clicking the game in your library and selecting “Add to favorites” or the drop-down menu next to the game’s “Play” button at the bottom of the client and then selecting “Add to favorites”.

### Runners
Any runners you wish to use are placed on the left-hand side under **Sources**. To enable certain runners, open the Lutris Settings Menu → Runners and click the “Download” button to download and automatically install the Runner you wish to use.

Each Runner can be started by clicking the “Play” icon next to the Runner’s name. You can also open a Runner’s individual settings menu by clicking on the “Cog” icon.

### Platforms

Under the **Platforms** tab, all of your games are sorted by what platform they are for. For instance, selecting the Linux option lists all of the games that run natively on Linux and likewise clicking the Windows option lists all of the Windows native games that can be run using Wine.

### Search

To search for games, click the game source that you wish to search in (for example, **Local**) and type the game you wish to search for in the box at the top of the client..

### Organising and Viewing your Games Collection

**Change Library View**

To change the view of your collection, there is a “View” button (four squares inside of it) at the top right-hand corner of the client. By clicking this button, it is possible to change your game library from the Default Grid View to a List View. 

**List View Categories**

Inside the List View, you can sort your library by multiple categories:
- **Name**
- **Year**
- **Runner**
- **Platform**
- **Last Played**
- **Installed At**
- **Play Time**

You can find these options just under the “Search Games Bar” at the top of the client.

**Drop-down Menu**

On the right of the “View” button, is another button with an arrow pointing downwards. Clicking that will open a drop-down list with the following options:

- **Zoom** – how much you want to zoom in/out of your library. You can either focus on one particular game or zoom out to show a wider selection of games.
- **Sort Ascending** – sorts your games library by order of ascending first. This applies to each of the categories previously listed above.
- With the same options as stated above, you can sort your library by Name, Year, Runner, Platform, Last Played, Installed At and Play Time.

**Lutris Settings Menu Options**

On the top-right hand corner of the client is the Lutris Settings Menu. Clicking this also presents another drop-down list with the following options:

- **Installed Games Only** – shows all of the games you currently have installed in your Lutris library.
- **Show Hidden Games** – any games you have intentionally hidden, either via right-clicking an installed game in your library and selecting “Hide game from library” or the drop-down menu at the bottom of the screen next to the “Play” button and selecting “Hide game from library”.
- **Show Side Panel** – checking this option hides/shows the entire side panel on the left-hand side, giving you more space to view your game library if you so desire.

Other options available in the Lutris Settings Menu are links to the [Lutris Discord](https://discord.com/invite/Pnt5CuY), [Lutris Forums](https://forums.lutris.net/) and [ways to donate to the project](https://lutris.net/donate). Selecting the About Lutris option opens another window with the current version number, [links to the website](https://lutris.net/), [license details](https://www.gnu.org/licenses/gpl-3.0.html) and more.
