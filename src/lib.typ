// INVICTA THESIS TEMPLATE for Typst
// Main package exports
// João Lourenço, July 2025 (Typst version)

// Import all template modules
#import "template.typ": invicta-thesis, main-content
#import "covers.typ": make-cover, make-committee-page
#import "toc.typ": make-toc
#import "utils.typ": *

// Export the main template function
#let template = invicta-thesis

// Export utility functions
#let cover = make-cover
#let committee-page = make-committee-page
#let table-of-contents = make-toc

// Export main content wrapper
#let main-content-wrapper = main-content

// Export bibliography function
#let make-bibliography(style) = {
  heading(level: 1, numbering: none)[Bibliography]
  bibliography("../template/refs.bib", style: style, title: "References")
  pagebreak()
}
// Export main content wrapper that retrieves config from state
#let main-content-wrapper = (body) => {
  context {
    let config = get-config()
    main-content(config, body)
  }
}
