#import "../utils.typ": *

#align(center + horizon)[

  #text(font: "Fraunces", size: 35pt, weight: "black")[
    Technical Interview Prep
  ]


  #v(1em, weak: true)

  #text(size: 13pt, style: "italic", fill: ink-muted)[
    a friendly guide to the LeetCode-style coding interview
  ]

  #v(5em, weak: true)

  #text(font: "Fraunces", size: 15pt, weight: "semibold")[
    by Pietro (Pi) Agnoli
  ]

  #v(1.4em, weak: true)

  #text(size: 10pt)[
    #link("https://pietroagnoli.com", "website")
    #text(fill: accent)[·]
    #link("https://github.com/TheCaptainCraken", "GitHub")
    #text(fill: accent)[·]
    #link("mailto:pietro_agnoli@proton.me", "email")
    #text(fill: accent)[·]
    #link("https://www.linkedin.com/in/pietro-agnoli/", "LinkedIn")
  ]
]

#pagebreak()

#align(center + horizon)[
  #block(width: 75%)[
    #text(size: 12pt, style: "italic")[
      If you're reading these notes, you're probably looking for a job.
      \
      \
      I know it can feel scary: the waiting, the doubting, the wondering if you're enough.
      \
      \
      Remember life is a door that only opens forward.
      \
      \
      Right now, with every page you study and every problem you solve, you're becoming someone remarkable.
      \
      \
      Take a breath, pour yourself something warm, and trust the work. You can be anything. I believe in you.
      \
      \
      \
      Be crunchy! #emoji.crocodile
    ]

    #v(2em, weak: true)

    #align(right)[
      #text(font: "Fraunces", size: 11pt, fill: ink-muted)[~ Pi, May 2026]
    ]
  ]
]
#pagebreak()

#outline(depth: 3)

#pagebreak()

= Introduction

These notes were born from a failure: I didn't pass a technical assessment at Amazon Web Services. I only had a couple of days to prepare and clearly it wasn't enough time.

Here's the good news though: *you don't need to be a genius to solve a hard problem*. You need reps. That's it. Pattern after pattern, problem after problem, until the tricks start jumping out at you.

Let's be honest: these problems have almost nothing to do with the actual job. Companies use them to check if you're willing to put in the hours.

Frustrated? Totally normal. But you're grinding your way toward a great job, and honestly, somewhere along the way it gets _fun_. I now crack these like my grandma cracks her crosswords. I promise you that nailing a clean, optimal solution feels *so* good.

People don't really read introductions in my experience. If you can take just one thing out of this make it:

#tip()[
  LeetCode-style problems are an *exercise in pattern recognition*, not software development.
]

== How This Guide Works

This guide will teach you everything I know. Each chapter will be about a pattern. At the end of each chapter I will link you useful resources and practice problems.

Try and complete the practice problems *without* looking at the resources.

If you get stuck for more than 20 minutes then look at the resources.

If even with those you can't solve it, ask your favorite LLM to guide you.

At the end of each topic I will give you a short, brain friendly summary.

=== Notation

In the following pages, you will encounter these boxes. They are highlights and all have different purpose:

#tip()[
  This is a tip. usually it's something worth remembering!
]

#important()[
  This is important. Usually something counterintuitive or a classic mistake. Skip it at your own risk!
]

#summary()[
  This is a summary. It condenses a whole section into a few lines, perfect for a quick review before an interview.
]

Code blocks are in Python 3: simple, everywhere, interview-approved. (My heart says Rust, but not every interview lets you use it!) C++, Java and JavaScript are solid picks too.

#tip()[
  Many people make the mistake of searching for the 'perfect' language for these problems. The truth is any of the ones I mentioned is fine.
]

This is a code sample:
```py
# This is a sample code block
def function(arg1: int) -> str:
  return str(arg1 + 2)
```
And this is a pseudo-code example:

#pseudocode-list[
  + do something
  + do something else
  + *while* still something to do
    + do even more
    + *if* not done yet *then*
      + wait a bit
      + resume working
    + *else*
      + go home
    + *end*
  + *end*
]
