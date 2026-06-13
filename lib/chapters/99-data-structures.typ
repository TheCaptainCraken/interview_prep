#import "../utils.typ": *

= Data Structures

This appendix is meant to quickly get you up to speed on all the data structures used in the guide. You don't need to read it all in one sitting. I recommend coming here every time you encounter a new data structure.

== Array

An array is a *row of boxes, side by side in memory, each holding one value*. Every box has a number (its _index_), so you can jump straight to box `i` without walking past the others.

=== Strengths

- *Instant access*: Reading or writing any element by index is $O(1)$ thanks to pointers.
- *Cache friendly*: Because the boxes sit next to each other, iterating an array is about as fast as hardware gets.
- *Tiny footprint*: No pointers, no bookkeeping. Just the data. Memory overhead is minimal.

=== Weaknesses

- *Fixed size (classically).* A raw array can't grow. Dynamic arrays (Python's `list`, C++'s `vector`) fake it by copying into a bigger array when full.
- *Costly middle edits.* Inserting or deleting anywhere but the end means shifting everything after it $O(n)$.
- *Slow search when unsorted.* No magic here: you scan element by element, $O(n)$.

=== Complexity

Let $n$ be the number of elements.

#table(
  columns: (1fr, auto, auto),
  align: (left, center, left),
  stroke: none,
  inset: (x: 8pt, y: 7pt),
  table.hline(stroke: 1.5pt + ink),
  table.header([*Operation*], [*Time*], [*Why*]),
  table.hline(stroke: 0.6pt + ink-muted),
  [Access by index], [$O(1)$], [direct address math],
  [Update by index], [$O(1)$], [overwrite one box],
  [Search (unsorted)], [$O(n)$], [scan every element],
  [Search (sorted)], [$O(log n)$], [binary search],
  [Append at end], [$O(1)^*$], [amortized; resize is rare],
  [Insert at front/middle], [$O(n)$], [shift the tail over],
  [Delete at front/middle], [$O(n)$], [shift the tail back],
  table.hline(stroke: 1.5pt + ink),
)

#text(
  size: 9pt,
  fill: ink-muted,
)[$#sym.ast$ amortized: a single append is occasionally $O(n)$ when the array resizes, but $O(1)$ on average.]

#important()[
  In most languages, strings are *immutable*. Every time you add a character to a string, you really are creating a new one.

  For this reason, never do something like this:
  ```py
  result = ""

  for _ in range(15):
    result += 'a'
  
  return result
  ```
  This is $O(n^2)$!

  Instead, use the join function on an empty string with an array of characters:

  ```py
  result = []

  for _ in range(15):
    result.append('a')

  return "".join(result)
  ```

  This is $O(n)$!
]
#summary()[
  *Array* = contiguous boxes with numbered indices. They are very common in interview, either as the main data structure or as a part of the problem. You will often encounter them when trying to:

  - Traverse a data structure in order.
  - Access specific indices.
  - Compare elements from both ends.
  - Sliding window, prefix sum, ...
]

== Set

A set is a *bag of unique values with no order*. You ask "is this value in here?", and it answers almost instantly. Under the hood it's usually a _hash table_: each value is run through a hash function that points straight to its slot.

=== Strengths

- *Instant membership.* Checking whether a value is present is $O(1)$ on average. No scanning.
- *Automatic deduplication.* Adding a value that's already there is a no-op. Uniqueness is free.
- *Fast add and remove.* Both are $O(1)$ on average, again thanks to hashing.

=== Weaknesses

- *No order, no indexing.* There's no "first" or "third" element. If you need order, a set is the wrong tool.
- *Worst-case slowdowns.* When too many values collide into the same slot, operations can degrade to $O(n)$.
- *Hashing overhead.* Each value must be hashable, and the table keeps spare slots to stay fast, so memory overhead is larger than an array's.

=== Complexity

Let $n$ be the number of elements.

#table(
  columns: (1fr, auto, auto),
  align: (left, center, left),
  stroke: none,
  inset: (x: 8pt, y: 7pt),
  table.hline(stroke: 1.5pt + ink),
  table.header([*Operation*], [*Time*], [*Why*]),
  table.hline(stroke: 0.6pt + ink-muted),
  [Membership test], [$O(1)^*$], [hash straight to the slot],
  [Insert], [$O(1)^*$], [hash, then drop it in],
  [Delete], [$O(1)^*$], [hash, then clear the slot],
  [Iterate all], [$O(n)$], [visit every element],
  [Min / max], [$O(n)$], [no order, must scan],
  table.hline(stroke: 1.5pt + ink),
)

#text(
  size: 9pt,
  fill: ink-muted,
)[$#sym.ast$ average case. A bad hash or many collisions can push a single operation to $O(n)$.]

#important()[
  A set only stores *hashable* values. In Python you can add numbers, strings, or tuples, but not lists or other sets, because those can change:
  ```py
  seen = set()
  seen.add((1, 2))   # ok, tuples are hashable
  seen.add([1, 2])   # TypeError: unhashable type: 'list'
  ```
  If you need a set of sets, reach for `frozenset`, the immutable cousin.
]
#summary()[
  *Set* = unordered bag of unique, hashable values. It is your go-to whenever a problem cares about *presence* rather than *position*. You will often reach for one when trying to test:

  - Uniqueness
  - Existence
]

== Hashmap

A hashmap is a *collection of key-value pairs*. You hand it a _key_ and it hands back the _value_ you stored under that key, almost instantly.

=== Strengths

- *Instant lookup.* Fetching the value for a key is $O(1)$ on average. No scanning.
- *Fast add and update.* Storing or overwriting a key's value is $O(1)$ on average, again thanks to hashing.
- *Keys are unique.* Storing a key that already exists just overwrites its value, so you never get duplicates.

=== Weaknesses

- *No order, no indexing.* There's no "first" or "third" pair. If you need order, a hashmap is the wrong tool.
- *Worst-case slowdowns.* When too many keys collide into the same slot, operations can degrade to $O(n)$.
- *Hashing overhead.* Each key must be hashable, and the table keeps spare slots to stay fast, so memory overhead is larger than an array's.

=== Complexity

Let $n$ be the number of pairs.

#table(
  columns: (1fr, auto, auto),
  align: (left, center, left),
  stroke: none,
  inset: (x: 8pt, y: 7pt),
  table.hline(stroke: 1.5pt + ink),
  table.header([*Operation*], [*Time*], [*Why*]),
  table.hline(stroke: 0.6pt + ink-muted),
  [Lookup by key], [$O(1)^*$], [hash straight to the slot],
  [Insert / update], [$O(1)^*$], [hash, then drop it in],
  [Delete], [$O(1)^*$], [hash, then clear the slot],
  [Membership test], [$O(1)^*$], [hash the key, check the slot],
  [Iterate all], [$O(n)$], [visit every pair],
  table.hline(stroke: 1.5pt + ink),
)

#text(
  size: 9pt,
  fill: ink-muted,
)[$#sym.ast$ average case. A bad hash or many collisions can push a single operation to $O(n)$.]

#important()[
  Like a set, a hashmap only accepts *hashable keys*. The values, however, can be anything:
  ```py
  count = {}
  count["a"] = [1, 2]   # ok, keys are strings; values can be lists
  count[[1, 2]] = 5     # TypeError: unhashable type: 'list'
  ```
  When counting occurrences, reach for `collections.Counter` or `defaultdict(int)` so missing keys default to `0` instead of raising `KeyError`.
]
#summary()[
  *Hashmap* = unordered collection of key-value pairs with unique, hashable keys. It is your go-to whenever you need to *associate* one thing with another, or remember something *about* each element. You will often reach for one when trying to:

  - Count occurrences
  - Map a value to where you last saw it
  - Cache results you've already computed
]

