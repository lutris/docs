# Running Native Games Inside a Flatpak Environment

When attempting to run native Linux games through Flatpak, you may encounter issues where games do not launch properly due to library dependencies.

# Workaround

One effective workaround is to use a `flatpak-host` to launch the game.

### Steps to follow:

1. Add a new game to lutris. 

2.Pick `Linux` as the runner.

3.Go to `Game options`

4.Fill in the places like so

Executable: `/usr/bin/flatpak-spawn`

Arguements: `--host /path/to/executable`

Working directory: `/usr/bin/`

5.It should look like this at the end

![image](/Lutris/assets/1.png)

6. Click **Save**, and your game should now launch successfully.


<!--
(Not sure about this part)
# Info about game folders

Your game might not launch if its in a folder that contains a space,comma,exclamation mark, and stuff of that nature.
/mnt/8073657c-f7f3-4c5d-bb7e-48e43b904ec0/Games/Alien/run.sh ✅
/mnt/8073657c-f7f3-4c5d-bb7e-48e43b904ec0/Games/Alien/Alien - Isolation Collection/run.sh ❌
-->
