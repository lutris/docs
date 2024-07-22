# What is DXVK?

[DXVK](https://github.com/doitsujin/dxvk) is a Vulkan-based compatibility layer for Direct3D-8, 9,10 & 11. It allows running 3D applications on Linux using Wine.

For the current status of the project, please refer to the DXVK [wiki](https://github.com/doitsujin/dxvk/wiki).

## Requirements:

- [Vulkan capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility) - Note for Intel iGPU users: Only Skylake, Kaby Lake, and Coffee Lake offer full Vulkan support. Anything older is only partial. Although some games might work nothing is guaranteed.

## Installing Supported drivers:

To take advantage of DXVK and its improved performance you ***must*** install a supported graphics driver and Vulkan 
