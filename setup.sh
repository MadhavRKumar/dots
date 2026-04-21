#!/bin/bash

# Script to choose the OS and install the dot files by creating symbolic links

# Argument allows for dry run of the script to ensure that the symbolic links will be created correctly without actually creating them
DRY_RUN=false
if [ "$1" == "--dry-run" ]; then
    create_symlink() {
        local source_file="$1"
        local target_file="$2"

        # if the directory of the target file does not exist, create it
        if [ ! -d "$(dirname "$target_file")" ]; then
            echo "Would create directory: $(dirname "$target_file")"
        fi

        # Check if the source file exists
        if [ ! -e "$source_file" ]; then
            echo "Source $source_file does not exist. Skipping."
            return
        fi

        # Check if the target file already exists. If it does, create< a backup of it by renaming it with a .backup extension   
        if [ -e "$target_file" ]; then
            echo "Would backup existing file: $target_file to $target_file.backup"
        fi

        echo "Would create symbolic link for $source_file at $target_file."
    }
else
    create_symlink() {
        local source_file="$1"
        local target_file="$2"

        # if the directory of the target file does not exist, create it
        if [ ! -d "$(dirname "$target_file")" ]; then
            mkdir -p "$(dirname "$target_file")"
        fi

        # Check if the source file exists
        if [ ! -e "$source_file" ]; then
            echo "Source $source_file does not exist. Skipping."
            return
        fi

        # Check if the target file already exists. If it does, create< a backup of it by renaming it with a .backup extension   
        if [ -e "$target_file" ]; then
            mv "$target_file" "$target_file.backup"
            echo "Backed up existing file: $target_file to $target_file.backup"
        fi

        ln -s "$source_file" "$target_file"
        echo "Created symbolic link for $source_file at $target_file."
    }
fi


# Prompt the user to choose the OS
echo "Choose your OS:"
echo "1) Arch"
echo "2) macOS"
read -p "Enter the number corresponding to your OS: " os_choice

# Set the source directory for the files. It should be the directory where this script is located
SOURCE_DIR="$(dirname "$(realpath "$0")")"

# Set the target directory for the dot files
TARGET_DIR="$HOME"


# Install the dot files based on the chosen OS
case $os_choice in
    1)
        ## do nothing for now, but in the future we can add support for Arch Linux here
        echo "Arch Linux support is not implemented yet."
        ;;
    2)
        MACOS_SOURCE_DIR="$SOURCE_DIR/macos"
        # macOS
        create_symlink "$MACOS_SOURCE_DIR/.zshrc" "$TARGET_DIR/.zshrc"
        create_symlink "$MACOS_SOURCE_DIR/.aerospace.toml" "$TARGET_DIR/.aerospace.toml"

        ## For each directory in the macOS .config directory, create a symbolic link in the target directory
        for dir in "$MACOS_SOURCE_DIR/.config/"*; do
            dir_name=$(basename "$dir")
            create_symlink "$dir" "$TARGET_DIR/.config/$dir_name"
        done
        ;;
    *)
        echo "Invalid choice. Please run the script again and choose a valid option."
        ;;
esac
