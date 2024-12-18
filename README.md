# Doom Runner on Flatpak

This project contains files to build [Doom Runner](https://github.com/Youda008/DoomRunner) as a Flatpak app.

The app includes the [GZDoom](https://zdoom.org/) engine to run WADs and files.

## Basic usage
- Put data files in `~/.var/app/io.github.Youda008.DoomRunner/data/share`.
- Choose your favorite combination from main window
- Press the "Launch!" button
- Have fun!

#### GZDoom options
Embedded GZDoom engine configs are in `~/.var/app/io.github.Youda008.DoomRunner/config/gzdoom.ini`

## Custom folders
If you want to use other folders outside the app directory, then you have to extend Flatpak permissions in order to access them.
For example:
```shell
$ flatpak --user override io.github.Youda008.DoomRunner --filesystem=$HOME/doom
```
So you can choose different folders in you `$HOME` directory for data and configs, just select them trough the "Initial setup" menu.
For example: `$HOME/doom/share` for game files and `$HOME/doom/config` for configs.

## Advanced usage

### Add a Flatpak engine
Let's assume you want to use another app engine like [Crispy Doom](https://flathub.org/it/apps/io.github.fabiangreffrath.Doom).
Remember that Flatpak apps are sandboxed: the engine cannot access to Doom Runner files and vice versa.

#### 1 - Grant permissions
Ensure that both the engine app and Doom Runner can access to a common folder (eg `~/doom`):
```shell
$ flatpak --user override io.github.fabiangreffrath.Doom --filesystem=$HOME/doom
```

#### 2 - Create a launcher script
Create a launcher script (eg `~/doom/engine/crispy.sh`) in the common folder like the following:
```shell
#!/usr/bin/bash
exec /usr/bin/flatpak run io.github.fabiangreffrath.Doom "$@"
```
Make the launcher executable:
```shell
$ chmod u+x ~/doom/engine/crispy.sh
```

#### 3 - Add the engine
Add the engine to the Doom Runner list:
- select the file `~/doom/engine/crispy.sh` as "Executable path"
- provide existing "Config directory" and "Data directory" (eg `~/doom/config`)
- choose the proper "Engine family" (eg ChocolateDoom)

#### 4 - Provide game files
Put data files in the common folder (eg `~/doom/share`), so both Doom Runner and the engine can access them.

The common folder should look like this:
```
~/doom/
├── config
│   └── crispy
│       └── doomsav0.dsg
├── share
│   ├── freedoom1.wad
│   └── freedoom2.wad
└── engine
    └── crispy.sh
```

Repeat the above steps for each Flatpak engine you want to add.