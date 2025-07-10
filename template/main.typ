// Example file for local development and testing
// This file demonstrates the template with a complete thesis example
// To use: copy this as your starting point and modify as needed

// Use this import when the package is published to Typst Universe
// // #import "@preview/feup-thesis:1.0.0": *

// For local development, use:
#import "@local/feup-thesis:1.0.0" as feup

#show: feup.template.with(
  // Document metadata
  title: "Example FEUP Thesis",
  author: "John Doe",
  degree: "Master in Informatics and Computing Engineering",
  supervisor: "Prof. Jane Smith",
  second-supervisor: "Prof. Bob Johnson",
  
  // Dates and copyright
  thesis-date: none, // Will use current date
  copyright-notice: "John Doe, 2025",
  
  // Visual elements
  additional-front-text: none,
  
  // Committee information (example for final version), use none otherwise
  committee-text: "Approved in oral examination by the committee:",
  committee-members: (
    (role: "President", name: "Prof. Maria Santos"),
    (role: "Referee", name: "Prof. Carlos Silva"),
    (role: "Referee", name: "Prof. Ana Costa"),
  ),
  signature: false,
  
  dedication-text: "To my family, whose unwavering support has been the foundation of my academic journey.",
  
  // Configuration options
  stage: "final", // This is a final version
  language: "en",
  degree-type: "meic",
  has-unsdg: false, // Include UN SDG section
  has-quote: true,
  bib-style: "ieee",
)

// Optional
#feup.dedication(
  text("To my family, whose unwavering support has been the foundation of my academic journey.", hyphenate: false),
)

// Resumo
#set page(numbering: "i", number-align: bottom + center)
#counter(page).update(1)
#heading(level: 1, numbering: none)[Resumo]

#include "prologue/resumo.typ"

// Abstract
#heading(level: 1, numbering: none)[Abstract]

#include "prologue/abstract.typ"

// UN-SDG (example)
#heading(level: 1, numbering: none)[United Nations Sustainable Development Goals]

#include "prologue/unsdg.typ"

// Acknowledgments
#heading(level: 1, numbering: none)[Acknowledgments]

#include "prologue/acknowns.typ"

// Quote
#feup.epigraph(
  "The best way to predict the future is to invent it.",
  "Alan Kay"
)

// Table of Contents
#feup.table-of-contents()

// List of Acronyms
#feup.acronym-list((
    ("AI", "Artificial Intelligence"),
    ("API", "Application Programming Interface"),
    ("CNN", "Convolutional Neural Network"),
    ("CPU", "Central Processing Unit"),
    ("GPU", "Graphics Processing Unit"),
    ("ML", "Machine Learning"),
    ("NLP", "Natural Language Processing"),
    ("RNN", "Recurrent Neural Network"),
    ("SGD", "Stochastic Gradient Descent"),
    ("UI", "User Interface"),
  ),
)

// Start main body with arabic numbering
#set page(numbering: "1", number-align: top + right)
#counter(page).update(1)

// Mark the start of main content for table of contents
<main-content>

// CHAPTERS - Include your chapter files here
// Follow the chapter-template.typ structure
// 
#include "chapters/1-introduction.typ"
#include "chapters/2-literature-review.typ"
#include "chapters/3-theoretical-foundations.typ"
#include "chapters/4-methodology.typ"
#include "chapters/5-result-and-analysis.typ"
#include "chapters/6-conclusions-and-future-work.typ"

// Bibliography
#heading(level: 1, numbering: none)[Bibliography]
#bibliography("refs.bib", title: none, style: "ieee")
#pagebreak()

// Appendices
#set heading(numbering: "A.1", level: 1)
#counter(heading).update(0)

#include "appendixes/A-implementation-details.typ"
#include "appendixes/B-additional-results.typ"

// End of document
