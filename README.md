# FEUP Thesis Template

An unofficial Master's thesis template for the Faculty of Engineering of the University of Porto (FEUP) written in Typst.

This template provides a clean and professional layout that follows FEUP's thesis formatting requirements, offering a modern alternative to LaTeX templates.

## Features

- **Clean and modern layout** following FEUP guidelines
- **Automatic cover page generation** with university branding
- **Committee approval page** for final submissions
- **Multi-language support** (English and Portuguese)
- **Flexible configuration** through simple parameters
- **Built-in bibliography support** with multiple citation styles
- **Table of contents, figures, and tables** generation
- **UN Sustainable Development Goals** section (optional)
- **Quote page** support (optional)

## Prerequisites

If you are using the Typst web app, no additional setup is required.

For offline compilation, ensure you have Typst installed on your system.

## Usage

There are two ways to use this template:

### Published Package (Recommended)

Once published on Typst Universe, import the template like this:

```typst
#import "@preview/feup-thesis:1.0.0": *
```

### Local Development

For local development or if you want to modify the template:

1. Clone this repository
2. Run the development setup script:
   ```bash
   ./setup-dev.sh
   ```
3. Use local imports in your documents:
   ```typst
   #import "../src/lib.typ": *
   ```
4. Compile with the root flag:
   ```bash
   typst compile --root . template/main.typ
   ```

### Quick Start

1. Import the template in your main document:

```typst
#import "@preview/feup-thesis:1.0.0": *typst
#import "@preview/feup-thesis:1.0.0": *
```

2. Apply the template with your configuration:

```typst
#show: template.with(
  title: "Your Thesis Title",
  author: "Your Full Name",
  degree: "Master in Electrical and Computer Engineering",
  supervisor: "Prof. Your Supervisor Name",
  // ... other configuration options
)
```

3. Write your content using standard Typst markup.

### Local Development

For local development and testing, you can use:

```typst
#import "src/lib.typ": *
```

See `example.typ` for a complete working example with all features demonstrated.

### Configuration Options

The template accepts the following parameters:

#### Document Metadata
- `title`: Your thesis title
- `author`: Your full name
- `degree`: Your degree program
- `supervisor`: Main supervisor name
- `second-supervisor`: Second supervisor name (optional)

#### Dates and Copyright
- `thesis-date`: Specific date (if none, current date is used)
- `copyright-notice`: Copyright notice text

#### Visual Elements
- `logo`: Path to university logo
- `additional-front-text`: Additional text for cover page

#### Committee Information
- `committee-text`: Committee approval text (for final versions)
- `committee-members`: Array of committee members with roles and names
- `signature`: Whether to include signature line

#### Configuration
- `stage`: Document stage ("preparation", "juri", "final")
- `language`: Document language ("en", "pt")
- `degree-type`: Degree type ("meec", "meic", "mem", "mesw", "mci", "generic")
- `has-unsdg`: Include UN SDG section
- `has-quote`: Include quote page
- `bib-style`: Bibliography style ("ieee", "apa", "chicago-notes", "mla")

### Example Configuration

```typst
#show: template.with(
  title: "Advanced Machine Learning Techniques for Computer Vision",
  author: "João Silva",
  degree: "Master in Electrical and Computer Engineering",
  supervisor: "Prof. Maria Santos",
  second-supervisor: "Prof. Pedro Costa",
  copyright-notice: "João Silva, 2025",
  committee-text: "Approved in oral examination by the committee:",
  committee-members: (
    (role: "President", name: "Prof. Ana Ferreira"),
    (role: "Referee", name: "Prof. Carlos Oliveira"),
    (role: "Referee", name: "Prof. Luisa Rodrigues"),
  ),
  stage: "final",
  language: "en",
  has-quote: true,
  bib-style: "ieee",
)
```

## Document Structure

The template automatically generates:

1. **Cover page** with university branding
2. **Committee approval page** (if configured)
3. **Abstract** and **Resumo** sections
4. **Acknowledgments** section
5. **Quote page** (if enabled)
6. **Table of Contents, List of Figures, List of Tables**
7. **Abbreviations** section
8. **Main content** with proper chapter formatting
9. **Bibliography** section
10. **Appendices** with appropriate numbering

## File Organization

Your project should be organized as follows:

```
your-thesis/
├── main.typ
├── refs.bib
├── figures/
│   ├── uporto-feup.png
│   └── your-figures...
└── prologue/
    ├── abstract.typ
    ├── resumo.typ
    ├── acknowns.typ
    ├── quote.typ
    └── unsdg.typ
```

## Chapter and Section Formatting

The template provides automatic formatting for:

- **Level 1 headings**: Chapters with "Chapter X" prefix
- **Level 2+ headings**: Sections and subsections
- **Figures and tables**: With automatic numbering and captions
- **Bibliography**: Using your preferred citation style

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests to improve this template.

## License

This template is released under the MIT License. See the LICENSE file for details.

## Acknowledgments

This template was created for the FEUP community and is not officially endorsed by the university. The FEUP logo and university branding remain property of the Faculdade de Engenharia da Universidade do Porto.

---

**Note**: This is an unofficial template. Always verify that your thesis meets current FEUP requirements before submission.
