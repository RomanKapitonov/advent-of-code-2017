require 'spec_helper'
require 'day1/day1'

RSpec.describe Day1 do
  shared_examples 'calculates resulting number for part1' do |number:, expected:|
    context "for number #{number}" do
      subject(:solver) { described_class.new(number: number) }

      it "resolves to #{expected}" do
        expect(solver.part1).to eq(expected)
      end
    end
  end

  shared_examples 'calculates resulting number for part2' do |number:, expected:|
    context "for number #{number}" do
      subject(:solver) { described_class.new(number: number) }

      it "resolves to #{expected}" do
        expect(solver.part2).to eq(expected)
      end
    end
  end

  describe '#part1' do
    {
      "1122"                      => 3,
      "1111"                      => 4,
      "1234"                      => 0,
      "91212129"                  => 9,
      File.read('lib/day1/input') => 1029
    }.each do |number, expected|
      include_examples 'calculates resulting number for part1', number: number, expected: expected
    end
  end

  describe '#part2' do
    {
      "1212"                      => 6,
      "1221"                      => 0,
      "123425"                    => 4,
      "123123"                    => 12,
      "12131415"                  => 4,
      File.read('lib/day1/input') => 1220
    }.each do |number, expected|
      include_examples 'calculates resulting number for part2', number: number, expected: expected
    end
  end
end
