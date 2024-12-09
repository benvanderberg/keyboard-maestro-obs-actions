#!/bin/bash

# Check if package.json exists
if [[ ! -f package.json ]]; then
  echo "package.json not found in the current directory."
  exit 1
fi

# Read and parse the package.json file to get the name and version
PACKAGE_NAME=$(jq -r '.name' package.json)
CURRENT_VERSION=$(jq -r '.version' package.json)

# Ensure jq is installed
if [[ -z "$PACKAGE_NAME" || -z "$CURRENT_VERSION" ]]; then
  echo "Error reading package.json. Make sure it contains 'name' and 'version' fields."
  exit 1
fi

# Increment the version
IFS='.' read -r -a VERSION_PARTS <<< "$CURRENT_VERSION"
VERSION_PARTS[2]=$((VERSION_PARTS[2] + 1)) # Increment the patch version
NEW_VERSION="${VERSION_PARTS[0]}.${VERSION_PARTS[1]}.${VERSION_PARTS[2]}"

# Update the version in package.json
jq ".version = \"$NEW_VERSION\"" package.json > tmp.package.json && mv tmp.package.json package.json
echo "Updated version to $NEW_VERSION in package.json."

# Ensure src/ and dist/ directories exist
if [[ ! -d src ]]; then
  echo "src/ folder not found."
  exit 1
fi

mkdir -p dist

# Zip each folder in src/ into dist/ with the naming convention <PACKAGE_NAME>_<VERSION>.zip
for folder in src/*/; do
  # Remove the trailing slash from the folder name
  folder_name=$(basename "$folder")
  
  # Create the zip file in the dist/ folder
  zip -r "dist/${PACKAGE_NAME}_${NEW_VERSION}_${folder_name}.zip" "$folder"
done

echo "Zipped all folders in src/ to the dist/ folder."