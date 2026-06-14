#import "../utils.typ": *

= Two Pointers <two-pointers>

Two pointers shows up more often than you'd expect.

You walk two pointers across an array in a single pass. They either move toward each other or in the same direction.

== Opposite Direction

The pointers start at the ends and move inward. Works on sorted arrays and symmetric problems:

- Palindromes
- Reversals
- Merging sorted data
- "K"-sized comparisons

#pseudocode-list[
  + create _left_ pointer at the start
  + create _right_ pointer at the end

  + *while* left < *right*:
    + *if* < problem specific condition > then:
      + move one or both of the pointers inward
]


== Same Direction

Both pointers start together and move forward, one faster than the other. Useful for tracking a range or spotting cycles.

To find the middle of a linked list, send one pointer twice as fast. When it hits the end, the slow one sits in the middle.

#pseudocode-list[
  + create a _fast_ pointer at 0
  + create a _slow_ pointer at 0
  + *until* the fast reaches the end
    + _fast_ pointer moves two places
    + _slow_ pointer moves just one place

  + return the _slow_ pointer
]

The same trick detects cycles: if the fast pointer ever meets the slow one, there's a loop.

== Example Problems

=== #link("https://leetcode.com/problems/valid-palindrome/")[Valid Palindrome]

#problem()[
  A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

  Given a string `s`, return `true` if it is a palindrome, or `false` otherwise.
]

==== Solution

Check if a string reads the same both ways, with two catches:
- case doesn't matter
- non-alphanumeric characters don't count (e.g. `,` `-` `+`)

Opposite direction pointers fit here.

#pseudocode-list[
  + create _left_ pointer at the start
  + create _right_ pointer at the end

  + *while* left < right:

    + *while* left < right and string[left] is not alphanumeric:
      + left += 1
    + *while* left < right and string[right] is not alphanumeric:
      + right -= 1

    + *if* lowercase(string[left]) $eq.not$ lowercase(string[right]):
      + return `false`

    + left += 1
    + right -= 1

  + return `true`
]

#tip()[
  The two inner *while* loops skip non-alphanumeric characters, so both pointers always land on valid ones before comparing.
]


In Python:

```py
def isPalindrome(self, s: str) -> bool:
  left = 0
  right = len(s) - 1

  while(left < right):
    while left < right and not s[left].isalnum():
      left += 1
    while left < right and not s[right].isalnum():
      right -= 1

    if s[left].lower() != s[right].lower():
      return False

    left += 1
    right -= 1

  return True
```

=== #link("https://leetcode.com/problems/middle-of-the-linked-list/description/")[Middle of the Linked List]

#problem()[
  Given the head of a singly linked list, return the middle node of the linked list.

  If there are two middle nodes, return the second middle node.
]

A clean case for same direction pointers. Move the slow pointer one node at a time and the fast pointer two. When the fast pointer runs out of nodes, the slow one is at the middle.

```py
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def middleNode(self, head: Optional[ListNode]) -> Optional[ListNode]:
      fast = slow = head

      while fast and fast.next:
        slow = slow.next
        fast = fast.next.next

      return slow
```
