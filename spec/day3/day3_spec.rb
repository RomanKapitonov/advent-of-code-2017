require 'spec_helper'
require 'day3/day3'

RSpec.describe Day3 do
  let!(:input) { 347991 }

  describe '#part1' do
    subject(:solver) { described_class.new(point: input) }

    it 'calculates' do
      expect(solver.part1).to eq(480)
    end
  end
end
