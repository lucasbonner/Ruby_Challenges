=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a program that, given a natural number and a set of one or
more other numbers, can find the sum of all the multiples of the
numbers in the set that are less than the first number. If the
set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to,
but not including, 20 that are multiples of either 3 or 5,
we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

natural number -a positive integer
--------------------------PROBLEM----------------------------------------

Questions:

Input:
a 'set' of numbers in constructor
a single integer to #.to method

Output:
integer (sum of all multiples of set)
---------------------------RULES-----------------------------------------
Explicit:
if not given a set, use 3 and 5
  can be up to 3 arguments

Implicit:
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO----------------------------------------
in constructor:
  have it set up to take three arguments
    use splat
    if array is empty, add 3 and 5

in #to method
create result array
create an array up to (num - 1)
 iterate thru
 if it is divisble by all members of set
 add to result
 sum and return
=end

class SumOfMultiples
  attr_reader :set

  def initialize(*arr)
    @set = arr
  end

  def to(integer)
    SumOfMultiples.to(integer, set)
  end

  def self.to(integer, array=[3, 5])
    arr = (1..(integer - 1)).to_a
    arr.select! do |num|
      divisible?(num, array)
    end
    arr.sum
  end

  private

  def self.divisible?(int, arr)
    array = arr.select do |num|
      int % num == 0
    end
    !array.empty?
  end
end
