#!/bin/bash
# This script will create symbolic links for all files in the current directory and its subdirectories to the parent directory
# It will overwrite any existing files with the same name in the parent directory
# It will exclude a specific file from being linked (e.g. .zsh_history)
# Usage: bash link_files.sh [exclude_file]
# Example: bash link_files.sh .zsh_history

# Get the absolute path of the parent directory
parent_dir=$(cd .. && pwd)

# Get the file name to be excluded as an optional argument
exclude_file=$1

# Loop through all files in the current directory and its subdirectories
find . -type f | while read file; do
  # Get the file name without the leading dot and slash
  file_name=${file:2}
  # Check if the file name matches the exclude file name
  if [[ $file_name == $exclude_file ]]; then
    # Skip this file and continue to the next one
    continue
  fi
  # Create a symbolic link in the parent directory with the same file name, overwriting any existing files with -f option
  ln -sf "$PWD/$file_name" "$parent_dir/$file_name"
done

echo "Done!"
