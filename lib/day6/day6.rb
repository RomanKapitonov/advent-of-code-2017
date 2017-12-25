class Day6
  attr_reader :memory_blocks

  def initialize(memory_blocks:)
    @memory_blocks = memory_blocks
  end

  def part1
    Memory.new(initial_value: memory_blocks).floyd_cycle.sum
  end

  def part2
    lam, mu = Memory.new(initial_value: memory_blocks).floyd_cycle
    lam
  end
end

class Memory
  attr_reader :initial_value

  def initialize(initial_value:)
    @initial_value = initial_value
  end

  def realloc(memory_blocks)
    max = memory_blocks.max
    max_index = memory_blocks.index(max)

    result = memory_blocks.dup
    result[max_index] = 0

    max.times do |i|
      result[(max_index + 1 + i) % memory_blocks.length] += 1
    end

    result
  end

  def floyd_cycle
    tortoise = realloc(initial_value)
    hare = realloc(realloc(initial_value))

    while tortoise != hare
      tortoise = realloc(tortoise)
      hare = realloc(realloc(hare))
    end

    mu = 0
    tortoise = initial_value

    while tortoise != hare
      tortoise = realloc(tortoise)
      hare = realloc(hare)
      mu += 1
    end

    lam = 1
    hare = realloc(tortoise)
    while tortoise != hare
      hare = realloc(hare)
      lam += 1
    end

    [lam, mu]
  end
end
