# Wine Version Management

Lutris uses the deprecated [Wine-GE-8-26](https://github.com/GloriousEggroll/wine-ge-custom) as the default Wine build. 

It is recommended to use up-to-date Proton versions that are likely to support more games. Use a tool like [ProtonPlus](https://github.com/Vysp3r/ProtonPlus) to easily install these.
Then configure your Wine runner to use an up-to-date version (Runners > Wine > Manage Versions > "Wine Version"). 

If you run into problems, use tools like [ProtonDB](https://www.protondb.com/) to check which Proton version works best with your game.
Then override the Proton version for that specific game (Right Click Game > Configure > Runner Options > "Wine Version").
Also make sure the [umu-launcher](https://github.com/Open-Wine-Components/umu-launcher) dependency is installed on your system. This will ensure ProtonFixes are applied to all games when run outside of Steam. E.g. on Arch systems this is an optional dependency that must be explicitly installed via the system package manager.


