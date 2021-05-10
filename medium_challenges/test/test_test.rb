def make_diamond(letter)
  alph = ('A'..letter).to_a
  inner_spaces = 1
  outer_spaces = alph.length
  create(alph)
end

def create(array)
  inner_spaces = 1
  outer_spaces = alph.length
  array.each_with_index do |alpha, index|
    if alpha == 'A'
      p (" " *  outer_spaces) + alpha + (" " * outer_spaces)
      outer_spaces += 1
    end
    outer_spaces -= 1
    p (" " * outer_spaces) + alpha + (" " * inner_spaces) + alpha + (" " * outer_spaces) unless alpha == 'A'
    inner_spaces += 2 unless alpha == alph.last || alpha == alph.first
  end
  bottom(array, inner_spaces, outer_spaces)
end

def bottom(array, inner, outer)
  array.pop
  array.reverse.each_with_index do |alpha, index|
    if alpha == 'A'
      outer += 1
      p (" " *  outer) + alpha + (" " * outer)
    end
    outer += 1
    inner -= 2
  p (" " * outer) + alpha + (" " * inner) + alpha + (" " * outer) unless alpha == 'A'
  end
end

# def middle_line


# end
make_diamond('L')
# p make_diamond('C')
# p make_diamond('E')