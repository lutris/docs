# Disabling network access

### There are several ways of doing this.

# Approach 1: Blocking network access via a firewall (Recommended)

1. Install `opensnitch` (or a firewall like that) for your distribution (e.g. `sudo pacman -S opensnitch`)

2. Setup a rule for your runner (For this tutorial we'll be going with `ge-proton` )

3. Select `Reject` for the `Action`

4. Tick the `From this executable` checkbox and put the path to your runner

5. Set the `Duration` to `Always`

![](/assets/3.png)

6. Click `Save`

# Approach 2: Disconnecting from the internet

Configure these scripts as the start and stop scripts in Lutris. Don't forget to mark them as executable.

[DisableNetwork.sh](/scripts/DisableNetwork.sh)

[EnableNetwork.sh](/scripts/EnableNetwork.sh)

Enable `Wait for pre-launch script completion`

![](/assets/4.png)

# Approach 3: Using the native package with firejail

This only works with native lutris packages

1. Install `firejail` for your distribution (e.g. `sudo pacman -S firejail`)

2. Add this `firejail --noprofile --net=none` as a `Command Prefix` to your game

![](/assets/2.png)
