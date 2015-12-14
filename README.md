# Notes

##Loops (blocks)

Ruby uses block to enumerate over _enumerable_ objects. To make a "loop" you can pass a block to an enumerable method. Enumerable methods are available on objects that represent lists, e.g Arrays and Hashes. A block starts with a `do` and ends with an `end`. A block optionally also has an argument which appears between pipes `|foo|`

Each is an enumerable method which, when given a block (do..end) iterates over a list passing _each_ item in list to the block via the arguement in pipes. 
````
  @posts.each
