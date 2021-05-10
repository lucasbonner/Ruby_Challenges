class Scrabble
  attr_reader :str

  LETTER_VALUES = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }

  def initialize(str)
    @str = str
  end

  def self.score(string)
    Scrabble.new(string).score
  end

  def score
    return 0 if (!str.is_a? String) || (str[0] == " ")
    chars = str.upcase.chars
    result = 0
    LETTER_VALUES.each do |key, value|
      if included?(key, chars)
        result += (value * count(key, chars))
      end
    end
    result
  end

  private

  def included?(arr, characters)
    count = 0
    characters.each do |char|
      if arr.include?(char)
        count += 1
      end
    end
    count != 0
  end

  def count(arr, characters)
    count = 0
    characters.each do |char|
      if arr.include?(char)
        count += 1
      end
    end
    count
  end
end
