#!/usr/bin/env python3
import os
import json
import sys

ENV_MANAGER_JSON_FILE = os.path.expanduser("/workspaces/codespaces-blank/config/python/env_manager.json")

def ensure_json_file_exists():
    if not os.path.exists(ENV_MANAGER_JSON_FILE):
        with open(ENV_MANAGER_JSON_FILE, 'w') as f:
            json.dump({}, f)

def write_to_json(keys, value):
    with open(ENV_MANAGER_JSON_FILE, 'r') as f:
        data = json.load(f)

    current_level = data
    for key in keys[:-1]:
        if key not in current_level:
            current_level[key] = {}
        current_level = current_level[key]

    current_level[keys[-1]] = value

    with open(ENV_MANAGER_JSON_FILE, 'w') as f:
        json.dump(data, f, indent=4)

def read_from_json(keys):
    with open(ENV_MANAGER_JSON_FILE, 'r') as f:
        data = json.load(f)

    current_level = data
    for key in keys:
        if key not in current_level:
            raise KeyError(f"Key '{key}' not found in JSON data")
        current_level = current_level[key]

    return current_level

def main():
    if len(sys.argv) < 2:
        print("Usage: env_manager write [key1][key2] value")
        print("       env_manager read [key1][key2]")
        sys.exit(1)

    command = sys.argv[1]
    keys_str = sys.argv[2]

    keys = []
    current_key = ""
    in_brackets = False
    for char in keys_str:
        if char == '[':
            in_brackets = True
        elif char == ']':
            in_brackets = False
            if current_key:
                keys.append(current_key)
                current_key = ""
        elif in_brackets:
            current_key += char

    if command == "write":
        if len(sys.argv) < 4:
            print("Usage: env_manager write [key1][key2] value")
            sys.exit(1)
        value = sys.argv[3]
        ensure_json_file_exists()
        write_to_json(keys, value)
        print(f"Written {keys} = {value} to {ENV_MANAGER_JSON_FILE}")
    elif command == "read":
        ensure_json_file_exists()
        try:
            value = read_from_json(keys)
            print(value)
        except KeyError as e:
            print(f"Error: {e}")
    else:
        print("Unknown command")
        sys.exit(1)

if __name__ == "__main__":
    main()
