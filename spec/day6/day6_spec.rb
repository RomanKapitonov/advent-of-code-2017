require 'spec_helper'
require 'day6/day6'

RSpec.describe Day6 do
  subject(:solver) { described_class.new(memory_blocks: input) }
  let(:input) do
    "5 1 10  0 1 7 13  14  3 12  8 10  7 12  0 6".split(/\s+/).map(&:to_i)
  end

  describe '#part1' do
    it 'solves' do
      expect(solver.part1).to eq(5042)
    end
  end

  describe '#part2' do
    it 'solves' do
      expect(solver.part2).to eq(1086)
    end
  end
end
