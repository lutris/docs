# Titanfall 2 on Linux

## Recommended fixes for common issues

- The game will get stuck in a minimized state when running in fullscreen mode and the user tries to switch to another application, usually with `alt+tab`. To fix this, you must add `-noborder` to the launch arguments in Origin before running the game.

- Running the game in windowed mode with v-sync options enabled will result in a non playable framerate, even in menus. To fix this, run the game in fullscreen, or disable v-sync which will cause the game to tear.

- The game will fail to launch if the Origin in game overlay is enabled, simply disable the overlay. Please note that the invite friends functionality in game will not work anymore. You will still be able to accept and create network invites and join other friends lobbies, but to open your own lobby you will need to first open a private macth lobby (You don't need to start the private match). Once you are in the private match lobby, you can invite your friends and they can join you via Origin. After at least one person joined you can also go back to the normal multiplayer lobby. Your friends will still remain in your party.

- If the game immediately minimizes when launched, add `-noborder` to your Origin launch arguments for Titanfall 2.

## Unresolved issues

- The game will tear in windowed mode and in game v-sync options will cause the game to run at an unplayable framerate. Use fullscreen with `-noborder` as a workaround.
