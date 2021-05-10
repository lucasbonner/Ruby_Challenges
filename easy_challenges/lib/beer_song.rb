=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a program that can generate the lyrics of the 99 Bottles of Beer song.
See the test suite for the entire song.
--------------------------PROBLEM----------------------------------------
Questions:

Input:integer

Output:string (matching the verse in the 'beer song')
---------------------------RULES-----------------------------------------
Explicit:are class methods
         verse, and verses method

Implicit:
--------------------------EXAMPLES---------------------------------------
BeerSong.verse(0)
"No more bottles of beer on the wall, no more bottles of beer.\n" \
"Go to the store and buy some more, 99 bottles of beer on the wall.\n"
BeerSong.verses(99, 98)
"99 bottles of beer on the wall, 99 bottles of beer.\n" \
"Take one down and pass it around, 98 bottles of beer on the wall.\n" \
"\n" \
"98 bottles of beer on the wall, 98 bottles of beer.\n" \
"Take one down and pass it around, 97 bottles of beer on the wall.\n"
----------------------------ALGO----------------------------------------
Have to develop the song from 0-99, descending
0 has unique string "No more bottles"
rest are the same, goes from 1 number, down to preceding
"(first number) bottles of beer...(first number) bottles of beer\n"
"Take one down and pass it around, (second, lower number) bottles of beer"
have a create_verse method, takes one integer
  if integer is 0, go to "create_first_verse_method"
  otherwise puts out first number output
  followed by second
if verse method, calls create verse
if verses method, calls create verse on both.
=end
class BeerSong
  def self.verses(int1, int2)
    arr = (int2..int1).to_a.reverse
    arr.map! { |integer| create_verse(integer) }
    arr.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  def self.verse(integer)
    create_verse(integer)
  end

  def self.create_verse(integer)
    return create_first_verse(integer) if integer == 0
    return create_second_verse(integer) if integer == 1
    return create_third_verse(integer) if integer == 2
    default_output(integer)
  end

  def self.default_output(integer)
    "#{integer} bottles of beer on the wall, #{integer} bottles of beer.\n" \
    "Take one down and pass it around, #{integer - 1}" \
    " bottles of beer on the wall.\n"
  end

  def self.create_first_verse(_)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def self.create_second_verse(integer)
    "#{integer} bottle of beer on the wall, #{integer} bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def self.create_third_verse(integer)
    "#{integer} bottles of beer on the wall, #{integer} bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end
