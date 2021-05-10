class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(new_strand)
    test_old = strand[0..new_strand.length - 1]
    test = new_strand[0..strand.length - 1]
    differences = 0
    0.upto(test_old.length) do |index|
      if test_old[index] != test[index]
        differences += 1
      end
    end
    differences
  end
end
