# Doom Runner on Flatpak

This project contains files to build [Doom Runner](https://github.com/Youda008/DoomRunner) as a Flatpak app.

## 📢 Embedded GZDoom has been removed ⚠️
If you didn't customize the config path, you can find previous configs in `~/.var/app/io.github.Youda008.DoomRunner/config/gzdoom.ini`.

If you need to move your game files, please remember to adjust configured paths accordingly in the "Initial setup" section.

Please, read the following if you want to add a Flatpak engine.

## How to add a Flatpak engine
Let's assume you want to use a Flatpak engine like [GZDoom](https://flathub.org/apps/org.zdoom.GZDoom).
Remember that Flatpak apps are sandboxed: the engine cannot access to Doom Runner app files and vice versa.

#### 1. Prepare the engine
Install the app from Flathub:
```shell
flatpak install flathub org.zdoom.GZDoom
```

Create or choose a common folder where both Doom Runner and the engine can access to (eg `~/doom`).

#### 2. Create a launcher script
Create a launcher script (eg `~/doom/engine/gzdoom.sh`) that can use the common folder like the following:
```shell
#!/usr/bin/bash
exec flatpak run --filesystem=~/doom org.zdoom.GZDoom "$@"
```

Make the launcher executable:
```shell
chmod u+x ~/doom/engine/gzdoom.sh
```

#### 3. Make the engine available
Use the "Initial setup" to add the launcher to the Doom Runner list:
- select the file `~/doom/engine/gzdoom.sh` as "Executable path"
- provide existing "Config directory" and "Data directory" (eg `~/doom/config`)
- choose the proper "Engine family" (eg ZDoom)

#### 4. Provide game files
Put data files in the common folder (eg `~/doom/share`), so both Doom Runner and the engine can access to them.

The common folder should look like this:
```
~/doom/
├── config
│   └── Default
│       └── auto00.zds
├── share
│   ├── freedoom1.wad
│   └── freedoom2.wad
└── engine
    └── gzdoom.sh
```

Repeat the above steps for each Flatpak engine you want to add.