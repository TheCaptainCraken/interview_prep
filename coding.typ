#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()
#import "@preview/lovelace:0.3.1": *

#codly(languages: (
  python: (name: "Python", icon: "", color: rgb(250, 189, 47)),
))

#set page(
  paper: "a4",
  numbering: "~ 1 ~",
  header: context if counter(page).get().first() > 3 [
    #align(right)[
      Technical Interview Prep made with #emoji.heart by Pi
    ]
  ],
)

#set text(
  size: 12pt,
  font: "EB Garamond",
  lang: "en",
)

#set heading(numbering: "1.")
#set list(indent: 1em)
#let v-space = v(2em, weak: true)
#let smol-v-space = v(1em, weak: true)

#align(center + horizon)[
  #text(3em)[
    *Technical Interview Prep*
  ]
  #v-space
  #text(2em)[
    Pietro Agnoli
  ]
  #smol-v-space
  #text(1em)[
    #link("https://pietroagnoli.com", "website") | #link("https://github.com/TheCaptainCraken", "GitHub") | #link("mailto:pietro_agnoli@proton.me", "E-Mail") | #link("https://www.linkedin.com/in/pietro-agnoli/", "LinkedIn")
  ]
  #v-space

  #par(justify: true)[
    These are my notes to prepare yourself for your technical interview.
  ]
]

#pagebreak()

#align(center + horizon)[
  I hope these notes will help you in your journey as much as they helped me. #emoji.heart I believe in you!
]
#align(right + horizon)[
  _~Pi, May 2026_
]
#pagebreak()

#outline(depth: 2)

#pagebreak()

= The _LeetCode style_ Coding Interview

Oh man that's scary. Don't worry! Learning how to solve these problems is just like learning math, with some time and dedication you can do it! Anyone can learn how to solve them, no need to be a genius!
