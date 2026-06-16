#import "../utils.typ": *

= Sliding Window <sliding-window>

This pattern is a direct descendant of Two Pointers: both pointers move in the same direction, maintaining an invariant over the sub-array between them.

The window can be fixed or growing, it depends on the problem!

The core idea: instead of recomputing a result from scratch for every sub-array (which costs $O(n^2)$ or worse), keep a running "window" of elements and update it incrementally as it slides across the input. Each step adds one new element on the right and, if needed, drops one element on the left, giving $O(n)$ total work.

== Fixed Window

The window size is given (or fixed) up front and *never* changes.

Start by filling the window with the first `window_size` elements, compute the initial result, then slide one step at a time: for each step, remove the element falling off the left and add the new element entering on the right.

The basic structure of a solution using this pattern is:

#pseudocode-list[
  + procedure sliding_window (input, window_size) is
    + result = window = input[0 to window_size]

    + *for* right in [window_size to input.length] do
      + left = right - window_size
      + remove input[left] from window
      + add input[right] to window

      + result = some_calculation(result, window)

    + return result
]

== Dynamic Window

Here the window size isn't known in advance, it grows and shrinks based on a validity condition. Expand the window by moving `right` forward and adding elements.

Whenever the window becomes *invalid*, shrink it by moving `left` forward until it's valid again.

The result is updated each time the window is valid.

#pseudocode-list[
  + procedure sliding_window (input) is
    + result = initial state
    + window = initial state
    + left = 0
    + *for* right in [0 to input.length]
      + append input[right] to window
      + *until* window is valid do
        + remove input[left] from window
        + left += 1

      + result = max(result, window)

    + return result
]

== Example Problems

=== #link(
  "https://leetcode.com/problems/longest-substring-without-repeating-characters/",
)[Longest Substring Without Repeating Characters]

#problem()[
  Given a string `s`, find the length of the longest substring without duplicate characters.
]

This is a case of dynamic sliding window! We can start at the first character, then grow the window right until a character repeats. When that happens we shrink the window from the left until the repetitions is eliminated and we continue. The answer is the longest window we ever had at any point so we'll keep a running best score. Let's see it in pseudo code:

#pseudocode-list[
  + procedure length_of_longest_substring (input) is
    + last_seen = empty map from character to its last index
    + best = 0
    + left = 0

    + *for* right in [0 to input.length] do
      + char = input[right]
      + *if* char is in last_seen *and* last_seen[char] >= left *then*
        + left = last_seen[char] + 1
      + last_seen[char] = right
      + best = max(best, right - left + 1)

    + return best
]

```py
def lengthOfLongestSubstring(self, s: str) -> int:
  last_seen: dict[str, int] = {}
  best = start = 0

  for idx, c in enumerate(s):
      start = max(start, last_seen.get(c, -1) + 1)
      last_seen[c] = idx
      best = max(best, idx - start + 1)

  return best

```
