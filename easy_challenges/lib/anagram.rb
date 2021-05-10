class Anagram
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def match(arr)
    arr.select! { |word| anagram?(str, word) && !same_word(word, str) }
  end

  private

  def anagram?(word1, word2)
    sorter(word1) == sorter(word2)
  end

  def sorter(word)
    word.downcase.chars.sort.join
  end

  def same_word(word1, word2)
    word1.downcase == word2.downcase
  end
end
