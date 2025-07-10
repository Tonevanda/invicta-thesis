// FEUP THESIS TEMPLATE
// Main template function and document setup

#import "covers.typ": make-cover, make-committee-page
#import "toc.typ": make-toc

// Helper function to get degree-specific defaults
#let get-degree-defaults(degree-type) = {
  let defaults = (
    "meec": (
      department: "Department of Electrical and Computer Engineering",
      degree-full: "Master in Electrical and Computer Engineering"
    ),
    "meic": (
      department: "Department of Informatics Engineering", 
      degree-full: "Master in Informatics and Computing Engineering"
    ),
    "mem": (
      department: "Department of Mechanical Engineering",
      degree-full: "Master in Mechanical Engineering"
    ),
    "mesw": (
      department: "Department of Informatics Engineering",
      degree-full: "Master in Software Engineering"
    ),
    "mci": (
      department: "Department of Industrial Engineering and Management",
      degree-full: "Master in Industrial Engineering and Management"
    ),
    "generic": (
      department: "Faculty of Engineering",
      degree-full: "Master's Degree"
    )
  )
  
  return defaults.at(degree-type, default: defaults.generic)
}

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
  logo: none,
  additional-front-text: none,
  
  // Committee information
  committee-text: none, // Put text if final version
  committee-members: (),
  signature: false,   // true if handwritten signature 
  dedication-text: none, // Optional dedication

  // Configuration options
  stage: "preparation", // "preparation", "juri", "final"
  language: "en", // "en", "pt"
  degree-type: "meic", // "meec", "meic", "mem", "mesw", "mci", "generic"
  has-unsdg: false, // true if your thesis has united nations sustainable development goals
  has-quote: true,  // true if your thesis has a quote
  bib-style: "ieee", // bibliography style: e.g, "apa", "chicago-notes", "mla"
  
  // Document body
  body
) = {
  
  // Get degree-specific defaults
  let degree-defaults = get-degree-defaults(degree-type)
  
  // Create configuration object
  let config = (
    title: title,
    author: author,
    degree: degree,
    supervisor: supervisor,
    second-supervisor: second-supervisor,
    thesis-date: thesis-date,
    copyright-notice: copyright-notice,
    logo: logo,
    additional-front-text: additional-front-text,
    committee-text: committee-text,
    committee-members: committee-members,
    signature: signature,
    stage: stage,
    language: language,
    degree-type: degree-type,
    has-unsdg: has-unsdg,
    has-quote: has-quote,
    bib-style: bib-style,
    department: degree-defaults.department,
    degree-full: degree-defaults.degree-full,
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
    number-align: center,
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
