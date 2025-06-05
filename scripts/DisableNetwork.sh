#!/usr/bin/bash

# Remove `/usr/bin/flatpak-spawn --host` if not using Flatpak
/usr/bin/flatpak-spawn --host bash -c '
echo "Disabling all networking via NetworkManager..."
nmcli networking off
'
