// FEUP THESIS TEMPLATE for Typst
// Main package exports
// FEUP, July 2025 (Typst version)

// Import all template modules
#import "template.typ": feup-thesis
#import "covers.typ": make-cover, make-committee-page
#import "toc.typ": make-toc
#import "utils.typ": *
#import "chapters.typ"

// Export the main template function
#let template = feup-thesis

// Export utility functions
#let cover = make-cover
#let committee-page = make-committee-page
#let table-of-contents = make-toc

// Export chapter utilities module
#let chapter-utils = chapters
