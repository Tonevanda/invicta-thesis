#!/bin/bash

# Script to install FEUP thesis template as local Typst package

TARGET_DIR="/Users/tonevanda/Library/Application Support/typst/packages/local/feup-thesis/1.0.0"

echo "Installing FEUP thesis template to local Typst packages..."

# Create directory structure if it doesn't exist
mkdir -p "$TARGET_DIR"

# Copy the src folder, template folder, and typst.toml
echo "Copying src/ folder..."
cp -r src "$TARGET_DIR/"

echo "Copying template/ folder..."
cp -r template "$TARGET_DIR/"

echo "Copying typst.toml..."
cp typst.toml "$TARGET_DIR/"

echo ""
echo "Installation complete!"
echo ""
echo "Package installed to: $TARGET_DIR"
echo ""
echo "Contents:"
ls -la "$TARGET_DIR"
echo ""
echo "You can now use: #import \"@local/feup-thesis:1.0.0\": *"
echo ""
echo "To uninstall, run:"
echo "  rm -rf \"/Users/tonevanda/Library/Application Support/typst/packages/local/feup-thesis\""
