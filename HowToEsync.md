# What is Esync?

Esync removes wineserver overhead for synchronization objects. This increases performance for a lot of games, especially ones that rely heavily on multithreading.<br>
[A more detailed explanation can be found here](https://github.com/zfigura/wine/blob/esync/README.esync).

## How to check Esync compatibility

Systems using Systemd 240 and newer are already compatible with Esync.<br>
If you're unsure that your system is compatible, run the `ulimit -Hn` command. If the value printed is equal to or greater than 524288, then your system is Esync-compatible.

## How to make your system Esync compatible

If your system is not Esync-compatible (`ulimit -Hn`, which prints the limit for number of opened files for a process, prints a value lower than 524288, like 4096), you have 2 different methods of solving this problem.
Which method is preferable depends on the distribution currently in use. Applying both methods should have no negative side effect.

**Modifying Systemd configuration**<br> 
This method applies to Ubuntu and other systems using systemd. You (with root privileges or `sudo`) need to edit both `/etc/systemd/system.conf` and `/etc/systemd/user.conf` by adding `DefaultLimitNOFILE=524288`. If `DefaultLimitNOFILE=` already exists in both `system.conf` and `user.conf`, add `524288` after `=` and make sure to uncomment the line (remove the `#` in the beginning of the line) to make it functional.<br><br>
Once the files are edited, restart your computer for the changes to take effect. To verify if the limits were applied, run `ulimit -Hn` to see `524288` being reported.<br>

If the value printed still says something like 4096, try the ulimits method below.


**Modifying ulimits.conf**<br> 
On Linux distributions not using Systemd or distributions using pam-limits.conf (Arch Linux, Fedora, Solus,... ), you (with root privileges or `sudo`) need to edit `/etc/security/limits.conf`.<br>
Change `username` to your actual username. Once the file is edited, reboot for the changes to take effect, and verify by running `ulimit -Hn` to see the new limit (`524288`).

>      username hard nofile 524288

**Using Esync Wine builds**

Esync is enabled by default starting with Lutris 0.5.9 and all presently available Lutris Wine versions include Esync.
