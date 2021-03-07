# Overwatch on Linux (Wine)

**_Note: The game won't work correctly if it was installed on an NTFS partition._**

### Wine dependencies
Wine dependencies are **required** for Overwatch to work. Please follow the instructions on [Wine Dependencies](https://github.com/lutris/docs/blob/master/WineDependencies.md) page to get them.

### DXVK dependencies
As the installer uses DXVK by default, please follow the instructions on this page: [How to: DXVK](https://github.com/lutris/docs/blob/master/HowToDXVK.md).<br>
Otherwise, the game **will not work**.

## Battle.Net
Blizzard Battle.Net will be installed when you run the Lutris Installer for Overwatch.<br> To make it work properly, make sure you follow to instructions on: [Blizzard App](https://github.com/lutris/docs/blob/master/Battle.Net.md) page before attempting to install Overwatch.

## Known unresolved issues

### Game issues

- Sometimes, the game will not detect your native resolution properly and fallback to something much lower, resulting in a blurry image and incorrect cursor position. To fix that, use arrows keys/spacebar/enter to access settings menu and change to your real resolution.

- On the first launch with DXVK version, the game may stutter A LOT and have way worse FPS. This is only temporary and is a result of DXVK building shader cache in advance (using Lutris-provided state cache file). Be patient and the performance will be back to normal.

- The stuttering may persist/reappear if you play with settings higher than Low or there was a release of new content. Just spectate your friends/play a bit and it will disappear.

- Highlights won't save (results in error). To workaround that, switch the format to WebM, as the issue is MP4 specific.

- If starting from Blizzard App crashes the game/you only see a black screen for quite a while now, you need to disable Streaming feature in Blizzard App

- If you find the game runs slow, set everything to LOW/OFF and set Render Scale to 100% or lower.


### GPU specific issues

- Intel iGPUs fail to launch Overwatch. To fix this you need to edit `Settings_v0.ini` manually. Open Lutris from a terminal `lutris` and grab your GPU vendor/device id. Using an i7-7500U as an example:

```
INFO     2019-02-19 18:43:38,415 [startup.check_driver:54]:Running Mesa driver 18.0.5 on Mesa DRI Intel(R) HD Graphics 620 (Kaby Lake GT2)  (0x5916)
INFO     2019-02-19 18:43:38,415 [startup.check_driver:64]:GPU: 8086:5916 17AA:224F using i915 drivers
```

The vendor id being `8086` and `5916` being the device id. Convert from hex into decimal:

```
echo $((0x8086)) $((0x5916))
32902 22806
```

Open `drive_c/users/$USER/My Documents/Overwatch/Settings/Settings_v0.ini` and add:

```
[GPU.6]
GPUDeviceID = "22806"
GPUName = "Intel(R) HD Graphics 620"
GPUScaler = "70.000000"
GPUVendorID = "32902"
```

- On Vega cards, the hair on characters may appear broken. [Example](https://i.imgur.com/RmWCuCs.jpg). This is caused by an issue in LLVM 7.0. Simply update to `mesa-git` and LLVM 8.0.

- To reduce input lag on Nvidia cards add vblank_mode=0 to System options. With `vblank_mode` being the key and `0` the value.
