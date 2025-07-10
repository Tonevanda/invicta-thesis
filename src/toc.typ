// Table of contents functions for FEUP thesis

// Helper function for table of contents
#let make-toc() = {
  
  outline(
    title: "Table of Contents",
    depth: 3,
    indent: auto,
  )
  
  pagebreak()
  
  outline(
    title: "List of Figures",
    target: figure.where(kind: image),
  )
  
  pagebreak()
  
  outline(
    title: "List of Tables",
    target: figure.where(kind: table)
  )
  
  pagebreak()
}
