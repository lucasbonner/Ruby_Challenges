=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time
you boot them up,
a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings,
which means that
their name gets wiped. The next time you ask,
it will respond with a new random name.

The names must be random; they should not follow a predictable sequence.
Random names means there is a risk of collisions.
Your solution should not allow the use of the same name twice when avoidable.
--------------------------PROBLEM----------------------------------------
Questions:

Input: none

Output: randomized string (name)
        follows patter of 2 uppercase alphabetic characters
        followed by three digits
---------------------------RULES-----------------------------------------
Explicit: names must NOT be repeated

Implicit:
--------------------------EXAMPLES---------------------------------------
'RX837'
two uppercase characters, three random integers

'BC811'
two uppercase characters, three random integer
----------------------------ALGO----------------------------------------
have an alphabet and integer array
also have an array to hold onto any created names
when randomly outputting a new name
  check against other created names
  if it is in there repeat the process of randomly generating the name

to generate the name:
    alph and integer array
    randomly pull from both to construct name
=end

class Robot
  attr_reader :name

  @@names = []

  def initialize
    alph = ('A'..'Z').to_a
    integer = (1..9).to_a
    @name = randomize(alph, integer)
  end

  def reset
    alph = ('A'..'Z').to_a
    integer = (1..9).to_a
    @name = randomize(alph, integer)
    @@names.clear
  end

  private

  def randomize(alphabet, integers)
    result = []
    loop do
      2.times { result << alphabet.sample }
      3.times { result << integers.sample }
      break unless @@names.include?(result.join)
      result.clear
    end
    @@names << result.join
    result.join
  end
end
