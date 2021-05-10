=begin
-----------------------INSTRUCTIONS--------------------------------------
Implement octal to decimal conversion. Given an octal input string,
your program should produce a decimal output. Treat invalid input as
octal 0.

Note: Implement the conversion yourself. Don't use any built-in or
library methods that perform the necessary conversions for you.
In this exercise, the code necessary to perform the conversion is
what we're looking for,

About Octal (Base-8)

Decimal is a base-10 system. A number 233 in base 10 notation can be
understood as a linear combination of powers of 10:

    The rightmost digit gets multiplied by 100 = 1
    The next digit gets multiplied by 101 = 10
    The digit after that gets multiplied by 102 = 100
    The digit after that gets multiplied by 103 = 1000
    ...
    The n*th* digit gets multiplied by 10n-1.
    All of these values are then summed.

--------------------------PROBLEM----------------------------------------

Questions:

Input:integer as string

Output:integer

---------------------------RULES-----------------------------------------
Explicit:
  The rightmost digit gets multiplied by 100 = 1
    The next digit gets multiplied by 101 = 10
    The digit after that gets multiplied by 102 = 100
    The digit after that gets multiplied by 103 = 1000
    ...
    The n*th* digit gets multiplied by 10n-1.
    All of these values are then summed.

Implicit:

--------------------------EXAMPLES---------------------------------------
  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155
----------------------------ALGO---------------------------------------
create method to_decimal that accepts integer as string argument
  convert integer-string to integer
  get digits of integer
    reverse them
      multiply each by (8 ^ index)
      return sum
=end
class Octal
  attr_reader :integer

  ACCEPTABLE_NUMBERS = [0, 1, 2, 3, 4, 5, 6, 7]
  ALPHABET = ('a'..'z').to_a

  def initialize(integer)
    integer = 0 if integer.chars.any? do |char|
      ALPHABET.include?(char.downcase)
    end
    @integer = integer.to_i
  end

  def to_decimal
    digits = integer.digits
    return 0 if (!integer.is_a? Integer) || !not_octal(digits)
    result = []
    digits.each_with_index do |digit, index|
      result << (digit * (8**index))
    end
    result.sum
  end

  def not_octal(arr)
    result = arr.select do |num|
      ACCEPTABLE_NUMBERS.include?(num)
    end
    result == arr
  end
end
