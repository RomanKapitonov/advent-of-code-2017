class Day5
  attr_reader :input, :machine

  def initialize(input:)
    @input = input.map(&:to_i)
  end

  def part1
    (0..100000000).each do |tick|
      begin
        part1_machine.step
      rescue Machine::OutOfRange
        return tick
      end
    end
  end

  def part2
    (0..100000000).each do |tick|
      begin
        part2_machine.step
      rescue Machine::OutOfRange
        return tick
      end
    end
  end

  def part1_machine
    @machine1 ||= Machine.new(instructions: input, jumper: ->(*) { 1 })
  end

  def part2_machine
    @machine2 ||= Machine.new(instructions: input, jumper: ->(cell) { cell >= 3 ? -1 : 1 })
  end
end

class Machine
  OutOfRange = Class.new(StandardError)

  attr_accessor :instructions, :pointer, :jumper

  def initialize(instructions:, jumper:)
    @instructions = instructions
    @pointer = 0
    @jumper = jumper
  end

  def step
    raise OutOfRange if instructions[pointer] == nil

    jump_length = instructions[pointer]

    increase_current_cell_by(delta_for(current_cell))
    jump(jump_length)
  end

  def delta_for(cell)
    jumper.call(cell)
  end

  def current_cell
    instructions[pointer]
  end

  def increase_current_cell_by(value)
    instructions[pointer] += value
  end

  def offset
    instructions[pointer]
  end

  def jump(jump_length)
    self.pointer += jump_length
  end
end
