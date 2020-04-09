# What is Esync?

Esync removes wineserver overhead for synchronization objects. This can increase performance for some games, especially ones that rely heavily on the CPU. [A more detailed explanation can be found here](https://github.com/zfigura/wine/blob/esync/README.esync).

## How to make your system ready for Esync

First step is to run the `ulimit -Hn` command. If the value printed is equal or greater to 524288 then you're all set, your system is ready to use Esync! If you are running Systemd 240 or later, this should already be the case.

There are 2 methods for increasing the maximum number of files open. Which method is preferable depends on the distribution currently in use. Applying both methods should have no negative side effect.

**Modifying Systemd configuration**<br> 
This method applies to Ubuntu and other systems using systemd (some systemd distros can also use the limits.conf method below). You (with root privileges or `sudo`) need to edit both `/etc/systemd/system.conf` and `/etc/systemd/user.conf` by adding `DefaultLimitNOFILE=524288`. If `DefaultLimitNOFILE=` already exist in both `system.conf` and `user.conf`, add `524288` after `=` and make sure to uncomment the line (remove the `#`) to make it functional.<br><br>
Once the files are edited, restart your computer for the changes to take effect. To verify if the limits were applied, run `ulimit -Hn` to see open files limit (it should report `524288`).<br>

If the value printed still says something like 4096, try the ulimits method below.


**Modifying ulimits.conf**<br> 
On Linux distributions not using Systemd or distributions using pam-limits.conf (Arch Linux, Fedora, Solus,... ), you (with root privileges or `sudo`) need to edit `/etc/security/limits.conf`.<br>
Change `username` to your actual username. Once the file is edited, reboot for the changes to take effect, and verify by running `ulimit -Hn` to see the new limit (`524288`).

>      username hard nofile 524288

**Using Esync Wine builds**

Use our `esync` or `tkg` wine versions (it's recommended to use latest versions):

![screenshot from 2018-10-22 02-04-54](https://user-images.githubusercontent.com/10602045/47287928-93073c80-d5fc-11e8-8a4f-d46f4393a26e.png)

Enable Esync through the toggle in configuration:

![screenshot from 2018-10-22 02-00-48](https://user-images.githubusercontent.com/10602045/47273522-573d8a00-d59e-11e8-8762-fea9f5537110.png)
