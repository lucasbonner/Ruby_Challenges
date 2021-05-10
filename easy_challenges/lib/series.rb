=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a program that will take a string of digits and return all
the possible consecutive number series of a specified length in
that string.
For example, the string "01234" has the following 3-digit series:
    012
    123
    234
Likewise, here are the 4-digit series:
    0123
    1234
Finally, if you ask for a 6-digit series from a 5-digit string,
you should throw an error.
--------------------------PROBLEM----------------------------------------

Questions:

Input:string, integer

Output: all substrings of integer length

---------------------------RULES-----------------------------------------
Explicit: if integer > og_arr.length, throw an error

Implicit:
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO----------------------------------------
are instantiating an object that passes in string
in object method
  get chars of string
  get all substrings
  delete all substrings of not desired length
=end

class Series
  attr_writer :series

  def initialize(str)
    @series = str
  end

  def slices(integer)
    raise ArgumentError if integer > @series.chars.length
    array = substrings(@series)
    array.select! { |sub| sub.length == integer }.uniq
    array.map { |sub| sub.chars.map(&:to_i) }
  end

  def substrings(arr)
    result = []
    0.upto(arr.length - 1) do |index1|
      index1.upto(arr.length - 1) do |index2|
        result << arr[index1..index2]
      end
    end
    result
  end
end
