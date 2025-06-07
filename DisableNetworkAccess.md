# Disabling network access

### There are several ways of doing this.

# Approach 1: Blocking network access via `flatpak-spawn`

This works only with the flatpak package

1. Right click your game and press `Configure`

2. Go to `System options` 

3. Scroll down and add the following as a `Command prefix` to your game

`flatpak-spawn --no-network`

![](/assets/flatpak-spawn.png)

# Approach 2: Blocking network access via a firewall (Recommended)

This works with all lutris packages

1. Install `opensnitch` (or a firewall like that) for your distribution (e.g. `sudo pacman -S opensnitch`)

2. Setup a rule for your runner (For this tutorial we'll be going with `ge-proton` )

3. Select `Reject` for the `Action`

4. Tick the `From this executable` checkbox and put the path to your runner

5. Set the `Duration` to `Always`

![](/assets/3.png)

6. Click `Save`

# Approach 3: Using the native package with firejail

This only works with native lutris packages

1. Install `firejail` for your distribution (e.g. `sudo pacman -S firejail`)

2. Add this `firejail --noprofile --net=none` as a `Command Prefix` to your game

![](/assets/2.png)
