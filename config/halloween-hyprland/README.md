This is a config file group for the Halloween Hyprland video. You can watch the video on YouTube to get a more visual idea about this.

### Expected Resources in the system

- Installed the following packages
	- waybar
	- fastfetch
	- wofi
	- dunst
	- hyprpaper
	- hyprlock
- Installed fonts
	- Firacode Nerd
	- CaskaydiaCove Nerd
	- Font Awesome free desktop
	- JetBrains Mono
	- Creepster
	- Eater

For those using this config, first download this directory.

You can either download the entire `text-script-files` directory, or use directory downloaded tools to get this directory only.

Once downloaded, copy and paste the following files as explained below:

- `waybar`: `~/.config/`
- `fastfetch`: `~/.config`
- `dunst`: `~/.config`
- `wofi`: `~/.config`
- `starship.toml` (file): `~/.config`
- Download the images and paste it in `~/Pictures/Wallpapers/` directory. Please create that directory and save to it, if it not already exists. Because the config expects the image there.

Once pasted, open the Waybar config file (`config.jsonc`) in a visual editor like Zed.

Change all the `Virtual-1` monitor references to your monitor name. In Hyprland, get the monitor name using:

```
hyprctl monitors
```

Now, copy the `hyprlock.conf`, and `hyprpaper.conf` file to `~/.config/hypr/` directory.

Open both the above file and change the monitor reference to your monitor name.

You have done most of the things. Reboot your system.
