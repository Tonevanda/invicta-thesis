#!/bin/bash

# Script to set up local development environment for FEUP thesis package

echo "Setting up local development environment..."

# 1. Update template files to use local imports
echo "Updating template files to use local imports..."

# Update main.typ
sed -i.bak 's|#import "@preview/feup-thesis:1.0.0": \*|// #import "@preview/feup-thesis:1.0.0": *|' template/main.typ
sed -i.bak 's|// #import "../src/lib.typ": \*|#import "../src/lib.typ": *|' template/main.typ

# Update main-chapters.typ
sed -i.bak 's|#import "@preview/feup-thesis:1.0.0": \*|// #import "@preview/feup-thesis:1.0.0": *|' template/main-chapters.typ
sed -i.bak 's|// #import "../src/lib.typ": \*|#import "../src/lib.typ": *|' template/main-chapters.typ

# Update _utils.typ
sed -i.bak 's|#import "@preview/feup-thesis:1.0.0": \*|// #import "@preview/feup-thesis:1.0.0": *|' template/chapters/_utils.typ
sed -i.bak 's|// #import "../../src/lib.typ": \*|#import "../../src/lib.typ": *|' template/chapters/_utils.typ

# 2. Clean up backup files
rm -f template/*.bak template/chapters/*.bak

# 3. Test compilation
echo "Testing local compilation..."
typst compile --root . template/main.typ && echo "✓ main.typ compiled successfully"
typst compile --root . template/main-chapters.typ && echo "✓ main-chapters.typ compiled successfully"

echo ""
echo "Local development environment ready!"
echo ""
echo "To compile templates locally, use:"
echo "  typst compile --root . template/main.typ"
echo "  typst compile --root . template/main-chapters.typ"
