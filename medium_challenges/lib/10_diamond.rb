=begin
-----------------------INSTRUCTIONS--------------------------------------
The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a
letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

    The first row contains one 'A'.
    The last row contains one 'A'.
    All rows, except the first and last, have exactly two identical letters.
    The diamond is horizontally symmetric.
    The diamond is vertically symmetric.
    The diamond has a square shape (width equals height).
    The letters form a diamond shape.
    The top half has the letters in ascending order.
    The bottom half has the letters in descending order.
    The four corners (containing the spaces) are triangles.

--------------------------PROBLEM----------------------------------------

Questions:

Input: letter (string)

Output: letter diamond (string)

---------------------------RULES-----------------------------------------
Explicit:
diamond structure:
  goes from a, alphabetically goes to input letter, and then back down to a

Implicit:

--------------------------EXAMPLES---------------------------------------
diamond for letter 'c':
      A
    B   B
   C     C
    B   B
      A


----------------------------ALGO----------------------------------------
it's a class method that outputs the diamond
  goes from 'A' (index 0, 0 spaces) -> 'E' (index 4, 4 spaces)
  once hits input letter repeats the begging in backwards order

=end

class Diamond
  def self.make_diamond(letter)
    range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    diamond_width = max_width(letter)

    range.each_with_object([]) do |let, arr|
      arr << make_row(let).center(diamond_width)
    end.join("\n") + "\n"
  end

  private

  def self.make_row(letter)
    return "A" if letter == 'A'
    return "B B" if letter == 'B'

    letter + determine_spaces(letter) + letter
  end

  def self.determine_spaces(letter)
    all_letters = ['B']
    spaces = 1

    until all_letters.include?(letter)
      current_letter = all_letters.last
      all_letters << current_letter.next
      spaces += 2
    end

    ' ' * spaces
  end

  def self.max_width(letter)
    return 1 if letter == 'A'

    determine_spaces(letter).count(' ') + 2
  end
end
