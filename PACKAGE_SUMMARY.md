# FEUP Thesis Template - Package Summary

## 📖 Usage Examples

### Basic Usage
```typst
#import "@preview/feup-thesis:1.0.0": *

#show: template.with(
  title: "Your Thesis Title",
  author: "Your Name",
  supervisor: "Prof. Your Supervisor",
)

= Introduction
Your content here...
```

### Advanced Configuration
```typst
#show: template.with(
  title: "Advanced Machine Learning for Computer Vision",
  author: "Maria Silva",
  degree: "Master in Electrical and Computer Engineering",
  supervisor: "Prof. João Santos",
  committee-text: "Approved in oral examination by the committee:",
  committee-members: (
    (role: "President", name: "Prof. Ana Costa"),
    (role: "Referee", name: "Prof. Carlos Lima"),
  ),
  stage: "final",
  language: "en",
  bib-style: "ieee",
)
```

## 🛠 Available Utilities

- `#epigraph(quote, author)` - Quote with attribution
- `#code-block(code, caption)` - Syntax-highlighted code blocks
- `#algorithm(title, content)` - Algorithm pseudocode
- `#dedication(content)` - Dedication page
- `#acronym-list(acronyms)` - List of acronyms
- `#notation-list(symbols)` - Mathematical notation

## 🎓 Benefits for FEUP Students

1. **Modern Alternative**: Clean Typst syntax vs complex LaTeX
2. **Faster Compilation**: Near-instant PDF generation
3. **Professional Layout**: Follows FEUP formatting requirements
4. **Easy Customization**: Simple parameter configuration
5. **Rich Features**: Built-in utilities for common thesis elements
6. **Open Source**: MIT license allows modifications
