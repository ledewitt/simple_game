# Ruby Guidelines

1.  It's better to fix the code to not need a comment than to write a comment
2.  p() is a temporary debugging tool that shouldn't stay in your code
3.  Most output should use puts()
4.  Use print() if you need fine-grain non-line-oriented output
5.  Prefer objects to represent problem domain data (NOT YET!)
6.  An Array is for data that has a logical ordering only
7.  Otherwise, name keys in a Hash
8.  If you have separate variable names for each object, you want a Hash
9.  Translate if var ==/=~ SOMETHING… elsif var ==/=~ ELSE… end to case
10. A method should do one thing
11. Methods should be as short as possible
12. Name methods with an intention revealing verb