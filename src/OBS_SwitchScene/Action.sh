#!/bin/bash

# Check if obs-cmd exists and is executable
if [[ ! -x /usr/local/bin/obs-cmd ]]; then
    echo "obs-cmd not installed. Please install via Homebrew"
    exit 1
fi

# Execute obs-cmd with the appropriate argument
/usr/local/bin/obs-cmd scene switch "$KMPARAM_Scene"