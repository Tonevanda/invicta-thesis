# Typst Universe Submission Guide

This guide explains how to submit the FEUP thesis template to Typst Universe.

## Prerequisites

1. Ensure your package is ready for submission:
   - All template files use the published package import (`@preview/feup-thesis:1.0.0`)
   - All source code is in the `src/` directory with `lib.typ` as the entrypoint
   - `typst.toml` has correct metadata
   - Template examples are in the `template/` directory

2. Your GitHub repository is public and contains all package files

## Submission Steps

### 1. Prepare the Package

Run the preparation script to switch template files to use the published package:

```bash
./prepare-package.sh
```

### 2. Commit and Push Changes

```bash
git add .
git commit -m "Prepare package for Typst Universe submission"
git push origin master
```

### 3. Create a Release on GitHub

1. Go to your GitHub repository: https://github.com/Tonevanda/feup-thesis
2. Click on "Releases" in the right sidebar
3. Click "Create a new release"
4. Tag version: `v1.0.0` (must match version in `typst.toml`)
5. Release title: `FEUP Thesis Template v1.0.0`
6. Description: Brief description of the template and its features
7. Click "Publish release"

### 4. Submit to Typst Universe

1. Go to the Typst Universe packages page: https://typst.app/packages
2. Click "Submit Package" or similar
3. Provide your GitHub repository URL: `https://github.com/Tonevanda/feup-thesis`
4. The system will automatically detect your `typst.toml` and validate the package
5. Follow any additional instructions provided by the Typst team

### 5. Wait for Approval

The Typst team will review your package. This may take some time. Once approved, your package will be available as:

```typst
#import "@preview/feup-thesis:1.0.0": *
```

## Package Structure

Your package should have this structure:

```
feup-thesis/
├── typst.toml                 # Package metadata
├── src/
│   ├── lib.typ               # Main entrypoint
│   ├── template.typ          # Core template logic
│   ├── covers.typ            # Cover pages
│   ├── toc.typ              # Table of contents
│   ├── utils.typ            # Utility functions
│   └── figures/             # Logo files
└── template/                # Example usage
    ├── main.typ             # Monolithic example
    ├── main-chapters.typ    # Split-chapter example
    ├── chapters/            # Chapter files
    ├── prologue/            # Front matter
    ├── figures/             # Images
    └── refs.bib             # Bibliography
```

## After Publication

Once your package is published:

1. Update your documentation to reference the published package
2. Switch back to local development if needed using `./setup-dev.sh`
3. For future updates, increment the version in `typst.toml` and create new releases

## Troubleshooting

- Ensure your `typst.toml` version matches your Git tag
- Make sure all files are properly committed to your repository
- Verify that template files compile correctly (they may fail locally since the package isn't published yet, but syntax should be correct)
- Check that the `entrypoint` in `typst.toml` points to a valid file (`src/lib.typ`)
