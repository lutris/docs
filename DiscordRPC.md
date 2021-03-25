# Enabling Discord RPC for games under Wine/Proton

Since Wine doesn't offer a "native" interface for games running under it to connect to the Discord RPC listener on Linux, here's a short guide on how to make RPC work.

I used this method on Manjaro 20.2.1 'Nibia,' though it should work the same on all other distros too.

### Requirements

- [x] An internet connection
- [x] Wine/Proton already set up with winetricks/protontricks installed
- [x] [This tarball](https://github.com/Marc3842h/rpc-wine/releases/download/1.0.0/rpc-wine.tar.gz) by [Marc3842h](https://github.com/Marc3842h) 
- [x] A Terminal

### How-to

- Download the tarball and extract it to a folder. You can extract it anywhere, but I'll be using `/opt/discord-rpc`
- Make sure you have the bin64 and the bin32 folders in `/opt/discord-rpc`
- Open a terminal and append the locations of the bin64 and bin32 folders to the WINEDLLPATH environment variable using the following command ```export WINEDLLPATH=$WINEDLLPATH:/opt/discord-rpc/bin64:/opt/discord-rpc/bin32```
- Run winetricks/protontricks, select your wine prefix (default prefix if using proton), and run winecfg
- Head to the libraries tab, and add a new override for library by typing in `discord-rpc` and clicking add. Hit Apply, and then OK
- Run your game the way you usually would, and RPC should be working now

_Note: This has to be done for each game individually. There might be a way to set it up for all wineprefixes at once, but I'm not aware of how to do that._
