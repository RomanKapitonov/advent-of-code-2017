class Day1
  attr_reader :number_list

  def initialize(number:)
    @number_list = number.scan(/\d/).map(&:to_i)
  end

  def part1
    zipped_with_rotated.reduce(0) do |result, (a, b)|
      result += a if a == b
      result
    end
  end

  def part2
    zipped_with_twice_rotated.reduce(0) do |result, (a, b)|
      result += a if a == b
      result
    end
  end

  def rotated_number_list
    number_list.rotate
  end

  def twice_rotated_number_list
    number_list.rotate(half_length)
  end

  def zipped_with_twice_rotated
    number_list.zip(twice_rotated_number_list)
  end

  def zipped_with_rotated
    number_list.zip(rotated_number_list)
  end

  def half_length
    number_list.length / 2
  end
end
