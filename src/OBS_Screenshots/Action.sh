#!/bin/bash


# Assign input arguments to variables
SOURCE="$KMPARAM_Source"
FORMAT="$KMPARAM_Format"
FILE_PATH="$KMPARAM_OutputPath"
WIDTH="$KMPARAM_Width"
HEIGHT="$KMPARAM_Height"

# Validate format
if [[ "$FORMAT" != "jpg" && "$FORMAT" != "png" ]]; then
    echo "Error: Format must be either 'jpg' or 'png'."
    usage
fi

# Build the obs-cmd command
CMD="/usr/local/bin/obs-cmd save-screenshot \"$SOURCE\" \"$FORMAT\" \"$FILE_PATH\""

# Add width if specified and valid
if [[ -n "$WIDTH" && "$WIDTH" =~ ^[0-9]+$ ]]; then
    CMD+=" --width=$WIDTH"
fi

# Add height if specified and valid
if [[ -n "$HEIGHT" && "$HEIGHT" =~ ^[0-9]+$ ]]; then
    CMD+=" --height=$HEIGHT"
fi

# Run the obs-cmd command
eval $CMD

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Screenshot saved successfully to $FILE_PATH."
else
    echo "Error: Failed to save screenshot."
    exit 1
fi