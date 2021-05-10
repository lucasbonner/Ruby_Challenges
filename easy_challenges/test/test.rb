# def triangle(arr)
#   result = []
#   arr.each do |elem|
#     iterating_arr = arr.clone
#     iterating_arr.delete_at(arr.index(elem))
#     result << (iterating_arr.sum > elem)
#   end
#   ArgumentError if result.include?(false)
# end

# array = [10, 1, 3]
# p triangle(array)

# def hamming_distance(strand, new_strand)
#   test_old = strand[0..new_strand.length - 1]
#   test = new_strand[0..strand.length - 1]
#   differences = 0
#   0.upto(test_old.length) do |index|
#     if test_old[index] != test[index]
#       differences += 1
#     end
#   end
#   p differences
# end

# strand = 'GACTACGGACAGGGTAGGGAAT'
# other = 'GACATCGCACACC'
# hamming_distance(strand, other) #== 3

# strand = 'GGACTGA'
# other = 'GGACTGA'
# hamming_distance(strand,other) #== 0

# strand = 'AAACTAGGGG'
# other = 'AGGCTAGCGGTAGGAC'
# hamming_distance(strand, other) #== 3

# def to_numeral(number)
#   hsh = {'I' => 1,
#   'V' => 5,
#   'X' => 10,
#   'L' => 50,
#   'C' => 100,
#   'D' => 500,
#   'M' => 1000}

#   if hsh.values.include?(number)
#     return hsh.key(number)
#   end

#   if hsh.values.include?(number + 1)
#     return hsh.key(1) + hsh.key(number + 1)
#   elsif hsh.values.include?(number + 10)
#     return hsh.key(10) + hsh.key(number + 10)
#   elsif hsh.values.include?(number + 100)
#     return hsh.key(100) + hsh.key(number + 100)
#   end

#   result = []
#   hsh.values.each do |value|
#     if value != 1 && (value..(value + 3)).to_a.include?(number)
#       difference = (number - value)
#       result << hsh.key(value)
#       difference.times {result << hsh.key(1)}
#     end
#   end

# if number % 10 == 0
#   result << hsh.key(10)
# end

#   p result.join


# end

# ROMAN_NUMERALS = {
#   "M" => 1000,
#   "CM" => 900,
#   "D" => 500,
#   "CD" => 400,
#   "C" => 100,
#   "XC" => 90,
#   "L" => 50,
#   "XL" => 40,
#   "X" => 10,
#   "IX" => 9,
#   "V" => 5,
#   "IV" => 4,
#   "I" => 1
# }

# def to_numeral(integer)
#   result = ''
#   number = integer

#   ROMAN_NUMERALS.each do |key, value|
#     multiplier, remainder = number.divmod(value)
#     if multiplier > 0
#       result << (key * multiplier)
#     end
#     number = remainder
#   end
#   result
# end

# num = 75
# p to_numeral(num)


# num = 1990
# p return_numeral(num) #== 'MCMXC'

# num = 2000
# p to_numeral(num) #== 'MMVIII'

# num = 1
# p to_numeral(num) == 'I'

# num = 4
# p to_numeral(num) #== 'IV'

# num = 9
# p to_numeral(num)
# num = 18
# p to_numeral(num) #== 'VIII'

# num = 90
# p to_numeral(num)

# LETTER_VALUES = {
#   %w[A E I O U L N R S T] => 1,
#   %w[D G] => 2,
#   %w[B C M P] => 3,
#   %w[F H V W Y] => 4,
#   %w[K] => 5,
#   %w[J X] => 8,
#   %w[Q Z] => 10
#   }


# def score(str)
#   if (!str.is_a? String) || (str[0] == " ")
#     return 0
#   end
#   chars = str.upcase.chars
#   result = 0
#   LETTER_VALUES.each do |key, value|
#     if included?(key, chars)
#       result += (value * count(key, chars))
#     end
#   end
#   result
# end

# def included?(arr, characters)
#   count = 0
#   characters.each do |char|
#     if arr.include?(char)
#       count += 1
#     end
#   end
#   count != 0
# end

# def count(arr, characters)
#   count = 0
#   characters.each do |char|
#     if arr.include?(char)
#       count += 1
#     end
#   end
#   count
# end

# chars = ["C", "A", "B", "B", "A", "G", "E"]
# array = %w[A E I O U L N R S T]
# p included?(array, chars)




# p score('cabbage') #== 14
# p score('alacrity') #== 13
# p score(' \t\n') #== 0
# p score(nil)

# ACCEPTABLE_NUMBERS = [0, 1, 2, 3, 4, 5, 6, 7]
# def to_decimal(integer)
#   digits = integer.digits
#   return 0 if (!integer.is_a? Integer) || !not_octal(digits)
#   result = []
#   digits.each_with_index do |digit, index|
#     result << (digit * (8**index))
#   end
#   result.sum
# end


# def not_octal(arr)
#   result = []
#   result = arr.select do |num|
#     ACCEPTABLE_NUMBERS.include?(num)
#   end
#   arr == result
# end

# p not_octal([8])
# p to_decimal(0)
# p to_decimal(1)

# p to_decimal(1) #== 1
# p to_decimal(10) #== 8
# p to_decimal(17) #== 15
# p to_decimal(11) #== 9
# p to_decimal(233)

# def divisible?(int, set)
#   set.select! do |num|
#     int % num == 0
#   end
#   !set.empty?
# end

# p divisible?(20, [7, 13, 17])

# def create_verse(integer)
#   return create_first_verse(integer) if integer == 0
#   return create_second_verse(integer) if integer == 1
#   return create_third_verse(integer) if integer == 2
#   "#{integer} bottles of beer on the wall, #{integer} bottles of beer.\n" \
#   "Take it down and pass it around, #{integer - 1} bottles of beer on the wall.\n"
# end

# def create_first_verse(integer)
#   "No more bottles of beer on the wall, no more bottles of beer.\n" \
#   "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
# end

# def create_second_verse(integer)
#   "#{integer} bottle of beer on the wall, #{integer} bottle of beer.\n" \
#   "Take it down and pass it around, no more bottles of beer on the wall.\n"
# end

# def create_third_verse(integer)
#   "#{integer} bottles of beer on the wall, #{integer} bottles of beer.\n" \
#   "Take one down and pass it around, 1 more bottle of beer on the wall.\n"
# end

# def verse(integer)
#   create_verse(integer)
# end

# def verses(int1, int2)
#   output = create_verse(int1) + "\n" + create_verse(int2)
#   output
# end

# p verses(99, 98)

def substrings(arr, integer)
  result = []
  0.upto(arr.length) do |index1|
    index1.upto(arr.length - 1) do |index2|
      result << arr[index1..index2]
    end
  end
  result.select! { |sub| sub.length == integer }.uniq
  result.map! { |sub| sub.chars.map {|num| num.to_i} }
end

p substrings('01234', 3)
p substrings('9827', 2)