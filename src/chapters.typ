// Chapter utilities for FEUP thesis template
// Import this at the top of each chapter file to access template functions

// Re-export all utility functions so chapters can use them
#import "utils.typ": *

// Function to set up chapter-specific bibliography context
#let chapter-bib(bib-file: "refs.bib", style: "ieee") = {
  // This can be called within a chapter to include bibliography entries
  bibliography(bib-file, title: none, style: style)
}

// Function to create a chapter with proper formatting
#let chapter(title, content) = {
  heading(level: 1)[#title]
  content
}

// Function to include a figure with proper path resolution
#let chapter-figure(image-path, caption: none, width: 80%, label: none) = {
  figure(
    image(image-path, width: width),
    caption: caption,
  )
}
