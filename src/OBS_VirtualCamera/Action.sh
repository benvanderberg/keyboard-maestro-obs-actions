#!/bin/bash

# Check if obs-cmd exists and is executable
if [[ ! -x /usr/local/bin/obs-cmd ]]; then
    echo "obs-cmd not installed. Please install via Homebrew"
    exit 1
fi

# Validate input argument
case "$KMPARAM_Action" in
    Toggle|toggle)
        ARG="toggle"
        ;;
    Start|start)
        ARG="start"
        ;;
    Stop|stop)
        ARG="stop"
        ;;
    *)
        echo "Invalid argument. Please use 'Toggle', 'Off', or 'On'."
        exit 1
        ;;
esac

# Execute obs-cmd with the appropriate argument
/usr/local/bin/obs-cmd virtual-camera "$ARG"