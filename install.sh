#!/bin/bash

# ----------------------------------------------------- 
# Include files and set variables
# -----------------------------------------------------
dot_folder="dotfiles" 
version=$(cat dotfiles/.config/ml4w/version/name)
install_directory=$(pwd)
source install/includes/colors.sh
source install/includes/library.sh
clear

# ----------------------------------------------------- 
# Load header
# ----------------------------------------------------- 
source install/header.sh

# ----------------------------------------------------- 
# Check for required packages
# ----------------------------------------------------- 
source install/required.sh

# ----------------------------------------------------- 
# Confirm the start of the installation
# ----------------------------------------------------- 
source install/confirm_start.sh

# ----------------------------------------------------- 
# Activate parallel downloads
# ----------------------------------------------------- 
source install/paralleldownloads.sh

# ----------------------------------------------------- 
# Install yay
# ----------------------------------------------------- 
source install/yay.sh

# ----------------------------------------------------- 
# Update the system
# ----------------------------------------------------- 
source install/updatesystem.sh

# ----------------------------------------------------- 
# Backup files
# ----------------------------------------------------- 
source install/backup.sh

# ----------------------------------------------------- 
# Prepare files for the installation
# ----------------------------------------------------- 
source install/preparation.sh

# ----------------------------------------------------- 
# Decide on installation method
# ----------------------------------------------------- 
source install/installer.sh

# ----------------------------------------------------- 
# Remove not required packages
# ----------------------------------------------------- 
source install/remove.sh

# ----------------------------------------------------- 
# Install general packages
# ----------------------------------------------------- 
source install/general.sh

# ----------------------------------------------------- 
# Install profile
# ----------------------------------------------------- 
source install/profile.sh

# ----------------------------------------------------- 
# Install flatpak
# ----------------------------------------------------- 
source install/flatpak.sh

# ----------------------------------------------------- 
# Check if running in Qemu VM
# ----------------------------------------------------- 
source install/vm.sh

# ----------------------------------------------------- 
# Install wallpapers
# ----------------------------------------------------- 
source install/wallpaper.sh

# ----------------------------------------------------- 
# Install Display Manager
# ----------------------------------------------------- 
source install/displaymanager.sh

# ----------------------------------------------------- 
# Install tty issue
# ----------------------------------------------------- 
source install/issue.sh

# ----------------------------------------------------- 
# Modify existing files before restore starts
# ----------------------------------------------------- 
source install/before_restore.sh

# ----------------------------------------------------- 
# Restore configuration and settings
# ----------------------------------------------------- 
source install/restore.sh

# ----------------------------------------------------- 
# Setup the input devices
# ----------------------------------------------------- 
source install/keyboard.sh

# ----------------------------------------------------- 
# Execute hook.sh if exists
# ----------------------------------------------------- 
source install/hook.sh

# ----------------------------------------------------- 
# Check installation of .bashrc
# ----------------------------------------------------- 
source install/bashrc.sh

# ----------------------------------------------------- 
# Check installation of neovim
# ----------------------------------------------------- 
source install/neovim.sh

# ----------------------------------------------------- 
# Copy files to target directory
# ----------------------------------------------------- 
source install/copy.sh

# ----------------------------------------------------- 
# Initialize pywal color scheme
# ----------------------------------------------------- 
source install/init-pywal.sh

# ----------------------------------------------------- 
# Install profile symlinks
# ----------------------------------------------------- 
source install/symlinks.sh

# ----------------------------------------------------- 
# Restore hyprland settings
# ----------------------------------------------------- 
source install/settings.sh

# ----------------------------------------------------- 
# Install ML4W Apps
# ----------------------------------------------------- 
source install/apps.sh

# ----------------------------------------------------- 
# Final cleanup
# ----------------------------------------------------- 
source install/cleanup.sh

# ----------------------------------------------------- 
# Check executables of important apps
# ----------------------------------------------------- 
source install/diagnosis.sh

# ----------------------------------------------------- 
# Execute post.sh if exists
# ----------------------------------------------------- 
source install/post.sh

# ----------------------------------------------------- 
# Offer Reboot
# ----------------------------------------------------- 
source install/reboot.sh

