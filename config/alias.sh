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
