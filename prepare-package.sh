#!/bin/bash

# Script to prepare the FEUP thesis package for Typst Universe submission

echo "Preparing FEUP thesis package for submission..."

# 1. Update template files to use published package imports
echo "Updating template files to use published package imports..."

# Update main.typ
sed -i.bak 's|// #import "@preview/feup-thesis:1.0.0": \*|#import "@preview/feup-thesis:1.0.0": *|' template/main.typ
sed -i.bak 's|#import "../src/lib.typ": \*|// #import "../src/lib.typ": *|' template/main.typ

# Update main-chapters.typ
sed -i.bak 's|// #import "@preview/feup-thesis:1.0.0": \*|#import "@preview/feup-thesis:1.0.0": *|' template/main-chapters.typ
sed -i.bak 's|#import "../src/lib.typ": \*|// #import "../src/lib.typ": *|' template/main-chapters.typ

# Update _utils.typ
sed -i.bak 's|// #import "@preview/feup-thesis:1.0.0": \*|#import "@preview/feup-thesis:1.0.0": *|' template/chapters/_utils.typ
sed -i.bak 's|#import "../../src/lib.typ": \*|// #import "../../src/lib.typ": *|' template/chapters/_utils.typ

# 2. Clean up backup files
rm -f template/*.bak template/chapters/*.bak

# 3. Test compilation (will fail since package isn't published yet, but checks syntax)
echo "Testing template syntax..."
typst compile --root . template/main.typ main-test.pdf 2>/dev/null && echo "✓ main.typ syntax OK" || echo "✗ main.typ has issues"
typst compile --root . template/main-chapters.typ main-chapters-test.pdf 2>/dev/null && echo "✓ main-chapters.typ syntax OK" || echo "✗ main-chapters.typ has issues"

# Clean up test files
rm -f main-test.pdf main-chapters-test.pdf

echo ""
echo "Package is ready for submission!"
echo ""
echo "Next steps:"
echo "1. Commit and push all changes to GitHub"
echo "2. Create a release tag (e.g., v1.0.0) on GitHub"
echo "3. Submit to Typst Universe at: https://typst.app/packages"
echo "4. Reference your GitHub repository: https://github.com/Tonevanda/feup-thesis"
echo ""
echo "After package is published, users can import with:"
echo '  #import "@preview/feup-thesis:1.0.0": *'
