# World of Warcraft
World of Warcraft works great in Linux. DX9 / OpenGL renderer for WoW are gone, you need to use DX11. DX11 to OpenGL in Wine(Staging) is slow, but if you use DXVK you will get great fps.

## Blizzard App
World of Warcraft is installed and updated by Blizzard App. It is advised to install World of Warcraft game data outside of the Wine Prefix, so that when you want to make a fresh install of the prefix, you can just delete and recreate without losing the game data.

### **IMPORTANT:** Dependencies need to be installed first
The installer for WoW actually installs Blizzard app. Make sure you have the dependencies listed on the page there installed: [Blizzard App](https://github.com/lutris/lutris/wiki/Game:-Blizzard-App). If you do not do this, you will not be able to install World of Warcraft.

## Config.wtf Tweaks
The following tweaks should be set in Config.wtf by hand. Some of them can be set with ```/console Option <value>```

### worldPreloadNonCritical 0
This reduces loading times when switching zones. Source: [Blue Post](https://us.battle.net/forums/en/wow/topic/20749718759?page=151#post-3014)

## Streaming Error (WOW51900322)
Is an issue with your WoW cache, replace it with a copy of a clean and working Windows cache. If you don't have windows, you could try to use this: https://github.com/Bromeego/WoW-Cache. (Old legion cache: https://github.com/1thumbbmcc/wowcache.)

## Blizzard App blurry texts
Go to winetricks and install Arial font

## Cursor reset to center after click
to game chat write `/console rawMouseEnable 1`, if rotate is block by screen, set `Lock Cursor to Window` (Interface -> Mouse)

## Some graphics problems (DXVK)
run game with additional command line argument `-d3d11`
