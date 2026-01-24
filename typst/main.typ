#set page(margin: 0.625in, columns: 2)
#set par(
  leading: 0.75em,
  first-line-indent: (amount: 1.8em, all: true),
  justify: true,
  spacing: 1.25em
)
#show heading: set block(above: 2em, below: 1.5em)
#set heading(numbering: "1.")
#set text(10pt, font: "Source Han Serif")
#show quote: it => {
  block(
    fill: color.mix((gray, 0.1), (white, 0.9)),
    outset: (left: 0.4em, right: 0.4em),
    inset: (top: 1em, bottom: 1em),
    above: 1em,
    below: 1em,
    stroke: (left: (paint: gray, thickness: 0.3em)),
    it
  )
}

#include "parts/math/_index.typ"
#include "parts/economics/_index.typ"
