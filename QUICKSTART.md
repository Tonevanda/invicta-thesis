# FEUP Thesis Quick Start Guide

This guide will help you get started with the FEUP Thesis template quickly.

## Installation

### Option 1: Using Typst Package Manager (Recommended)

Add this to your main document:

```typst
#import "@preview/feup-thesis:1.0.0": *
```

### Option 2: Local Development

1. Clone or download this repository
2. Copy the `template/` folder contents to your project
3. Import from local source:

```typst
#import "../src/lib.typ": *
```

## Quick Setup

1. **Copy the template files**:
   ```
   cp -r template/* your-thesis-folder/
   ```

2. **Edit `main.typ`** with your information:
   ```typst
   #show: template.with(
     title: "Your Actual Thesis Title",
     author: "Your Full Name",
     degree: "Your Degree Program",
     supervisor: "Prof. Your Supervisor",
     // ... other settings
   )
   ```

3. **Add your content** in the appropriate sections

4. **Compile** your document:
   ```bash
   typst compile main.typ
   ```

## Essential Files to Edit

- **`main.typ`**: Template configuration and main content
- **`prologue/abstract.typ`**: Your thesis abstract
- **`prologue/resumo.typ`**: Portuguese abstract
- **`prologue/acknowns.typ`**: Acknowledgments
- **`prologue/quote.typ`**: Optional quote page
- **`refs.bib`**: Bibliography references

## Common Configuration

### For Final Submission
```typst
#show: template.with(
  stage: "final",
  committee-text: "Approved in oral examination by the committee:",
  committee-members: (
    (role: "President", name: "Prof. Name"),
    (role: "Referee", name: "Prof. Name"),
    (role: "Referee", name: "Prof. Name"),
  ),
  signature: true,
)
```

### For Preparation/Draft
```typst
#show: template.with(
  stage: "preparation",
  committee-text: none,
  committee-members: (),
  signature: false,
)
```

### Different Degree Types
```typst
// For Electrical and Computer Engineering
degree-type: "meec"

// For Informatics and Computing Engineering  
degree-type: "meic"

// For Mechanical Engineering
degree-type: "mem"

// For Software Engineering
degree-type: "mesw"

// For Industrial Engineering and Management
degree-type: "mci"
```

## Adding Content

### Chapters
```typst
= Introduction
Your chapter content here...

== Background
Section content...

=== Subsection
Subsection content...
```

### Figures
```typst
#figure(
  image("figures/your-image.png", width: 80%),
  caption: [Your figure caption],
) <fig:your-label>

Reference it with @fig:your-label
```

### Tables
```typst
#figure(
  table(
    columns: (auto, auto, auto),
    [Header 1], [Header 2], [Header 3],
    [Data 1], [Data 2], [Data 3],
  ),
  caption: [Your table caption],
) <tab:your-label>
```

### Bibliography
Add entries to `refs.bib`:
```bibtex
@article{key,
  title = {Article Title},
  author = {Author Name},
  journal = {Journal Name},
  year = {2024}
}
```

Cite with `@key` or `#cite("key")`

## Troubleshooting

### Common Issues

**Bibliography not showing**: Check that `refs.bib` is in the correct location and has valid entries

**Chapters not formatting correctly**: Ensure you're using `#heading(level: 1)[name]` for level 1 headings

### Getting Help

- Check the main README.md for detailed documentation
- Look at `example.typ` for a complete working example
- Submit issues on the repository for bugs or feature requests

## Example Complete Setup

```typst
#import "@preview/feup-thesis:1.0.0": *

#show: template.with(
  title: "Machine Learning for Computer Vision Applications",
  author: "Maria Silva",
  degree: "Master in Electrical and Computer Engineering",
  supervisor: "Prof. João Santos",
  copyright-notice: "Maria Silva, 2025",
  stage: "final",
  language: "en",
  bib-style: "ieee",
)

// Your content starts here...
```

Boa Sorte! 🎓
