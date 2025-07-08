#!/bin/bash

echo "Simple Installer...."

# Update the package cache.
echo "Updating package cache..."
sudo apt update

# Check if unzip is installed. If not installed, then install the package. This is for Ubuntu
if ! command -v unzip &> /dev/null; then
    echo "unzip not found. Installing..."
    sudo apt update
    sudo apt install -y unzip
else
    echo "unzip is already installed."
fi

# Check if curl is already installed. If not insatlled, then insatll the package. This is for Ubuntu.
if ! command -v curl &> /dev/null; then
    echo "curl not found. Installing..."
    sudo apt install -y curl
else
    echo "curl is already installed."
fi

# Download the fonts
FONT_DIR="$HOME/.local/share/fonts"
DOWNLOAD_DIR="$HOME/Downloads"
font_installed=0

# A function to check if a font family is installed.
is_font_installed() {
    fc-list | grep -qi "$1"
}

# Function to install a font from Nerd Fonts repo. The zip_name variable is either FiraCode or CaskaydiaCove
install_font() {
    local font_name="$1"
    local zip_name="$font_name.zip"
    local url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$zip_name"

    echo "Installing $font_name Nerd Font..."
    wget -q -P "$DOWNLOAD_DIR" "$url"
    unzip -o "$DOWNLOAD_DIR/$zip_name" -d "$DOWNLOAD_DIR/$font_name"
    cp "$DOWNLOAD_DIR/$font_name"/*.ttf "$FONT_DIR"
    rm -rf "$DOWNLOAD_DIR/$zip_name" "$DOWNLOAD_DIR/$font_name"
    echo "$font_name installed."
    # This font_installed variable is used to check whether a new font was installed.
    # The variable will be assigned only if this function is called and executed.
    # Else, this function won't be called and the variable won;t be set.
    font_installed=1
}

mkdir -p "$FONT_DIR"

# Check if FiraCode is installed or not.
if is_font_installed "FiraCode"; then
    echo "FiraCode font is already installed."
else
    # Call the Function to install the FiraCode nerd font.
    install_font "FiraCode"
fi

# Check if CaskaydiaCove nerd font is installed or not.
if is_font_installed "CaskaydiaCove"; then
    echo "CaskaydiaCove nerd font is already installed."
else
    # Call the function to install CaskaydiaCove nerd font.
    install_font "CascadiaCode"
fi

# Refresh font cache only if a new font was installed.
# This is achieved by using the font_installed variable.
if [[ $font_installed -eq 1 ]]; then
    echo "Refreshing font cache..."
    fc-cache -fv
fi
echo "Done."

# Install Starship in Ubuntu. The installation script is for Linux. But we are talking Ubuntu here specifically.
    if ! command -v starship &> /dev/null; then
        echo "Starship is installing..."
        curl -sS https://starship.rs/install.sh | sh
    else
        echo "Starship is already installed, proceeding..."
    fi

# Adding Starship to shell RC files. Currently, only Bash and ZSH.
# The "added_bash" and "added_zsh" variables are used to determine whether Starship is
# added to atleast one Shell RC file.
added_bash=0
added_zsh=0

# The bash_ans and zsh_ans variables are used to get user input; whether to add or not.
read -p "Add for bash? (y/n): " bash_ans
if [[ "$bash_ans" =~ ^[Yy]$ ]]; then
    # Check if Starship initialization is already added to the Bash RC file.
    # Only add if it is not already added. Else, just print already present.
    if ! grep -Fxq 'eval "$(starship init bash)"' ~/.bashrc; then
        echo 'eval "$(starship init bash)"' >> ~/.bashrc
        echo "Added Starship initialization to ~/.bashrc."
    else
        echo "Starship initialization already present in ~/.bashrc."
    fi
    # Make the added_bash variable to one. Later, it is checked against to determine
    # on which shell Starship is enabled.
    added_bash=1
fi

# Check if Zsh is installed. Most system ships with only Bash. So there is no point
# adding a line to .zshrc, if ZSH is not installed in the system.
# If ZSH is installed, then the Starship initialization code will be added to your
# ZSHRC file.
if command -v zsh &> /dev/null; then
    read -p "Add for zsh? (y/n): " zsh_ans
    if [[ "$zsh_ans" =~ ^[Yy]$ ]]; then
        # Check if Starship initialization is already added to the Zsh RC file.
        if ! grep -Fxq 'eval "$(starship init zsh)"' ~/.zshrc; then
            echo 'eval "$(starship init zsh)"' >> ~/.zshrc
            echo "Added Starship initialization to ~/.zshrc."
        else
            echo "Starship initialization already present in ~/.zshrc."
        fi
        added_zsh=1
    fi
else
    echo "Zsh is not installed. Skipping Starship setup for Zsh."
fi

# Print which shell the user should use to get the Starship prompt.
# This is decided with the added_bash and added_zsh variables.
# If it is not added in both shells, the user need to manually add the Starship
# initialization to their required shell.
if [[ $added_bash -eq 1 && $added_zsh -eq 1 ]]; then
    echo "Starship prompt is set up for both Bash and Zsh."
    echo "Start a new Bash or Zsh session, or run 'source ~/.bashrc' or 'source ~/.zshrc' to activate."
elif [[ $added_bash -eq 1 ]]; then
    echo "Starship prompt is set up for Bash only."
    echo "Start a new Bash session or run 'source ~/.bashrc' to activate Starship."
elif [[ $added_zsh -eq 1 ]]; then
    echo "Starship prompt is set up for Zsh only."
    echo "Start a new Zsh session or run 'source ~/.zshrc' to activate Starship."
else
    echo "Warning: Starship prompt won't launch in Bash or Zsh."
fi

# Set a starship prompt Here, Pastel Powerline preset is used.
starship preset pastel-powerline -o ~/.config/starship.toml

echo "Restart your terminal to see the result."
