#import "../utils.typ": *

= Sliding Window <sliding-window>

This pattern is a direct descendant of Two Pointers: both pointers move in the same direction, maintaining an invariant over the sub-array between them.

The window can be fixed or growing, it depends on the problem!

== Fixed Window

The basic structure of a solution using this pattern is:

#pseudocode-list[
  + procedure sliding_window (input, window_size) is
    + result = window = input[0 to window_size]
    + *for* right in [window_size to input.length]
      + left = right - window_size
      + remove input[left] from window
      + add input[right] to window
      + result = some_calculation(result, window)

    + return result
]

== Dynamic Window