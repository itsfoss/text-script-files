# Installing the Ghostty config file.

In this repository, you can find easy to use Ghostty config files. The config is separated to two parts, a Congfiguration file and a Keybindings file.

This should be considered as a minimal config file with some custom settings to start with. Ghostty works out of the box without the requirement of any config files.

Still, if you are into configuration, this can be a minimal starting point.

## How to set the configuration

Download the `config` and `keybinds` file from this repository and place it inside `~/.config/ghostty/` directory.

Now close and reopen Ghostty, if any instances are running.

## Editing the configuration

To edit the configuration, open the config file in any of you favorite editor.

```
nano ~/.config/ghostty/config
```

To get all the available options for Ghostty, refer to the official documentation [here](https://ghostty.org/docs/config/reference).

Or use the command to get a local offline documentation, use the command:

```
ghostty +show-config --default --docs | less
```


## Keybindings set in this configuration

Below, Trigger sequence are used for most of the actions. That is, press the first combination (CTRL + A) and then press the said key to trigger the mentioned action.

This is what the form `CTRL + A T` means.

|             Function             |         Keybinding         |
| -------------------------------- | -------------------------- |
| Open a new tab                   | CTRL + A T                 |
| Move to next tab                 | CTRL + A N                 |
| Move to previous tab             | CTRL + A P                 |
| Toggle tab overview              | CTRL + A O                 |
| Create a right split             | CTRL + A Right             |
| Create a bottom split            | CTRL + A  Down             |
| Go to right split                | CTRL + SHIFT + Right       |
| Go to left split                 | CTRL + SHIFT + Left        |
| Go to above split                | CTRL + SHIFT + Up          |
| Go to below split                | CTRL + SHIFT + Down        |
| Equalize splits                  | CTRL + A E                 |
| Toggle on/off window decorations | CTRL + A T                 |
| Reload the configuration         | CTRL + A R                 |

In the keybindings config file, a performable keybinding for "Copy to Clipboard" is set to "CTRL + C".

This will make "CTRL+C" work as copy, when there is a selection active and works as usual interrupt signal in all other cases.

The keybinding here are choosen according to personal preferences. You can look to the default keybindings set using the command:

```
ghostty +list-keybinds | less
```

Now decide what all actions need your own keybindings

To change any keybinding or to add any new kybinding, first refer to the possible keybinding actions.

This can be done by visiting the website [here](https://ghostty.org/docs/config/keybind/reference)

Or using the command:

```
ghostty +list-actions | less
```

