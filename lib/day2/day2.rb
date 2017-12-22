class Day2
  attr_reader :matrix

  def initialize(matrix:)
    @matrix = matrix
  end

  def part1
    matrix.map do |row|
      row.minmax.reduce(:-).abs
    end.reduce(&:+)
  end

  def part2
    matrix.map do |row|
      a, b = row.combination(2).map(&:minmax).detect { |(a, b)| b % a == 0 }
      b / a
    end.reduce(:+)
  end
end
