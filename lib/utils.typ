#import "@preview/lovelace:0.3.1": *

#let yellow = rgb("fabd2f")
#let green = rgb("#b8bb26")
#let red = rgb("#fb4934")
#let blue = rgb("#83a598")
#let white_green = rgb("#ebebe4")
#let text_color = rgb("#1d2021")
#let foreground = rgb("#fbf1c7")

#let init-doc(body) = {
  set text(fill: text_color)

  set page(
    paper: "a4",
    numbering: "1",
    header: context if counter(page).get().first() > 3 [
      #align(right)[
        Technical Interview Prep made with #emoji.heart by Pi
      ]
    ],
    margin: 2cm,
  )

  set text(
    font: "Literata",
    size: 10.5pt,
  )

  set par(
    justify: true,
  )

  show heading.where(level: 1): it => [
    #set text(
      font: "Fraunces",
      size: 24pt,
      weight: "black",
    )

    #it

    #v(.5em)
  ]

  show heading.where(level: 2): it => [
    #set text(
      font: "Fraunces",
      size: 16pt,
      weight: "bold",
    )

    #it

    #v(.25em)
  ]

  show heading.where(level: 3): set text(
    font: "Fraunces",
    size: 13pt,
    weight: "semibold",
  )

  show raw: set text(
    font: "Rec Mono Linear",
    size: 9pt,
  )

  show raw.where(block: false): it => box(
    fill: white_green.lighten(30%),
    stroke: 0.4pt + white_green.darken(20%),
    inset: (x: 3pt),
    outset: (y: 3pt),
    radius: 3pt,
    it,
  )

  show raw.where(block: true): it => block(
    width: 100%,
    fill: foreground.lighten(40%),
    stroke: 0.5pt + foreground.darken(30%),
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
          fill: text_color.lighten(55%),
          tracking: 0.09em,
          upper(it.lang),
        ),
      )
    }
    #it
  ]

  show strong: set text(
    weight: "semibold",
  )

  set heading(
    numbering: "1.",
  )

  set list(indent: 1em)

  body
}

#let v-space = v(2em, weak: true)
#let smol-v-space = v(1em, weak: true)

#let callout(accent: blue, title: "Note", icon: none, body) = block(
  width: 100%,
  breakable: false,
  fill: accent.lighten(82%),
  stroke: (left: 3pt + accent.darken(15%)),
  radius: (top-right: 6pt, bottom-right: 6pt),
  inset: (x: 14pt, top: 11pt, bottom: 13pt),
  above: 1.6em,
  below: 1.6em,
)[
  #text(
    font: "Fraunces",
    size: 9pt,
    weight: "bold",
    fill: accent.darken(45%),
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
