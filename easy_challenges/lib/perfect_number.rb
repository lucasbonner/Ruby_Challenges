=begin
-----------------------INSTRUCTIONS--------------------------------------

    Perfect numbers have an Aliquot sum that is equal to the original
    number.
    Abundant numbers have an Aliquot sum that is greater than the original
    number.
    Deficient numbers have an Aliquot sum that is less than the original
    number.

Examples:

    6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 +
    3 = 6.
    28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and
    1 + 2 + 4 + 7 + 14 = 28.
    15 is a deficient number since its divisors are 1, 3, and 5 and 1 +
    3 + 5 = 9 which is less than 15.
    24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8,
    and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
    Prime numbers 7, 13, etc. are always deficient since their only
    divisor is 1.

--------------------------PROBLEM----------------------------------------

Questions:

Input: integer

Output: string('perfect', 'deficient', 'abundant')

---------------------------RULES-----------------------------------------
Explicit:

    Perfect numbers have an Aliquot sum that is equal to the original
    number.
    Abundant numbers have an Aliquot sum that is greater than the original
    number.
    Deficient numbers have an Aliquot sum that is less than the original
    number.

Implicit:

--------------------------EXAMPLES---------------------------------------

 6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 +
    3 = 6.
    28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and
    1 + 2 + 4 + 7 + 14 = 28.
    15 is a deficient number since its divisors are 1, 3, and 5 and 1 +
    3 + 5 = 9 which is less than 15.
    24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8,
    and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
    Prime numbers 7, 13, etc. are always deficient since their only
    divisor is 1.

----------------------------ALGO----------------------------------------
Must get all integers that numb has 0 remainder for
create method classify
  create result array
  takes an integer as an argument
  iterates up to numb (from 1)
  if numb is divisible by integer
    add to result
use a second method to return a string

helper:
  pass result_array and numb
    compare sum of result array to numb
      if sum is equal -> perfect
      if sum is greater -> abundant
      if sum is less than -> deficient

=end
class PerfectNumber
  def self.classify(integer)
    raise StandardError if integer < 0
    result = []
    1.upto(integer - 1) do |number|
      if integer % number == 0
        result << number
      end
    end
    classification(result, integer)
  end

  def self.classification(array, integer)
    if array.sum == integer
      'perfect'
    elsif array.sum > integer
      'abundant'
    else
      'deficient'
    end
  end
end
