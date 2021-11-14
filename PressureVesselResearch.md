# Pressure Vessel Integration

## Building

This documentation is based on Pop 21.04

Install dependencies (list not complete):

  `apt install pandoc libcap-dev libjson-glib-dev libelf-dev libva-dev libvdpau-dev gtk-doc-tools`
  

Clone the project:
  `git clone https://gitlab.steamos.cloud/steamrt/steam-runtime-tools.git`
  
  
Build the Steam runtime tools, including Pressure Vessel:

   ```
   cd steam-runtime-tools
   ./build-aux/many-builds.py setup
   ./build-aux/many-builds.py build
   ./build-aux/many-builds.py install
   ```
   
## Running with Pressure vessel
 
  in 1st terminal
  ```
  export dbusname="com.steampowered.PressureVessel.Test"
  cd _build/containers/pressure-vessel/bin/
  ./pressure-vessel-launcher --bus-name "$dbusname"
  ```
  
  in 2nd terminal
  ```
  export dbusname="com.steampowered.PressureVessel.Test"
  cd _build/containers/pressure-vessel/bin/
  ./pressure-vessel-launch --bus-name "$dbusname" ~/Games/linux/doom-3/doom.x86
  ```
  
