// FEUP THESIS STYLE for Typst
// Converted from LaTeX feupteses template
// FEUP, July 2025 (Typst version)

#import "utils.typ": *

// Document setup
#set document(
  title: "DISSERTATION-TITLE",
  author: "FULL-NAME",
  date: datetime.today(),
)

// Page setup
#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 3cm,
    right: 2.5cm,
  ),
  numbering: "1",
  number-align: center,
)

// Text formatting
#set text(
  size: 11pt,
  lang: "en",
)

// Paragraph formatting
#set par(
  justify: true,
  first-line-indent: (amount: 1.5em, all:false),
  spacing: 1.2em,
)

// Heading formatting
#show heading.where(level: 1): it => [
  #pagebreak(weak: true)
  #v(2em)
  #if it.numbering != none {
    let chapter_num = counter(heading).get().first()
    block(
      text(size: 20pt, weight: "bold", [Chapter #chapter_num])
    )
  }
  #v(1em)
  #block(
    text(size: 26pt, weight: "bold", it.body)
  )
  #v(2em)
]


#set heading(numbering: "1.1")

// Figure and table formatting
#set figure(
  gap: 1em,
  supplement: [Figure],
)

#set table(
  stroke: 0.5pt,
  fill: (x, y) => if y == 0 { gray.lighten(80%) },
)

// Link formatting
#show link: it => text(fill: blue, it)

// Configuration variables
#let thesis-config = (
  title: "<DISSERTATION-TITLE>",
  author: "<FULL-NAME>",
  degree: "<DEGREE>",
  supervisor: "<SUPERVISOR>",
  second-supervisor: "<SUPERVISOR>",
  thesis-date: none, // If none, thesis-date will be calculated in the moment
  copyright-notice: "<NAME>, <YEAR>",
  logo: "figures/uporto-feup.png",
  additional-front-text: none,
  committee-text: "Approved in oral examination by the committee:", // Put none if not final version
  committee-members: (
    (role: "President", name: "Prof. Name of the President"),
    (role: "Referee", name: "Prof. Name of the First Referee"),
    (role: "Referee", name: "Prof. Name of the Second Referee"),
  ),
  signature: false,   // true if handwritten signature
  stage: "preparation", // "preparation", "juri", "final"
  language: "en", // "en", "pt"
  degree-type: "meic", // "meec", "meic", "mem", "mesw", "mci", "generic"
  has-unsdg: false, // true if your thesis has united nations sustainable development goals
  has-quote: true,  // true if your thesis has a quote
  bib-style: "ieee", //bibliography style: e.g, "apa", "chicago-notes", "mla"
)

// Main document structure
#make-cover(thesis-config)

// Preliminary materials
#make-committee-page(thesis-config)

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

// UN-SDG, if applicable
#if (thesis-config.has-unsdg) {
  
  heading(level: 1, numbering: none)[United Nations Sustainable Development Goals]
  
  // Insert UN SDG content here
  include "prologue/unsdg.typ"
  
  pagebreak()
}

// Acknowledgments
#heading(level: 1, numbering: none)[Acknowledgments]

#include "prologue/acknowns.typ"

#linebreak()
#thesis-config.author

#pagebreak()

// Quote (optional)
#if (thesis-config.has-quote) {
  include "prologue/quote.typ"
}

#pagebreak()

// Table of Contents
#make-toc()

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
  [SQL], [Structured Query Language],
  [UI], [User Interface],
  [URL], [Uniform Resource Locator],
  [XML], [eXtensible Markup Language],
)

#pagebreak()

// Start main body with arabic numbering
#set page(numbering: "1")
#counter(page).update(1)

// Chapter 1
#heading(level: 1)[Introduction]

This is where your introduction chapter would begin. You can structure your thesis with multiple chapters by using the heading function with level 1 for chapters and level 2 for sections.

#lorem(1000)

#figure(
  table(
    columns: (auto, auto),
    [a], [b]
  ),
  caption: [Example table],
) <tab:table-example>

= Background

This is a section within the introduction chapter.

#figure(
  image("figures/uporto.png"),
  caption: [Example figure],
) <tab:image-example>

= Related Work

Another section with your research questions.

= Solution

== Subsection of Solution

Outline of your thesis structure.

#pagebreak()

// Chapter 2
#heading(level: 1)[Literature Review]

This would be your literature review chapter.

= Related Work

Discuss related work in your field.

== Theoretical Framework

Present the theoretical foundations.

#pagebreak()

// Chapter 3
#heading(level: 1)[Methodology]

Describe your methodology here.

== Research Approach

Explain your research approach.

== Data Collection

Describe how you collected data.

== Analysis Methods

Explain your analysis methods.

#pagebreak()

// Bibliography
#heading(level: 1, numbering: none)[Bibliography]

#bibliography("refs.bib", title: none, style: thesis-config.bib-style)

#pagebreak()

// Appendices
#set heading(numbering: "A.1", level: 1)
#counter(heading).update(0)

#heading[Appendix A – Additional Materials]

#heading(level: 2)[Subsection One]

This is a subsection of the Appendix A

#heading[Appendix B]

// End of document