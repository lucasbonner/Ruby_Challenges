class Triangle
  def initialize(*side)
    raise ArgumentError if valid?(side)
    @sides = side
  end

  def kind
    if @sides.uniq.count == 1
      'equilateral'
    elsif @sides.uniq.count == 2
      'isosceles'
    else
      'scalene'
    end
  end

  def valid?(arr)
    result = []
    arr.each do |elem|
      iterating_arr = arr.clone
      iterating_arr.delete_at(arr.index(elem))
      result << (iterating_arr.sum > elem)
    end
    return true if result.include?(false) || !arr.all? { |value| value > 0 }
    false
  end
end
