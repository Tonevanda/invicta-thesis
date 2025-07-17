// Example file for local development and testing
// This file demonstrates the template with a complete thesis example
// To use: copy this as your starting point and modify as needed

// Use this import when the package is published to Typst Universe
// // #import "@preview/feup-thesis:1.0.0": *

// For local development, use:
#import "@local/feup-thesis:1.0.0" as feup

#show: feup.template.with(
  // Document metadata
  title: "<DISSERTATION TITLE>",
  author: "<YOUR FULL NAME>",
  degree: "<YOUR COURSE NAME>",
  supervisor: "<SUPERVISOR NAME>",
  second-supervisor: "<SECOND SUPERVISOR NAME>", // Optional, use none if not applicable
  
  // Dates and copyright
  thesis-date: none, // Will use current date
  copyright-notice: "<YOUR NAME>, <YEAR OF PUBLICATION>",
  
  // Visual elements
  additional-front-text: none,
  
  // Committee information (example for final version), use none otherwise
  committee-text: "Approved in oral examination by the committee:",
  committee-members: (
    (role: "President", name: "<COMMITTEE PRESIDENT NAME>"),
    (role: "Referee", name: "<COMMITTEE MEMBER NAME>"),
    (role: "Referee", name: "<COMMITTEE MEMBER NAME>"),
  ),
  signature: false,
  
  // Configuration options
  stage: "final", // This is a final version
  language: "en",
  has-unsdg: false, // Include UN SDG section
  has-quote: true,
  bib-style: "ieee",
)

// Optional, remove this if you don't want a dedication
#feup.dedication(
  text("Dedication text, if you want to.", hyphenate: false),
)

#set page(numbering: "i", number-align: bottom + center)
#counter(page).update(1)

// Resumo
#include "prologue/resumo.typ"

// Abstract
#include "prologue/abstract.typ"

// UN-SDG (example)
#include "prologue/unsdg.typ"

// Acknowledgments
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
#set page(
  numbering: none, // Disable automatic numbering since we handle it in header
  number-align: top + right,
  header: context {
    let current-page = here().page()
    let page-number = counter(page).at(here()).first()
    
    // Don't show header on chapter start pages
    let all-headings = query(heading)
    
    for h in all-headings {
      if h.level == 1 and h.location().page() == current-page {
        return align(right)[#text(size: 11pt)[#page-number]]
      }
    }
    
    // Get current chapter and section
    let chapter-headings = all-headings.filter(h => h.level == 1 and h.location().page() <= current-page)
    let section-headings = all-headings.filter(h => h.level == 2 and h.location().page() <= current-page)
    
    let header-content = none
    if chapter-headings.len() > 0 {
      let current-chapter = chapter-headings.last()
      let chapter-counter = counter(heading).at(current-chapter.location())
      let chapter-num = chapter-counter.first()
      
      // Check if this is odd or even page
      if calc.odd(current-page) {
        // Odd pages: show current subsection (if any)
        if section-headings.len() > 0 {
          let current-section = section-headings.last()
          let section-counter = counter(heading).at(current-section.location())
          header-content = text(size: 10pt, style: "italic")[
            #section-counter.first().#section-counter.at(1) #current-section.body
          ]
        } else {
          // If no subsection, show chapter
          header-content = text(size: 10pt, style: "italic")[
            #chapter-num #current-chapter.body
          ]
        }
      } else {
        // Even pages: show current chapter
        header-content = text(size: 10pt, style: "italic")[
          #chapter-num #current-chapter.body
        ]
      }
    }
    
    // Create header with content on left and page number on right
    grid(
      columns: (1fr, auto),
      align: (left, right),
      header-content,
      text(size: 11pt)[#page-number]
    )
  }
)
#counter(page).update(1)

// Mark the start of main content for table of contents
<main-content>

// CHAPTERS - Include your chapter files here
// Follow the chapter-template.typ structure

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

#set heading(numbering: "A.1", level: 1)
#counter(heading).update(0)

// Appendices
#include "appendixes/A-implementation-details.typ"
#include "appendixes/B-additional-results.typ"

// End of document
