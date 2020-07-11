# Titanfall 2 on Linux

## Recommended fixes for common issues

- The game will get stuck in a minimized state when running in fullscreen mode and the user tries to switch to another application, usually with `alt+tab`. To fix this, you must add `-noborder` to the launch arguments in Origin before running the game.

- Running the game in windowed mode with v-sync options enabled will result in a non playable framerate, even in menus. To fix this, run the game in fullscreen, or disable v-sync which will cause the game to tear.

- The game will fail to launch if the Origin in game overlay is enabled, simply disable the overlay. Please note that the invite friends functionality in game will not work anymore. You will still be able to accept network invites and join other friends lobbies, but you will not be able to open your own.

- If the game immediately minimizes when launched, add `-noborder` to your Origin launch arguments for Titanfall 2.

## Unresolved issues

- Since the game does not launch with Origin in game overlay enabled, you will not be able to invite friends to your lobby. You are still able to join other open lobbies by clicking on join game in the Origin client itself. You can still create in game lobbies by creating a network invite that your friends will be able to join. However, the party will disband if you cancel the queue. Your lobby will be shown as open during the network invite joinable time period, however, friends will be unable to join via Origin friends list.

- The game will tear in windowed mode and in game v-sync options will cause the game to run at an unplayable framerate. Use fullscreen with `-noborder` as a workaround.