#!/bin/bash

# Script to clean up filenames:
# - Replace spaces with underscores
# - Remove unsupported characters (anything except letters, numbers, underscores, hyphens, and dots)
# - Convert all letters to lowercase

# Loop through all files in the current directory (non-recursive)
for file in *; do
    # Skip directories
    [ -f "$file" ] || continue

    # Original filename
    original="$file"

    # Replace spaces with underscores
    new="${file// /_}"

    # Remove unsupported characters (keep letters, numbers, underscores, hyphens, and dots)
    new=$(echo "$new" | sed 's/[^a-zA-Z0-9._-]//g')

    # Convert to lowercase
    new=$(echo "$new" | tr '[:upper:]' '[:lower:]')

    # Only rename if the name has changed
    if [ "$original" != "$new" ]; then
        # Check for conflicts
        if [ -e "$new" ]; then
            echo "Skipping '$original' -> '$new' (file already exists)"
        else
            mv "$original" "$new"
            echo "Renamed '$original' -> '$new'"
        fi
    fi
done

