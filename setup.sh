#!/bin/bash

# Define the source path
zip_file="/home/akash/Downloads/restserver-lumen-package.zip"

# Define the destination directory in your home directory
destination=~/laravel_app

# Create the destination directory if it doesn't exist
mkdir -p "$destination"

# Unzip the file to a temporary directory
temp_dir=$(mktemp -d)
unzip -q "$zip_file" -d "$temp_dir"

# Check if the unzip operation was successful
if [ $? -eq 0 ]; then
    # Move the unzipped files to their respective directories
    mv "$temp_dir/app/." "$destination/app/"
    mv "$temp_dir/bootstrap/." "$destination/bootstrap/"
    mv "$temp_dir/config/." "$destination/config/"
    mv "$temp_dir/database/." "$destination/database/"
    mv "$temp_dir/public/." "$destination/public/"
    mv "$temp_dir/resources/." "$destination/resources/"
    mv "$temp_dir/routes/." "$destination/routes/"
    mv "$temp_dir/storage/." "$destination/storage/"
    mv "$temp_dir/vendor/." "$destination/vendor/"

    # Clean up: Remove the temporary directory and the original zip file
    rm -rf "$temp_dir"
    rm "$zip_file"

    # Output a success message
    echo "Setup complete. Files have been moved to $destination."
else
    # Output an error message if the unzip operation failed
    echo "Error: Failed to unzip the file."
fi
