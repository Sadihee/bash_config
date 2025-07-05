#!/usr/bin/bash

# Directory Navigation Aliases
# --------------------------------------------
# Use 'b', 'bb', 'bbb', etc., to move up directories quickly.
alias b='cd ..'
alias bb='cd ../../'
alias bbb='cd ../../../'
alias bbbb='cd ../../../../'
alias bbbbb='cd ../../../../../'

# Listing Directory Contents
# --------------------------------------------
# Use 'ls' with color output by default.
alias ls='ls --color=auto'
# List all files including hidden ones.
alias ll='ls -alF'
# List almost all files (excluding . and ..).
alias la='ls -A'
# List files in a column format.
alias l='ls -CF'

# Safe Remove
# --------------------------------------------
# Use 'rm' in interactive mode by default to prevent accidental deletions.
alias rm='rm -i'

# Enhanced Change Directory
# --------------------------------------------
# Override 'cd' to list directory contents after changing directory.
cd() {
    builtin cd "$@" && ls
}

# Text Editor and Development Tools
# --------------------------------------------
# Use 'g' to open files with gvim if available, otherwise use vim.
alias g='if command -v gvim &> /dev/null; then gvim; else vim; fi'
# Use 'code' to open current directory in Visual Studio Code if installed.
alias code='if command -v code &> /dev/null; then code .; else echo "Visual Studio Code is not installed."; fi'

# Search and Grep
# --------------------------------------------
# Use 'grep' with color output by default.
alias grep='grep --color=auto'

# Additional Navigation Shortcuts
# --------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Custom or Additional Tools
# --------------------------------------------
# Function to go to the last occurrence of a directory in the current path.
go() {
    if [ -z "$1" ]; then
        echo "Usage: go <directory_name>"
        return 1
    fi

    local target_dir="$1"
    local current_path=$(pwd)
    local new_path=""

    # Split the path into parts
    IFS='/' read -ra path_parts <<< "$current_path"

    # Iterate over the path parts to find the last occurrence of the target directory
    local last_index=-1
    for i in "${!path_parts[@]}"; do
        if [ "${path_parts[$i]}" = "$target_dir" ]; then
            last_index=$i
        fi
    done

    if [ $last_index -ne -1 ]; then
        # Reconstruct the path up to the last occurrence of the target directory
        for ((i=0; i<=last_index; i++)); do
            new_path+="/${path_parts[$i]}"
        done
        cd "$new_path" || return 1
    else
        echo "Directory '$target_dir' not found in the current path."
        return 1
    fi
}

# Example: Add any additional custom aliases or tools here.
# alias mytool='path/to/my/tool'






