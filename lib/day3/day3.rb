# 37  36  35  34  33  32 31
# 38  17  16  15  14  13 30
# 39  18   5   4   3  12 29
# 40  19   6   1   2  11 28
# 41  20   7   8   9  10 27
# 42  21  22  23  24  25 26
# 43  44  45  46  47  48 49
#
# https://en.wikipedia.org/wiki/Centered_polygonal_number
#
class Day3
  attr_reader :point

  def initialize(point:)
    @point = point
  end

  def centered_polygonal_number
    2 * (layer ** 2) - 2 * layer + 1
  end

  def layer
    ((Math.sqrt(point) - 1) / 2).ceil
  end

  def part1
    layer + (point - centered_polygonal_number).abs % layer
  end
end
