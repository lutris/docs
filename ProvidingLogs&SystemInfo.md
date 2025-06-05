# What we need to help you (TLDR):

1. The file created by running `lutris --submit-issue` in a terminal.
2. Output of `lutris -d`. Kill Lutris and run `lutris -d` through a terminal. Reproduce your problem and share the output.
3. Debug log of your game. [Output log can be found by clicking the log button on the right sidebar.](#obtaining-log-output-for-games)
4. Optionally, a screenshot of the issue.

Send your logs via https://paste.ubuntu.com or a similar service.

# Providing info

We cannot help you if you don't provide logs or your system information. Things like distro version, desktop environment, window manager, and graphics card/driver help us narrow down the issue you're having. To gather this information open up a terminal and run `lutris --submit-issue`.

We can't guess your problems from vague descriptions and/or screenshots alone. Adding a screenshot is fine, and sometimes helps to diagnose the problem, but that is usually only if we have seen the problem before.

When you're done gathering the information upload it to https://paste.ubuntu.com and post your link along with your issue to [our Discord server](https://discord.gg/Pnt5CuY) or the [Lutris forums](https://forums.lutris.net/).

## Lutris debugging output

If, for some reason, one of our installers fails to install properly you can acquire more information by using the debugging flag `-d`. Make sure Lutris isn't running and simply open a terminal with `lutris -d`. Share your log with us by using https://paste.ubuntu.com or any other similar service.

## Obtaining log output for games

Run your game until you encounter your issue. This generates a log which helps us narrow down your issue.

Logs can be found by clicking the log button on the right sidebar:

![](/assets/5.png)
![](/assets/6.png)

### Wine debugging output

Debugging output for Wine is disabled by default. This is to limit the amount of spam for a smoother gaming experience. You must enable output manually for Wine and Wine Steam games. If not, the log produced will be incomplete and provide little to no information.

![](/assets/debug.gif)

## Common Issues

The following are a list of common issues reported by Lutris users.

### Nvidia driver update

Issue:

    X Error of failed request: BadValue (integer parameter out of range for operation)
    Major opcode of failed request: 154 (GLX)
    Minor opcode of failed request: 3 (X_GLXCreateContext)
    Value in failed request: 0x0
    Serial number of failed request: 165
    Current serial number in output stream: 166

**Solution:** Recently updated Nvidia drivers require rebooting. If you ever see this after a driver update please restart your computer.

### Missing 32-bit Nvidia drivers

Issue:

    libGL error: No matching fbConfigs or visuals found
    libGL error: failed to load driver: swrast
    X Error of failed request: BadValue (integer parameter out of range for operation)
    Major opcode of failed request: 154 (GLX)
    Minor opcode of failed request: 3 (X_GLXCreateContext)
    Value in failed request: 0x0
    Serial number of failed request: 173
    Current serial number in output stream: 177

**Solution:** If you happen to see this error when launching a game the most likely cause for this is missing 32-bit drivers.

### Missing .NET for applilcation or game

Issue:

    Unhandled Exception:
    System.IO.FileNotFoundException: Could not load file or assembly 'PresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35' or one of its dependencies.
    File name: 'PresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'
    [ERROR] FATAL UNHANDLED EXCEPTION: System.IO.FileNotFoundException: Could not load file or assembly 'PresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35' or one of its dependencies.
    File name: 'PresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'

**Solution:** Install `dotnet472` via winetricks or if you're writing an installer (replace `$GAMEDIR` with `$GAMEDIR/prefix` if you're writing a WineSteam installer):

```
- task:
    app: dotnet472
    name: winetricks
    prefix: $GAMEDIR
```

### Wine rundll32.exe error

Issue:

<p align="center">
  <img src="/assets/7.png">
</p>

**Solution:** This happens whenever a prefix that has .NET installed is updated. It's safe to ignore.

### Missing or misconfigured Vulkan

Issue:

    "wine: Call from 0x7bc7d8a9 to unimplemented function vulkan-1.dll.vkGetInstanceProcAddr, aborting"

    Unhandled exception: unimplemented function vulkan-1.dll.vkGetInstanceProcAddr called in 32-bit code (0x7bc7d959).

**Solution:** [Install Vulkan 64 **and** 32 bit libraries/loaders.](https://github.com/lutris/docs/blob/master/InstallingDrivers.md#installing-vulkan)

