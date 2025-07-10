// Use this import when the package is published to Typst Universe
// #import "@preview/feup-thesis:1.0.0": *

// For local development, use:
#import "../src/lib.typ": *

#show: template.with(
  // Document metadata
  title: "Your Thesis Title Here",
  author: "Your Full Name",
  degree: "Master in Electrical and Computer Engineering",
  supervisor: "Prof. Your Supervisor Name",
  second-supervisor: none, // Optional second supervisor
  
  // Dates and copyright
  thesis-date: none, // If none, current date will be used
  copyright-notice: "Your Name, 2025",
  
  // Visual elements
  logo: "figures/uporto-feup.png", // Path to FEUP logo
  additional-front-text: none,
  
  // Committee information (only for final version)
  committee-text: none, // "Approved in oral examination by the committee:" for final version
  committee-members: (
    // (role: "President", name: "Prof. Name of the President"),
    // (role: "Referee", name: "Prof. Name of the First Referee"),
    // (role: "Referee", name: "Prof. Name of the Second Referee"),
  ),
  signature: false,   // true if handwritten signature needed
  
  // Configuration options
  stage: "preparation", // "preparation", "juri", "final"
  language: "en", // "en", "pt"
  degree-type: "meic", // "meec", "meic", "mem", "mesw", "mci", "generic"
  has-unsdg: false, // true if your thesis has UN sustainable development goals
  has-quote: true,  // true if your thesis has a quote page
  bib-style: "ieee", // bibliography style: e.g, "apa", "chicago-notes", "mla"
)

// Abstract
#set page(numbering: "i")
#counter(page).update(1)

#heading(level: 1, numbering: none)[Abstract]

// Abstract Text
#include "prologue/abstract.typ"

#pagebreak()

// Resumo
#heading(level: 1, numbering: none)[Resumo]

#include "prologue/resumo.typ"

#pagebreak()

// Acknowledgments
#heading(level: 1, numbering: none)[Acknowledgments]

#include "prologue/acknowns.typ"

#linebreak()
Your Full Name

#pagebreak()

#pagebreak()

// Table of Contents
#table-of-contents()

// Abbreviations
#heading(level: 1, numbering: none)[List of Abbreviations]

// Define abbreviations here
#table(
  columns: (1fr, 3fr),
  stroke: none,
  fill: none,
  [API], [Application Programming Interface],
  [CPU], [Central Processing Unit],
  [GPU], [Graphics Processing Unit],
  [HTTP], [HyperText Transfer Protocol],
  [JSON], [JavaScript Object Notation],
  [ML], [Machine Learning],
  [SQL], [Structured Query Language],
  [UI], [User Interface],
  [URL], [Uniform Resource Locator],
  [XML], [eXtensible Markup Language],
)

#pagebreak()

// Start main body with arabic numbering
#set page(numbering: "1")
#counter(page).update(1)

// CHAPTERS - Include your chapter files here
// Each chapter file should import the template utilities at the top

#include "chapters/1-introduction.typ"
#pagebreak()

#include "chapters/2-literature-review.typ"
#pagebreak()

// Add more chapters as needed
// #include "chapters/3-methodology.typ"
// #pagebreak()

// #include "chapters/4-results.typ"
// #pagebreak()

// #include "chapters/5-conclusions.typ"
// #pagebreak()

// Bibliography
#heading(level: 1, numbering: none)[Bibliography]

#bibliography("refs.bib", title: none, style: "ieee")

#pagebreak()

// Appendices
#set heading(numbering: "A.1", level: 1)
#counter(heading).update(0)

#heading[Appendix A – Additional Materials]

#heading(level: 2)[Subsection One]

This is a subsection of the Appendix A

#heading[Appendix B]

// End of document
