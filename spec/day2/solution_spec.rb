require 'spec_helper'
require 'day2/solution'

RSpec.describe Solution do
  let(:input_from_file) do
    File.open('lib/day2/input').each_line.map do |line|
      line.split(/\s+/).map(&:to_i)
    end
  end

  describe '#part1' do
    shared_examples 'calculate part1' do |input:, expected:|
      context "for matrix: #{input}" do
        subject(:solver) { described_class.new(matrix: input) }

        it "results to #{expected}" do
          expect(solver.part1).to eq(expected)
        end
      end
    end

    {
      [[5, 1, 9, 5],
       [7, 5, 3],
       [2, 4, 6, 8]] => 18
    }.each do |input, expected|
      include_examples 'calculate part1', input: input, expected: expected
    end

    context 'for input file' do
      subject(:solver) { described_class.new(matrix: input_from_file) }

      it 'calculates' do
        expect(solver.part1).to eq(45972)
      end
    end
  end

  describe '#part2' do
    shared_examples 'calculate part2' do |input:, expected:|
      context "for matrix: #{input}" do
        subject(:solver) { described_class.new(matrix: input) }

        it "results to #{expected}" do
          expect(solver.part2).to eq(expected)
        end
      end
    end

    {
      [[5, 9, 2, 8],
       [9, 4, 7, 3],
       [3, 8, 6, 5]] => 9
    }.each do |input, expected|
      include_examples 'calculate part2', input: input, expected: expected
    end

    context 'for input file' do
      subject(:solver) { described_class.new(matrix: input_from_file) }

      it 'calculates' do
        expect(solver.part2).to eq(326)
      end
    end
  end
end
