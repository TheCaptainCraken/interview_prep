#import "../utils.typ": *

= Two Pointers

This simple patterns comes up way often that you'd think.

The idea is simple: take two pointers and do a pass over the array.

The two pointers can either go in the same or opposite direction. The last one is more common.

== Opposite Direction Pointers

Used when you have some kind of sorted array. For example:

- Palindromes
- Reversals
- Merging sorted data
- "K"-sized comparisons

The usual setup for a solution looks like this:

#pseudocode-list[
  + create _left_ pointer at the start
  + create _right_ pointer at the end

  + *while* left < *right*:
    + *if* < problem specific condition > then:
      + move one or both of the pointers inward
]


== Same Direction Pointers

Used when you need to track a range. Classic example is the fast-slow two pointers technique:

Let's say you need to find the middle of a linked list. To do it you can use two pointers!

#pseudocode-list[
  + create a _fast_ pointer at 0
  + create a _slow_ pointer at 0
  + *until* the fast reaches the end
    + _fast_ pointer moves two places
    + _slow_ pointer moves just one place

  + return the _slow_ pointer
]

See? Simple and effective. In a similar way you can find if there is a cycle in the data structure.

== Example Problems

Here are some example problems solved using this technique.

=== #link("https://leetcode.com/problems/valid-palindrome/")[Valid Palindrome]

#problem()[
  A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

  Given a string `s`, return `true` if it is a palindrome, or `false` otherwise.
]

==== Solution

The problem is straightforward: check if a string is palindrome. There are a couple of curve balls:
- case does not count
- non-alphanumeric characters don't count (e.g. `,` `-` `+`)

This is a clear use case for the two pointers technique. We are going to use the Opposite Direction Pointers approach.

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
  The two *while* in the main one are there to skip over non alphanumeric characters so that both pointers always stay on valid characters.
]


In Python this is:

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

This is a super good example of the same direction two pointers approach.

We can solve it easily by having a slow pointer move one space at a time and a fast pointer moving two places. When the fast pointer cannot go forward then we know the slow is in the middle!

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