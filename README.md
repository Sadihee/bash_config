# Bash Configuration and Environment Management Tools

This repository contains bash scripts and a Python script to manage environment variables and provide useful bash aliases.

## Files

| File | Description |
|------|-------------|
| `alias.js` | Contains various bash aliases for directory navigation, listing directory contents, safe removal of files, enhanced directory changes, text editor shortcuts, and search commands. |
| `tools.js` | Contains aliases for managing environment variables using the `env_manager.py` script. |
| `env_manager.json` | JSON file used to store environment variables. |
| `env_manager.py` | Python script to read from and write to the `env_manager.json` file. |

## Bash Aliases

### Directory Navigation
- `b`: Move up one directory.
- `bb`: Move up two directories.
- `bbb`: Move up three directories.
- `bbbb`: Move up four directories.
- `bbbbb`: Move up five directories.

### Listing Directory Contents
- `ls`: List directory contents with color output.
- `ll`: List all files including hidden ones.
- `la`: List almost all files (excluding `.` and `..`).
- `l`: List files in a column format.

### Safe Remove
- `rm`: Remove files in interactive mode to prevent accidental deletions.

### Enhanced Change Directory
- `cd`: Change directory and list its contents.

### Text Editor and Development Tools
- `g`: Open files with `gvim` if available, otherwise use `vim`.
- `code`: Open the current directory in Visual Studio Code if installed.

### Search and Grep
- `grep`: Use `grep` with color output by default.

### Additional Navigation Shortcuts
- `..`: Move up one directory.
- `...`: Move up two directories.
- `....`: Move up three directories.

## Environment Management

### `env_manager.py`

This script allows you to manage environment variables stored in a JSON file. It provides two main commands: `write` and `read`.

#### Usage

- **Write a variable**:
  ```bash
  python3 env_manager.py write [key1][key2] value
