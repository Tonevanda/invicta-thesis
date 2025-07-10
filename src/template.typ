// FEUP THESIS TEMPLATE
// Main template function and document setup

#import "covers.typ": make-cover, make-committee-page
#import "toc.typ": make-toc

// Main template function
#let feup-thesis(
  // Document metadata
  title: "<DISSERTATION-TITLE>",
  author: "<FULL-NAME>",
  degree: "<DEGREE>",
  supervisor: "<SUPERVISOR>",
  second-supervisor: none,
  
  // Dates and copyright
  thesis-date: none, // If none, current date will be used
  copyright-notice: none,
  
  // Visual elements
  additional-front-text: none,
  
  // Committee information
  committee-text: none, // Put text if final version
  committee-members: (),
  signature: false,   // true if handwritten signature 
  dedication-text: none, // Optional dedication

  // Configuration options
  stage: "preparation", // "preparation", "juri", "final"
  language: "en", // "en", "pt"
  has-unsdg: false, // true if your thesis has united nations sustainable development goals
  has-quote: true,  // true if your thesis has a quote
  bib-style: "ieee", // bibliography style: e.g, "apa", "chicago-notes", "mla"
  
  // Document body
  body
) = {
  
  // Create configuration object
  let config = (
    title: title,
    author: author,
    degree: degree,
    supervisor: supervisor,
    second-supervisor: second-supervisor,
    thesis-date: thesis-date,
    copyright-notice: copyright-notice,
    additional-front-text: additional-front-text,
    committee-text: committee-text,
    committee-members: committee-members,
    signature: signature,
    stage: stage,
    language: language,
    has-unsdg: has-unsdg,
    has-quote: has-quote,
    bib-style: bib-style,
  )

  // Document setup
  set document(
    title: title,
    author: author,
    date: datetime.today(),
  )

  // Page setup
  set page(
    paper: "a4",
    margin: (
      top: 2.5cm,
      bottom: 2.5cm,
      left: 3cm,
      right: 2.5cm,
    ),
    numbering: "1",
    number-align: top + right,
  )

  // Text formatting
  set text(
    size: 11pt,
    lang: language,
  )

  // Paragraph formatting
  set par(
    justify: true,
    first-line-indent: (amount: 1.5em, all: false),
    spacing: 1.2em,
  )

  // Heading formatting
  show heading.where(level: 1): it => [
    #pagebreak(weak: true)
    #v(2em)
    #if it.numbering != none {
      let chapter_num = counter(heading).get().first()
      
      // Check if this is an appendix by looking at the numbering pattern
      if it.numbering == "A.1" {
        // Convert number to letter (1=A, 2=B, etc.)
        let appendix_letter = str.from-unicode(65 + chapter_num - 1) // 65 is ASCII for 'A'
        block(
          text(size: 20pt, weight: "bold", [Appendix #appendix_letter])
        )
      } else {
        block(
          text(size: 20pt, weight: "bold", [Chapter #chapter_num])
        )
      }
    }
    #v(1em)
    #block(
      text(size: 26pt, weight: "bold", it.body)
    )
    #v(2em)
  ]

  set heading(numbering: "1.1")

  // Figure and table formatting
  set figure(
    gap: 1em,
    supplement: [Figure],
  )

  set table(
    stroke: 0.5pt,
    fill: (x, y) => if y == 0 { gray.lighten(80%) },
  )

  // Link formatting
  show link: it => text(fill: blue, it)

  // Generate the document
  // Main document structure
  make-cover(config)

  // Preliminary materials
  make-committee-page(config)

  // Apply styling to body content
  body
}
