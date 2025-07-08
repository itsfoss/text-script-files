## Resource Installer

This is a simple bash script to install a Starship theme. It will require admin password, but don't run script with `sudo` prefix.

Just make the script executable:

```
chmod +x ./beautyterm.sh
```

Now, run the script

```
./beautyterm.sh
```

The script will install:

- Curl and Unzip if not installed already
- Nerd Fonts (FiraCode and CaskaydiaCove if not installed already)
- Starship Prompt (If not installed)
    - For ZSH 
    - For Bash
    - This will ask your confirmation.
- A Pastel Powerline Starship Prompt theme.
