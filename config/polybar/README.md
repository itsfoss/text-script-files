## Configure Polybar

![Current Polybar theme](./screenshots/polybar-screenshot.png)

Download all the files in this repo, except the git specific ones.

Now, paste these files in the directory, `~/.config/polybar`.

If that directory is not already present, use the command below to create it:

```
mkdir -p ~/.config/polybar
```

The files in these repo are:

1. `config.ini`: Main Poolybar config
2. `debupdates.sh`: A shell script to get the number of updates available to the Mint system.
3. `pacupdates.sh`: A shell script to get the number of updates available in an Arch Linux based system.
4. `logout.sh` : A one line script to call `xfce-session-logout`.
5. `polybar.sh`: A script that allows to restart polybar in place if any config change.
6. `rofi.sh`: A one liner script that calls rofi menu with icons.

If you are on an Arch Linux system, use the `pacupdates.sh` and ignore the `mintupdates` file. Same for other.

Once everything is pasted, add `polybar` to your system autostart application list. This process varies on different desktops.

Now, reboot your system and log back in to get the polybar.

If you are using Xfce, first disable the tray module in Polybar and then enable tray module in Xfce panel. Otherwise, Spotify will not play in the background.


