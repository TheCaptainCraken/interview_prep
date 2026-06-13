#import "@preview/lovelace:0.3.1": *

// ── Palette (warm gruvbox-light) ────────────────────────────────
#let paper = rgb("#f9f5d7") // page background, soft cream
#let ink = rgb("#282828") // body text
#let ink-muted = rgb("#7c6f64") // captions, page numbers, labels
#let accent = rgb("#af3a03") // burnt orange — headings, markers
#let gold = rgb("#b57614")
#let green = rgb("#79740e")
#let red = rgb("#9d0006")
#let blue = rgb("#076678")

// Legacy aliases kept for older chapters.
#let yellow = gold
#let white_green = paper.darken(4%)
#let text_color = ink
#let foreground = paper

#let code-bg = paper.darken(4%)
#let code-stroke = paper.darken(16%)

#let init-doc(body) = {
  set document(
    title: "Technical Interview Prep",
    author: "Pietro Agnoli",
  )

  set page(
    paper: "a4",
    fill: paper,
    numbering: "1",
    header: context if counter(page).get().first() > 3 [
      #text(
        font: "Fraunces",
        size: 7.5pt,
        weight: "semibold",
        tracking: 0.14em,
        fill: ink-muted,
      )[
        #upper[Technical Interview Prep]
        #h(1fr)
        #upper[made with #emoji.heart by Pi]
      ]
    ],
    footer: context {
      let p = counter(page).get().first()
      if p > 1 {
        align(center, text(
          font: "Fraunces",
          size: 9pt,
          weight: "semibold",
          fill: ink-muted,
          str(p),
        ))
      }
    },
  )

  set text(
    font: "Literata",
    size: 10.5pt,
    fill: ink,
  )

  set par(
    justify: true,
    leading: 0.7em,
    spacing: 1.2em,
  )

  set heading(numbering: "1.")

  // Chapter openers: eyebrow label, big title, accent rule.
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    set text(font: "Fraunces", hyphenate: false)
    block(above: 0em, below: 2em)[
      #if it.numbering != none [
        #text(
          size: 10pt,
          weight: "bold",
          tracking: 0.2em,
          fill: accent,
        )[#upper[Chapter #counter(heading).display("1")]]
        #v(1em, weak: true)
      ]
      #text(size: 27pt, weight: "black")[#it.body]
    ]
  }

  show heading.where(level: 2): it => block(above: 1.9em, below: 1em)[
    #set text(font: "Fraunces", size: 16pt, weight: "bold", hyphenate: false)
    #if it.numbering != none [
      #text(fill: accent)[#counter(heading).display(it.numbering)]
      #h(0.5em)
    ]
    #it.body
  ]

  show heading.where(level: 3): it => block(above: 1.6em, below: 0.8em)[
    #set text(font: "Fraunces", size: 12.5pt, weight: "semibold", hyphenate: false)
    #if it.numbering != none [
      #text(fill: ink-muted)[#counter(heading).display(it.numbering)]
      #h(0.45em)
    ]
    #it.body
  ]

  // Table of contents.
  show outline.entry: set text(size: 10.5pt)
  show outline.entry.where(level: 1): it => {
    v(1.3em, weak: true)
    text(font: "Fraunces", size: 11.5pt, weight: "bold", it)
  }

  // External links get a quiet teal underline.
  show link: it => {
    if type(it.dest) == str {
      underline(
        stroke: 0.5pt + blue.lighten(45%),
        offset: 2pt,
        text(fill: blue, it),
      )
    } else { it }
  }

  set raw(theme: "gruvbox-light.tmTheme")
  show raw: set text(
    font: "Rec Mono Linear",
    size: 9pt,
  )

  show raw.where(block: false): it => box(
    fill: code-bg,
    stroke: 0.4pt + code-stroke,
    inset: (x: 3pt),
    outset: (y: 3pt),
    radius: 3pt,
    it,
  )

  show raw.where(block: true): it => block(
    width: 100%,
    fill: code-bg,
    stroke: 0.5pt + code-stroke,
    radius: 6pt,
    inset: (x: 14pt, top: 12pt, bottom: 12pt),
    above: 1.6em,
    below: 1.6em,
  )[
    #if it.lang != none {
      place(
        top + right,
        dy: -4pt,
        text(
          font: "Fraunces",
          size: 8pt,
          weight: "bold",
          fill: ink-muted,
          tracking: 0.09em,
          upper(it.lang),
        ),
      )
    }
    #it
  ]

  show strong: set text(weight: "semibold")

  set list(
    indent: 1.1em,
    marker: (
      text(fill: accent)[•],
      text(fill: accent)[‣],
      text(fill: accent)[–],
    ),
  )
  set enum(indent: 1.1em)

  body
}

#let v-space = v(2em, weak: true)
#let smol-v-space = v(1em, weak: true)

#let pseudocode-list = pseudocode-list.with(
  booktabs: true,
  booktabs-stroke: 1.5pt + ink,
  stroke: 0.4pt + ink-muted.lighten(40%),
  line-gap: 0.8em,
)

#let callout(accent: blue, title: "Note", icon: none, body) = block(
  width: 100%,
  breakable: false,
  fill: color.mix((accent, 9%), (paper, 91%)),
  stroke: (left: 3pt + accent),
  radius: 6pt,
  inset: (x: 14pt, top: 11pt, bottom: 13pt),
  above: 1.6em,
  below: 1.6em,
)[
  #text(
    font: "Fraunces",
    size: 9pt,
    weight: "bold",
    fill: accent.darken(15%),
    tracking: 0.09em,
  )[
    #if icon != none [#icon#h(0.4em)]
    #upper(title)
  ]
  #v(0.6em, weak: true)
  #body
]

#let tip(body) = callout(
  accent: green,
  title: "Tip",
  icon: emoji.lightbulb,
  body,
)

#let problem(body) = callout(
  accent: accent,
  title: "Problem Statement",
  icon: emoji.quest,
  body,
)


#let important(body) = callout(
  accent: red,
  title: "Important",
  icon: emoji.warning,
  body,
)

#let summary(body) = callout(
  accent: blue,
  title: "Summary",
  icon: emoji.pencil,
  body,
)
