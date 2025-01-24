# Battle.Net
Battle.Net ist ein Game Launcher für Blizzard- und Activision-Spiele.

## Wichtiger Hinweis!

Battle.Net funktioniert nicht richtig, wenn es auf einer NTFS-Partition installiert wurde. Bitte wählen Sie stattdessen ein Ext4-Laufwerk als Ziel.
Abhängigkeiten für Battle.Net
Weinabhängigkeiten

Damit Overwatch funktioniert, sind Wine-Abhängigkeiten erforderlich. Bitte folgen Sie den Anweisungen auf der Wine-Abhängigkeitsseite, um sie zu erhalten.
Richtige Treiberinstallation

Battle.net erfordert aktuelle, Vulkan-fähige Grafiktreiber. Anweisungen zur Installation finden Sie unter „So geht‘s: Installieren von Treibern“.
Andernfalls funktioniert Battle.Net möglicherweise nicht.
Bekannte Probleme und Fehlerbehebung

Fehler, falsch konfigurierte Systeme und fehlende Abhängigkeiten können manchmal Probleme mit Battle.Net verursachen:
Login und Battle.net selbst sind extrem langsam

Stellen Sie sicher, dass Ihr Hostname zu 127.0.0.1 aufgelöst wird. Bearbeiten Sie /etc/hosts mit sudo nano /etc/hosts und die erste Zeile sollte in etwa 127.0.0.1 localhost myhostname.localdomain myhostname lauten, wobei myhostname durch Ihren tatsächlichen Hostnamen ersetzt wird. Sie können Ihren Hostnamen abrufen, indem Sie den Befehl „Hostname“ starten. Lassen Sie den Rest der Datei unberührt und achten Sie auf Fehler und Tippfehler, da diese schwerwiegende Probleme mit Ihrem System verursachen können.
Das Installationsfenster wird nicht angezeigt, die Installation steckt fest

Normalerweise liegt dies an fehlenden Wine-Abhängigkeiten, manchmal ist es jedoch das Ergebnis eines unbekannten Fehlers in KDE. Es sind keine Workarounds hierfür bekannt, die einzige Lösung ist also die Verwendung einer anderen DE.

Wenn Sie sich hinter einem Proxy oder einem DNS-Filter wie PiHole befinden und Ihre Installation mit der Fehlermeldung „Objekt verschoben“ hängen bleibt, setzen Sie *.blizzard.com und *.battle.net auf die Whitelist, um die Agenteninstallation zu ermöglichen. Es gibt integrierte Telemetriefunktionen, die dazu führen können, dass die Installation fehlschlägt, selbst wenn alle Systemabhängigkeiten korrekt sind.
Das Installationsprogramm friert bei ca. 25 % ein und gibt dann einen Fehler zurück.

Dies wird durch eine fehlerhafte oder fehlende Installation der 32-Bit-Nvidia-Utils (oder Mesa) verursacht.

Dies ist ein sehr häufiges Problem bei Benutzern, die versuchen, den Nvidia-Treiber mithilfe einer .run-Datei zu installieren. Um das Problem zu beheben, wird empfohlen, Ihr System vollständig neu zu installieren und stattdessen Treiber aus Repositories zu beziehen.
Wir haben Probleme beim Starten des Blizzard Update Agent

Dasselbe Problem wie das vorherige, verursacht durch fehlende 32-Bit-Nvidia-Utils (oder Mesa). Eine weitere mögliche Ursache ist, dass nach der Installation der Treiber kein Neustart erfolgt ist.
Eine erforderliche DLL konnte nicht gefunden werden

Wenn die Meldung erscheint, wenn DXVK verwendet wird, und sie mit deaktiviertem DXVK funktioniert, stellen Sie sicher, dass Sie Vulkan korrekt installiert haben, einschließlich der 32-Bit-Pakete. Wenn das Problem weiterhin besteht, versuchen Sie, den DXVK-Katalog von Lutris in .local/share/lutris/runtime/dxvk zu entfernen (.local ist ein versteckter Ordner in Ihrem Home-Verzeichnis).
Drehendes Symbol, keine Anmeldeschaltflächen

Gehen Sie zu den Optionen für Battle.Net – deaktivieren Sie die Hardwarebeschleunigung.

Möglicherweise haben Sie auch Erfolg, wenn Sie versuchen, das Cache-Verzeichnis der App zu löschen, das sich im Verzeichnis drive_c/ProgramData/ des Wine-Präfixes befindet.
Schwarzer Bildschirm beim Starten des Spiels

Gehen Sie zu den Optionen für Battle.Net - Streaming deaktivieren
Ruhender Agent / Probleme bei der Installation / Aktualisierung:
Klicken Sie hier, um Screenshots anzuzeigen


Folgendes können Sie versuchen:

 Verwenden Sie Wine Version 3.20 oder neuer.
 Schließen Sie Battle.Net vollständig und warten Sie einen Moment, bis alle Prozesse beendet sind. Aber beenden Sie vorsichtshalber Battle.Net, Agent.exe und Wineserver mit:

killall Agent.exe Battle.net.exe Wineserver

Suchen Sie dann innerhalb des Präfixes, in dem Battle.Net installiert ist, den Ordner drive_c/ProgramData und löschen Sie Battle.net. Öffnen Sie Battle.Net erneut und warten Sie einen Moment, der Fehler sollte verschwinden.

Um anschließend Ihre vorhandenen Spieleinstallationen wiederherzustellen, öffnen Sie einfach „Einstellungen“ > „Spiel installieren/aktualisieren“ und klicken Sie auf „Nach Spielen suchen“.

Wenn Sie eine AMD-GPU verwenden, versuchen Sie, radeon_icd.x86_64.json in den Lutris-Systemeinstellungen -> Systemoptionen -> Vulkan ICD Loader festzulegen. Stellen Sie sicher, dass Sie „Erweiterte Optionen anzeigen“ aktiviert haben.
Es startet einfach nicht

Versuchen Sie, die ausführbare Datei von Battle.net Launcher.exe in Battle.net.exe zu ändern, und versuchen Sie es erneut.
Blizzard-Fehler: In der Anwendung ist ein unerwarteter Fehler aufgetreten

Die Ursache hierfür können fehlerhafte Schriftarten sein (z. B. All-Repository-Fonts von AUR). Versuchen Sie, sie zu entfernen.

Die Ursache kann auch ein fehlender 32-Bit-Vulkan-Loader sein. Anweisungen finden Sie unter How-To:-DXVK.
Begrenzen Sie die FPS im Spiel von Battle.Net

Siehe: https://us.battle.net/support/en/article/32248
32-Bit-Nvidia
Wenn Sie das NVIDIA-Treiberpaket installieren, werden möglicherweise nicht unbedingt die 32-Bit-Bibliotheken installiert. Dies ist ein Problem, da Battle.net eine 32-Bit-Anwendung ist. Suchen Sie in der Dokumentation Ihrer Distribution nach den richtigen Paketen.

https://github.com/lutris/docs/blob/master/Battle.Net.md



Battle.Net is the game launcher for Blizzard and Activision games.<br>

## Important Note! 
**_Battle.Net won't work correctly if it was installed on an NTFS partition. Please choose an Ext4 drive as destination instead._**

## Dependencies for Battle.Net

### Wine dependencies
Wine dependencies are **required** for Overwatch to work. Please follow the instructions on [Wine Dependencies](https://github.com/lutris/docs/blob/master/WineDependencies.md) page to get them.

### Proper driver installation
Battle.net requires up-to-date, Vulkan capable graphics drivers.
For instructions on how to install them, refer to [How to: Installing Drivers](https://github.com/lutris/docs/blob/master/InstallingDrivers.md).<br>
Otherwise, Battle.Net **may not work**.

##  Known issues and troubleshooting
Bugs, misconfigured systems and missing dependencies can sometimes cause issues with Battle.Net:

### Login and Battle.net itself are extremely slow
Make sure your hostname resolves to 127.0.0.1. Edit `/etc/hosts` with `sudo nano /etc/hosts` and the first line should be something like `127.0.0.1		localhost myhostname.localdomain myhostname` where myhostname is replaced by your actual hostname. You can get your hostname by launching the `hostname` command. Do not touch the rest of the file and be careful with mistakes and typos as they can cause serious issues with your system.

### The installer window does not show up, installation is stuck
Usually it's caused by missing wine dependencies, but sometimes it's a result of an unknown bug in KDE.
There are no known workarounds to this, so the only solution is to use another DE.

If you are behind a proxy, or behind a DNS Filter like PiHole, and your installation stalls with an "Object moved" error, whitelist `*.blizzard.com` and `*.battle.net` to allow agent installation. There is built-in telemetry that can cause the installation to fail, even with all the correct system dependecies.

### The installer freezes at ~25% and then returns an error
This is caused by broken or missing installation of 32-bit `nvidia-utils` (or `mesa`). 

It's a very common problem among users who attemped to install Nvidia driver using `.run` file. To fix it, it's suggested to _completely_ reinstall your system and get drivers from repositories instead.

### We're having trouble launching the Blizzard Update Agent
Same issue as the previous one, caused by missing 32 bit `nvidia-utils` (or `mesa`).
Also may be caused by not rebooting after installing drivers.

### A required DLL could not be found
If the message appears when DXVK is in use, and it works with DXVK disabled, make sure you installed Vulkan correctly, including 32 bit packages.
If the issue persists, try removing Lutris's DXVK catalog in `.local/share/lutris/runtime/dxvk` (.local is a hidden folder inside your `Home` directory).

### Spinning Icon, no login buttons
Go to options for Battle.Net - disable hardware acceleration.

You might also have success if you try [deleting the app's cache directory](https://us.battle.net/support/en/article/34721), which will be in the wine prefix's `drive_c/ProgramData/` directory.

### Black screen when starting game
Go to options for Battle.Net- disable streaming

### Sleeping Agent / issues with installing / updating :
<details>
<summary>Click to view screenshots</summary>
<br>

Greyed out install button:

![](https://cdn.discordapp.com/attachments/288951868082749441/482531076712169472/unknown.png)

Blizzard Agent went to sleep:

![](https://i.imgur.com/ZJnpWRD.png)

</details>
<br>

Here is what you can try:
1. Use wine version 3.20 or newer.
2. Close Battle.Net fully and wait a bit until all its processes exit. But just in case, terminate Battle.Net, Agent.exe and wineserver with: 

`killall Agent.exe Battle.net.exe wineserver` 

Then, inside the prefix Battle.Net is installed in, find `drive_c/ProgramData` folder and delete `Battle.net`. Open Battle.Net again and wait a little bit, the error should disappear.

To restore your existing game installations  after this, simply open Settings>Game Install/Update and click "Scan for Games".

If you're using an AMD GPU, try setting `radeon_icd.x86_64.json` in Lutris System preferences -> System options -> Vulkan ICD loader. Make sure to tick "Show advanced options".

### It simply won't start
Try to change executable from `Battle.net Launcher.exe` to `Battle.net.exe`, and try again.

### Blizzard Error: The Application Encountered an unexpected error
This can be caused by bad fonts (for example, `all-repository-fonts` from AUR). Try removing them.<br><br>
It can also be caused by missing 32-bit Vulkan loader. Refer to [How-To:-DXVK](https://github.com/lutris/docs/blob/master/HowToDXVK.md) for instructions.

## Limit FPS in-game from Battle.Net
See: https://us.battle.net/support/en/article/32248

## 32-bit Nvidia
When you install the nvidia-driver package, it might not necessarily install the 32-bit libraries, which is a problem because Battle.net is a 32-bit app. Check your distribution's documentation for the correct packages.
