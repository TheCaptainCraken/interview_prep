#import "../utils.typ": *

#align(center + horizon)[
  #text(3.5em, font: "Fraunces", weight: "black")[
    *Technical Interview Prep*
  ]
  #v-space
  #text(2em)[
    by Pietro (Pi) Agnoli
  ]
  #smol-v-space
  #text(1em)[
    #link("https://pietroagnoli.com", "website") | #link("https://github.com/TheCaptainCraken", "GitHub") | #link("mailto:pietro_agnoli@proton.me", "email") | #link("https://www.linkedin.com/in/pietro-agnoli/", "LinkedIn")
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

#outline(depth: 3)

#pagebreak()

= The _LeetCode style_ Coding Interview

I started these notes after failing a technical assessment at Amazon Web Services. Turns out you need more than a couple of days to lear how to solve LeetCode-style problems!

What I've discovered in this journey is *you don't need to be a genius to solve a hard problem*. All it takes is simple, good old-fashioned practice.

These problems are very different from what the day-to-day job looks like, they aren't testing you for your skill as an engineer. They are testing you on a somewhat-related ability just to see if you' re willing to put in the hours to learn it. Treat is as such.

Now it's easy to get frustrated, I get you. Think about it this way: you're investing time to find a very good job!

On a side note, I have come to really enjoy this type of problems, I sometimes feel like my grandma when she's doing her crosswords! The feeling you get when finally you have a clean optimal solution is so good!

If you need to take one thing out from this introduction of mine, take this:

#v-space

#tip()[
  LeetCode-style problems are an *exercise in pattern recognition*, not software development.
]

== How This Guide Works

This guide is meant to be a documentation of everything I have learned, I will link you cool resources I enjoyed at the end. This material will be a mix of them and I will also give you some of my favourite practice places. For each topic I will give you a list of problems that use it. Feel free to try (you' re actually encouraged).

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

Code block will inevitably appear, they will be in Python 3. Why? because it's a super simple and the most common language. I had to use it even tho I love Rust more! Sometimes you can't code in it. Other good alternatives are C++, Java and Javascript.

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
