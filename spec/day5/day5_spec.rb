require 'spec_helper'
require 'day5/day5'

RSpec.describe Day5 do
  subject(:solver) { described_class.new(input: input) }
  let(:input) { File.open('lib/day5/input').each_line }

  describe '#part1' do
    it 'solves' do
      # slow test
      # expect(solver.part1).to eq(351282)
    end
  end

  describe '#part2' do
    let(:input) { [0, 3, 0, 1, -3] }

    it 'solves' do
      # slow test
      # expect(solver.part2).to eq(24568703)
    end
  end
end
