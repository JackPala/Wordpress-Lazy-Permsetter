#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or using sudo."
    exit 1
fi

# Prompt for the WordPress directory path
read -p "What directory is the root of the WordPress instance? " wp_dir

# Check if the directory exists
if [ ! -d "$wp_dir" ]; then
    echo "The specified directory does not exist."
    exit 1
fi

# Prompt for web server user
read -p "What is the web server user (leave blank for www-data): " web_user
web_user=${web_user:-www-data}

# Prompt for web server group
read -p "What is the web server group (leave blank for www-data): " web_group
web_group=${web_group:-www-data}

# Change to the WordPress directory
cd "$wp_dir"

# Set ownership to the specified user and group
echo "Setting ownership to $web_user:$web_group..."
chown -R "$web_user:$web_group" .

# Set directory permissions to 755
echo "Setting directory permissions to 755..."
find . -type d -exec chmod 755 {} \;

# Set file permissions to 644
echo "Setting file permissions to 644..."
find . -type f -exec chmod 644 {} \;

# Set wp-config.php permissions to 600
echo "Setting wp-config.php permissions to 600..."
chmod 600 wp-config.php

# Set permissions for wp-content directory
echo "Setting permissions for wp-content directory..."
chmod 755 wp-content
find wp-content -type d -exec chmod 755 {} \;
find wp-content -type f -exec chmod 644 {} \;

echo "WordPress permissions have been set successfully."
